package com.atguigu.server;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;

import javax.jws.WebService;

@WebService
public interface UserInf {
    String login(T_MALL_USER_ACCOUNT user);
    String login2(T_MALL_USER_ACCOUNT user);
    String register(T_MALL_USER_ACCOUNT user);;

}
