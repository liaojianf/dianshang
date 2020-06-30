package com.atguigu.mapper;

import com.atguigu.bean.OBJECT_T_MALL_SKU;

import java.util.HashMap;
import java.util.List;

public interface ListMapper {
    List<OBJECT_T_MALL_SKU> get_list_by_flbh2(int flbh2);
    List<OBJECT_T_MALL_SKU>select_list_by_attr(HashMap<Object,Object> hashMap);
}
