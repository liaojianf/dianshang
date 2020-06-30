package com.atguigu.service;

import com.atguigu.bean.OBJECT_T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;

import java.util.HashMap;
import java.util.List;

public interface ListServiceInf {
    List<OBJECT_T_MALL_SKU> get_list_by_flbh2(int flbh2);
    List<OBJECT_T_MALL_SKU> get_list_by_attr(List<T_MALL_SKU_ATTR_VALUE> list_attr, int flbh2);
}
