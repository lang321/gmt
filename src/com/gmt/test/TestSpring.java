package com.gmt.test;


import com.gmt.entity.Users;
import com.gmt.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestSpring {
    @Autowired
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Test
    public void test(){
        Users user = new Users();
//        user.setId(1);
        user.setUsername("admin");
        user.setPassword("123");
//        userService.addUser(user);
        userService.updatePwd();
    }
}
