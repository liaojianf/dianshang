package com.atguigu.controller;

import com.atguigu.bean.User;
import com.atguigu.service.IndexServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class IndexController {
    @Autowired
    User user;
    @Autowired
    IndexServiceInf indexServiceImp;

    @RequestMapping("user")
    public void pp(){
        System.out.println(user);
    }

    @ResponseBody
    @RequestMapping("index")
    public String log(String message){
        System.out.println(message);
        Date dates = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        String format = simpleDateFormat.format(dates.getTime());
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("message",message);
        map.put("date",format);
        indexServiceImp.log(map);
        return message;
    }

}
