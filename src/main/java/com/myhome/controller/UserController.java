package com.myhome.controller;

import com.myhome.domain.*;
import com.myhome.domain.Adv;
import com.myhome.form.AdvForm;
import com.myhome.form.RegistrationForm;
import com.myhome.service.*;
import com.myhome.util.FormConverter;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/user")
public class UserController {

    private Logger logger = LogManager.getLogger(UserController.class);
    @Autowired
    private CommonService commonService;

    @Autowired
    private AdvService advService;

    @Autowired
    private AdvFormValidationService advFormValidationService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private UserService userService;

    @Value("${spring.mail.username}")
    private String adminEmail;

    @GetMapping({"/",""})
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("user/index");

        Adv adv = new Adv();
        List<Estate> estates = commonService.getEstates();
        List<City> cities = commonService.getCities();
        List<Currency> currencies = commonService.getCurrencies();

        mav.addObject("estates", estates);
        mav.addObject("cities", cities);
        mav.addObject("currencies", currencies);

        System.out.println("currencies  =  " + currencies);
        return mav;
    }

    @PostMapping("/add")
    public ModelAndView addAdv(@RequestParam(name = "file",required = false) MultipartFile file,
                               @RequestParam(name = "type") String type,
                               @RequestParam(name = "estate") String estateId,
                               @RequestParam(name = "document") String document,
                               @RequestParam(name = "condition") String condition,
                               @RequestParam(name = "city") String cityId,
                               @RequestParam(name = "fullAddress") String address,
                               @RequestParam(name = "room") String room,
                               @RequestParam(name = "square") String square,
                               @RequestParam(name = "floor",required = false) String floor,
                               @RequestParam(name = "wifi") String wifi,
                               @RequestParam(name = "tv") String tv,
                               @RequestParam(name = "phone") String phone,
                               @RequestParam(name = "conditioner") String conditioner,
                               @RequestParam(name = "heating") String heating,
                               @RequestParam(name = "detail") String detail,
                               @RequestParam(name = "price") String price,
                               @RequestParam(name = "currency") String currencyId,
                               @SessionAttribute (name = "user") User user) {

        ModelAndView mav = new ModelAndView("user/index");

        AdvForm advForm = new AdvForm();
        advForm.setType(type);
        advForm.setCityId(cityId);
        advForm.setEstateId(estateId);
        advForm.setDocument(document);
        advForm.setCondition(condition);
        advForm.setFullAddress(address);
        advForm.setRoom(room);
        advForm.setSquare(square);
        advForm.setFloor(floor);
        advForm.setWifi(wifi);
        advForm.setPhone(phone);
        advForm.setTv(tv);
        advForm.setConditioner(conditioner);
        advForm.setHeating(heating);
        advForm.setDetail(detail);
        advForm.setPrice(price);
        advForm.setCurrencyId(currencyId);
        advForm.setFile(file);

        Map<String,List<String>> errors = advFormValidationService.validateAdv(advForm);

        if (!errors.isEmpty()){
            mav.addObject("estates",commonService.getEstates());
            mav.addObject("cities",commonService.getCities());
            mav.addObject("currencies",commonService.getCurrencies());
            mav.addObject("errors",errors);
            mav.setViewName("user/index");
        }else{
            Adv adv = new Adv();
            adv.setCity(new City());
            adv.setEstate(new Estate());
            adv.setCurrency(new Currency());
            adv.setMedia(new Media());

            FormConverter.convertToAdv(advForm,adv);
            try {
                adv.getMedia().setInputStream(file.getInputStream());
                adv.getMedia().setOriginalFileName(file.getOriginalFilename());
                adv.getMedia().setMimeType(file.getContentType());
                adv.getMedia().setFileLength(file.getSize());
                adv.getMedia().setMain(true);
            } catch (IOException e) {
                e.printStackTrace();
            }

            advService.addAdv(adv,user.getId());
            mav.setViewName("user/add-adv-success");
        }

        return mav;
    }

    @GetMapping("/adv-datatable")
    public ModelAndView datatable(@RequestParam (name = "process_status") String processStatus){

        ModelAndView mav = new ModelAndView("user/adv-datatable");
        mav.addObject("processStatus",processStatus);
        return mav;
    }


    @GetMapping("/modify-account")
    public ModelAndView goModifyPage(@SessionAttribute (name = "user") User user){
        RegistrationForm form = FormConverter.fromUserToRegisterForm(user);
        ModelAndView mav = new ModelAndView("user/modify-profile");
        mav.addObject("form",form);
        return mav;
    }
    @PostMapping("/modify-account")
    public ModelAndView modifyAccount(@ModelAttribute (name = "form") RegistrationForm form,
                                      @SessionAttribute (name = "user") User usersession){
        User user = FormConverter.fromFormToUser(form);
        ModelAndView mav = new ModelAndView("user/modify-profile");
        System.out.println("user = " + user);
        System.out.println("form = " + form);
        String message = "";
        try{
            userService.updateUser(user,usersession.getId());
            message = "Profiliniz yenilendi";
        }catch (Exception e){
            message = "profiliniz yenilenerken xeta bas verdi";
            e.printStackTrace();
        }
        mav.addObject("message",message);

        return mav;
    }

    @GetMapping("/delete")
    public String goDeletePage(){
        return "user/delete-account"; //jsp
    }

    @GetMapping("/delete-account")
    public String deleteAccount(HttpSession session){
        User user = (User) session.getAttribute("user");
        userService.deleteUser(user);
        session.removeAttribute("user");
        return "redirect:web/index";
    }

    @GetMapping("/adv-detail")
    public ModelAndView goDetailPage(@SessionAttribute (name = "user") User user,
                                     @RequestParam (name = "id") long advID){
        ModelAndView mav = new ModelAndView();
        Adv adv;
        Optional<Adv> optionalAdv = advService.getAdvById(advID);
        if (optionalAdv.isPresent()){
            adv = optionalAdv.get();
            mav.addObject("adv",adv);
            mav.addObject("user",user);
            mav.setViewName("user/adv-detail");
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
