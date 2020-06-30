package com.atguigu.service.imp;

import com.atguigu.bean.T_MALL_SHOPPINGCAR;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.mapper.CartMapper;
import com.atguigu.service.CartServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "CartServiceImp")
public class CartServiceImp implements CartServiceInf {
    @Autowired
    CartMapper cartMapper;
    @Override
    public void add(T_MALL_SHOPPINGCAR shoppingcar) {
        cartMapper.insert(shoppingcar);
    }

    public void update(T_MALL_SHOPPINGCAR shoppingcar) {
        cartMapper.update(shoppingcar);
    }

    @Override
    public boolean select_cart_exists(T_MALL_SHOPPINGCAR shoppingcar) {
        int count = cartMapper.select_cart_exists(shoppingcar);
        if (count>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public T_MALL_SHOPPINGCAR select_list_cart_by_user(T_MALL_USER_ACCOUNT t_mall_user_account) {
        return null;
    }

    @Override
    public List<T_MALL_SHOPPINGCAR> selet_all(int yh_id) {
        return cartMapper.selet_all(yh_id);
    }

    @Override
    public T_MALL_USER_ACCOUNT account() {
        return cartMapper.account();
    }
}
