package com.myhome.controller;

import com.myhome.domain.Adv;
import com.myhome.domain.Notification;
import com.myhome.domain.User;
import com.myhome.service.AdvService;
import com.myhome.service.NotificationService;
import com.myhome.service.UserService;
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
import org.springframework.web.servlet.ModelAndView;

import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private Logger logger = LogManager.getLogger(AdminController.class);

    @Autowired
    private AdvService advService;

    @Autowired
    private UserService userService;

    @Autowired
    private NotificationService notificationService;

    @Value("${spring.mail.username}")
    private String adminEmail;

    @GetMapping("/")
    public ModelAndView goIndexPage() {
        ModelAndView mav = new ModelAndView("admin/index");

        int allAdvCount = advService.getAllAdvsCount();
        int pendingAdvCount=advService.getPendingAdvsCount();
        int usersCount = userService.getUsersCount(1);

        mav.addObject("usersCount",usersCount);
        mav.addObject("pendingAdvCount",pendingAdvCount);
        mav.addObject("allAdvCount",allAdvCount);
        return mav;
    }

    @GetMapping("/elanlar")
    public ModelAndView advDatatableIndex(@RequestParam("process_status") String processStatus) {
        ModelAndView mav = new ModelAndView("admin/adv-datatable");
        mav.addObject("processStatus", processStatus);
        return mav;
    }

    @GetMapping("/adv-detail")
    public ModelAndView goDetailPage(@RequestParam(name = "id") long advID) {
        ModelAndView mav = new ModelAndView();
        Adv adv;
        Optional<Adv> optionalAdv = advService.getAdvById(advID);
        if (optionalAdv.isPresent()) {
            adv = optionalAdv.get();
            mav.addObject("adv", adv);
            mav.setViewName("admin/adv-detail");
        }
        return mav;
    }

    @GetMapping("/istifadeciler")
    public ModelAndView userDatatableIndex(@RequestParam(name = "status") int status) {
        ModelAndView mav = new ModelAndView("admin/users-datatable");
        mav.addObject("status", status);
        return mav;
    }

    @GetMapping("/user-advs")
    public ModelAndView goUserDetailPage(@RequestParam(name = "id") long userID) {
        ModelAndView mav = new ModelAndView("admin/user-advs");
        List<Adv> advs = advService.advListByUserId(userID);
        mav.addObject("list", advs);
        return mav;
    }

    @GetMapping("/message")
    public ModelAndView goMessagePage(@RequestParam(name = "userID") long userID) {
        ModelAndView mav = new ModelAndView("admin/message");
        mav.addObject("userID", userID);
        return mav;
    }

    @PostMapping("/send-message")
    public ModelAndView sendMessage(@RequestParam(name = "userID") long userID,
                                    @RequestParam(name = "subject", required = false) String subject,
                                    @RequestParam(name = "content", required = false) String content) {


        ModelAndView mav = new ModelAndView();
        if (subject.isEmpty() || content.isEmpty()) {
            String message = "Boş ola bilməz";
            mav.addObject("message", message);
            mav.setViewName("admin/message");
        } else {
            Optional<User> optionalUser = userService.getUserById(userID);
            if (optionalUser.isPresent()) {
                User user = optionalUser.get();
                String to = user.getEmail();
                Notification notification = new Notification();
                notification.setFrom(adminEmail);
                notification.setTo(to);
                notification.setSubject(subject);
                notification.setContent(content);
                notification.setSource("Adminden mesaj");
                notificationService.insertNotification(notification);
                String message = "Email gonderildi";
                mav.addObject("message", message);
                mav.setViewName("admin/message");
            }
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
