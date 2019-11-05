package com.myhome.controller;

import com.myhome.domain.*;
import com.myhome.form.RegistrationForm;
import com.myhome.service.AdvService;
import com.myhome.service.CommonService;
import com.myhome.service.UserService;
import com.myhome.util.FormConverter;
import com.myhome.validator.RegistrationFormValidator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/")
public class WebController {

    private Logger logger = LogManager.getLogger(WebController.class);

    @Autowired
    private RegistrationFormValidator registrationFormValidator;

    @Autowired
    private UserService userService;

    @Autowired
    private AdvService advService;

    @Autowired
    private CommonService commonService;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        if (dataBinder.getTarget() != null && dataBinder.getTarget().getClass() == RegistrationForm.class) {
            dataBinder.setValidator(registrationFormValidator);
        }
    }

    @GetMapping("/")
    public ModelAndView getIndexPage() {
        ModelAndView mav = new ModelAndView("web/index");
        List<City> cities = commonService.getCities();
        List<Estate> estates = commonService.getEstates();
        List<Adv> advList = advService.getAdvByCount(20);
        mav.addObject("cities", cities);
        mav.addObject("estates", estates);
        mav.addObject("list", advList);

        return mav;
    }

    @GetMapping("/login")
    public String goLoginPage() {
        return "web/login";
    }


    @GetMapping("/register")
    public ModelAndView getRegisterPage() {
        ModelAndView mav = new ModelAndView("web/register");
        RegistrationForm registrationForm = new RegistrationForm();
        mav.addObject("form", registrationForm);
        return mav;
    }

    @PostMapping("/register")
    public ModelAndView register(@ModelAttribute(name = "form") @Validated RegistrationForm form,
                                 BindingResult bindingResult) {
        ModelAndView mav = new ModelAndView("web/register");
        if (bindingResult.hasErrors()) {
            mav.setViewName("web/register");
            mav.addObject("form", form);
        } else {
            User user = FormConverter.fromFormToUser(form);
            userService.insertUser(user);
            mav.setViewName("web/register-success");
        }
        return mav;
    }

    @GetMapping("/activate")
    public ModelAndView activateUser(@RequestParam(name = "token") String token) {
        Optional<User> optionalUser = Optional.empty();
        optionalUser = userService.getUserByToken(token);
        User user = new User();
        if (optionalUser.isPresent()) {
            user = optionalUser.get();
        }
        userService.activateUser(user);
        ModelAndView mav = new ModelAndView("redirect:activated");
        return mav;
    }

    @GetMapping("/activated")
    public String goActivatedPage() {
        return "web/user-activated";
    }

    @GetMapping("/activation-error")
    public String activationError() {
        return "web/activation-error";
    }

    @GetMapping("/basic-search")
    public ModelAndView basicSearchResult(@RequestParam(name = "type", required = false) Integer type,
                                          @RequestParam(name = "estate_type", required = false) Long estateId,
                                          @RequestParam(name = "condition", required = false) Integer condition,
                                          @RequestParam(name = "room-min", required = false) Integer roomMin,
                                          @RequestParam(name = "room-max", required = false) Integer roomMax,
                                          @RequestParam(name = "price-min", required = false) BigDecimal priceMin,
                                          @RequestParam(name = "price-max", required = false) BigDecimal priceMax,
                                          @RequestParam(name = "sq-min", required = false, defaultValue = "1") BigDecimal squareMin,
                                          @RequestParam(name = "sq-max", required = false) BigDecimal squareMax,
                                          @RequestParam(name = "city-id", required = false) Long cityId
    ) {


        ModelAndView mav = new ModelAndView("web/search-result");
        BasicSearch basicSearch = new BasicSearch();
        basicSearch.setType(type);
        basicSearch.setEstateId(estateId);
        basicSearch.setCondition(condition);
        basicSearch.setRoomMin(roomMin);
        basicSearch.setRoomMax(roomMax);
        basicSearch.setPriceMin(priceMin);
        basicSearch.setPriceMax(priceMax);
        basicSearch.setSquareMin(squareMin);
        basicSearch.setSquareMax(squareMax);
        basicSearch.setCityId(cityId);


        List<Adv> searchResult = advService.basicSearch(basicSearch);
        List<City> cities = commonService.getCities();
        List<Estate> estates = commonService.getEstates();

        String message = "Axtarışa uyğun nəticə tapılmadı";
        if (searchResult.size() == 0) {
            mav.addObject("message", message);
        } else {
            mav.addObject("list", searchResult);
        }


        mav.addObject("cities", cities);
        mav.addObject("estates", estates);


        return mav;
    }

    @GetMapping("/adv-detail")
    public ModelAndView goDetailPage(@RequestParam(name = "id") long advID) {
        ModelAndView mav = new ModelAndView("web/detail");
        Adv adv;
        User user;
        Optional<Adv> optionalAdv = advService.getAdvById(advID);
        Optional<User> optionalUser = userService.getUserByAdvId(advID);

        if (optionalAdv.isPresent()) {
            adv = optionalAdv.get();
            mav.addObject("adv", adv);
        }
        if (optionalUser.isPresent()) {
            user = optionalUser.get();
            mav.addObject("user", user);
        }
        return mav;
    }


    @GetMapping("/image")
    public ResponseEntity<Resource> getImage(@RequestParam(name = "advID") long advID) {

        Optional<Adv> optionalAdv = advService.getAdvById(advID);
        Adv adv;
        String fileName = "";
        if (optionalAdv.isPresent()) {
            adv = optionalAdv.get();
            fileName = adv.getMedia().getFilename();
        }
        try {
            Path file = Paths.get("/root/myhome-images/" + fileName);
            Resource resource = new UrlResource(file.toUri());
            if (resource.exists() || resource.isReadable()) {
                System.out.println(resource.getFilename());
                System.out.println("Done");
                return new ResponseEntity<>(resource, HttpStatus.OK);
            } else {
                throw new RuntimeException();

            }
        } catch (MalformedURLException e) {
            throw new RuntimeException();
        }

    }

}
