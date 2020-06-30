package com.atguigu.service;

import com.atguigu.bean.T_MALL_ADDRESS;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;

import java.util.List;

public interface AddressServiceInf {
	List<T_MALL_ADDRESS> get_address();
	T_MALL_ADDRESS select_address_byId(int id);
}
