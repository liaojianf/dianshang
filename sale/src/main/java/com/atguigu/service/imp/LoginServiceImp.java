package com.atguigu.service.imp;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.mapper.LoginMapper;
import com.atguigu.service.LoginServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "LoginServiceImp")
public class LoginServiceImp implements LoginServiceInf {
	@Autowired
	LoginMapper loginMapper;
	@Override
	public T_MALL_USER_ACCOUNT select_user(T_MALL_USER_ACCOUNT user) {
		return loginMapper.select_user(user);
	}
}
