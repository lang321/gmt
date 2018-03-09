package com.gmt.dao;

import com.gmt.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("userDao")
public class UserDao {
    //使用hibernate模板，底层使用的还是session
    @Autowired
    @Qualifier("hibernateTemplate")
    private HibernateTemplate hibernateTemplate;

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    public void addUser(Users user){
        System.out.println("dao add user...");
//        hibernateTemplate.save(user);
        List<Users> usersList = (List<Users>) hibernateTemplate.find("from com.gmt.entity.Users");

        System.out.println("");
    }
    public void updatePwd(Users user){
        hibernateTemplate.update(user);
    }
}
