package com.atguigu.mapper;

import com.atguigu.bean.T_MALL_ADDRESS;

import java.util.List;

public interface AddressMapper {
    List<T_MALL_ADDRESS> select_address();
    T_MALL_ADDRESS select_address_byId(int id);
}
