package com.gmt.controller;

import com.gmt.entity.Users;
import com.gmt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/user")
public class MainController {
    @Autowired
    private UserService userService;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value="/index",method= RequestMethod.GET)
    public String index(HttpServletRequest request){
        System.out.println("controller...");
        //spring上下文
//        WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
//        UserService userService = (UserService) springContext.getBean("userService");
        System.out.println(userService);
        Users user = new Users();
        user.setUsername("admin");
        user.setPassword("123");
//        userService.addUser(user);
        System.out.println("999");
        return "index.jsp";
    }
}
