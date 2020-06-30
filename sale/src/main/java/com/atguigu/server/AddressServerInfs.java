package com.atguigu.server;

import com.atguigu.bean.T_MALL_ADDRESS;
import org.springframework.stereotype.Service;

import javax.jws.WebService;

@WebService
@Service
public interface AddressServerInfs {
    String get_address();
    T_MALL_ADDRESS  select_address_byId(int id);
}
