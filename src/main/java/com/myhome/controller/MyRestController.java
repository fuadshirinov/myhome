package com.myhome.controller;

import com.myhome.domain.DataTableResult;
import com.myhome.domain.User;
import com.myhome.service.AdvService;
import com.myhome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/rest")
public class MyRestController {

    @Autowired
    private AdvService advService;

    @Autowired
    private UserService userService;


    @GetMapping("/user-adv-datatable")
    public DataTableResult getAdv(@RequestParam("draw") int draw,
                               @RequestParam("start") int start,
                               @RequestParam("length") int length,
                               @SessionAttribute (name = "user") User user,
                               @RequestParam (name = "process_status") int processStatus){

        DataTableResult result = advService.getAdvAjax(user.getId(),processStatus,draw,start,length);
        System.out.println("result = " + result);
        return result;
    }

    @GetMapping("/admin-adv-datatable")
    public DataTableResult getAdvForAdmin(@RequestParam("draw") int draw,
                                               @RequestParam("start") int start,
                                               @RequestParam("length") int length,
                                               @RequestParam("process_status") int processStatus){
        DataTableResult result = advService.getAdvForAdminDatatable(processStatus, draw, start, length);
        return result;
    }

    @GetMapping("/admin-user-datatable")
    public DataTableResult getUsers(@RequestParam("draw") int draw,
                                          @RequestParam("start") int start,
                                          @RequestParam("length") int length,
                                          @RequestParam("status") int status){

        DataTableResult result = userService.getUsersForAdminDatatable(status, draw, start, length);
        return result;
    }


    @GetMapping("/activate-adv")
    public boolean activateAdv(@RequestParam(name = "id") long id) {
        return advService.activateAdv(id);
    }

    @GetMapping("/ignore-adv")
    public boolean ignoreAdv(@RequestParam(name = "id") long id) {
        return advService.deleteAdv(id);
    }

}
