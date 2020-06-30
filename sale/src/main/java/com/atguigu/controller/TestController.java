package com.atguigu.controller;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.server.LoginServerInfs;
import com.atguigu.util.MyJsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {



//    @RequestMapping("ppppp")
//    @ResponseBody
//    public T_MALL_USER_ACCOUNT pp(){
//        T_MALL_USER_ACCOUNT user = new T_MALL_USER_ACCOUNT();
//        user.setYh_mch("admin");
//        user.setYh_mm("123");
//        String login = loginServerInfs.login(user);
//        T_MALL_USER_ACCOUNT t_mall_user_account = MyJsonUtil.json_to_object(login, T_MALL_USER_ACCOUNT.class);
//        System.out.println(t_mall_user_account);
//        return t_mall_user_account;
//
//    }
//    @ResponseBody
//    @RequestMapping("ws")
//    public String pppppp() throws Exception {
//        T_MALL_USER_ACCOUNT user = new T_MALL_USER_ACCOUNT();
//        user.setYh_mch("admin");
//        user.setYh_mm("123");
////        JaxWsProxyFactoryBean myWsFactoryBeanObject = (JaxWsProxyFactoryBean) myWsFactoryBean.getObject();
////			LoginServerInf create = (LoginServerInf) myWsFactoryBeanObject.create();
////			String loginJson = create.login(user);
////        T_MALL_USER_ACCOUNT t_mall_user_account = MyJsonUtil.json_to_object(loginJson, T_MALL_USER_ACCOUNT.class);
////        System.out.println(t_mall_user_account);
//        	JaxWsProxyFactoryBean jwfb = new JaxWsProxyFactoryBean();
//			jwfb.setAddress(MyPropertyUtil.getProperty("ws.properties","login_url"));
//			jwfb.setServiceClass(LoginServerInf.class);
//			LoginServerInf create = (LoginServerInf) jwfb.create();
//        String loginJson = create.login(user);
//        System.out.println(loginJson);
//			user = MyJsonUtil.json_to_object(loginJson,T_MALL_USER_ACCOUNT.class);
//			System.out.println(user);
//        return "ws";
//    }
}
