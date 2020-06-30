package com.atguigu.service.imp;

import com.atguigu.bean.T_MALL_ADDRESS;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.mapper.AddressMapper;
import com.atguigu.mapper.LoginMapper;
import com.atguigu.server.AddressServerInf;
import com.atguigu.service.AddressServiceInf;
import com.atguigu.service.LoginServiceInf;
import com.atguigu.util.MyRoutingDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImp implements AddressServiceInf {
	@Autowired
	AddressMapper addressMapper;
	public List<T_MALL_ADDRESS> get_address() {
		return addressMapper.select_address();
	}

	public T_MALL_ADDRESS select_address_byId(int id) {
		return addressMapper.select_address_byId(id);
	}
}
