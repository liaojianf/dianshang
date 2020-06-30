package com.atguigu.server;

import com.atguigu.bean.T_MALL_ADDRESS;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface AddressServerInf {
    String get_address();
    T_MALL_ADDRESS select_address_byId(int id);
}
