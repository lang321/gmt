package com.gmt.controller;

import com.gmt.entity.Users;
import com.gmt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/user")
public class MainController {
    @Autowired
    @Qualifier("userService")
    private UserService userService;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value="/index",method= RequestMethod.POST)
    @ResponseBody
    public Object index(HttpServletRequest request){
        //spring上下文
        System.out.println(userService);
        Users user = new Users();
        user.setId(1);
        user.setUsername("admin");
        user.setPassword("123");
//        userService.addUser(user);
        return user;
    }
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public Object login(){
        System.out.println("login get...");
        return "forward:/WEB-INF/views/user/login.jsp";
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public Object login(Users user){
        System.out.println("login post...");
        System.out.println(user.getUsername() + ":" +user.getPassword());
        return "/user/login.jsp";
    }
}
