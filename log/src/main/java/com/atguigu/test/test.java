package com.atguigu.test;

import com.atguigu.bean.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {
    @Autowired
    User user;

    @Test
    public  void main() {
        ApplicationContext ioc= new ClassPathXmlApplicationContext("applicationContext.xml");
        User user = (User) ioc.getBean("user");
        System.out.println(user);
    }
}
