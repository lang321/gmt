package com.gmt.service;

import com.gmt.dao.UserDao;
import com.gmt.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
//开启事务,也可以在每个方法前加
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
public class UserService {
    @Autowired
    @Qualifier("userDao")
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public void addUser(Users user){
        userDao.addUser(user);
    }
    public void updatePwd(){
        Users user1 = new Users();
        user1.setId(1);
        user1.setPassword("00");
        Users user2 = new Users();
        user2.setId(1);
        user2.setPassword("00");
        userDao.updatePwd(user1);
        int i=1/0;
        userDao.updatePwd(user2);
    }
}
