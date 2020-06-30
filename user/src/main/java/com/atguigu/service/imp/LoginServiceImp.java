package com.atguigu.service.imp;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.mapper.LoginMapper;
import com.atguigu.service.LoginServiceInf;
import com.atguigu.util.MyRoutingDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImp implements LoginServiceInf {
	@Autowired
    LoginMapper loginMapper;
//	MyRoutingDataSource myRoutingDataSource = new MyRoutingDataSource();
	public T_MALL_USER_ACCOUNT login(T_MALL_USER_ACCOUNT user) {

		return loginMapper.select_user(user);
	}
	public T_MALL_USER_ACCOUNT login2(T_MALL_USER_ACCOUNT user) {

		try{
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		return loginMapper.select_user(user);
	}

	public void register(T_MALL_USER_ACCOUNT user) {
		loginMapper.register(user);
	}


}
