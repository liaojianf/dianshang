package com.atguigu.service;

import com.atguigu.bean.T_MALL_SHOPPINGCAR;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;

import java.util.List;

public interface CartServiceInf {
    void add(T_MALL_SHOPPINGCAR shoppingcar);
    void update(T_MALL_SHOPPINGCAR shoppingcar);
    boolean select_cart_exists(T_MALL_SHOPPINGCAR shoppingcar);
    T_MALL_SHOPPINGCAR select_list_cart_by_user(T_MALL_USER_ACCOUNT t_mall_user_account);
    List<T_MALL_SHOPPINGCAR> selet_all(int yh_id);
    T_MALL_USER_ACCOUNT account();
}
