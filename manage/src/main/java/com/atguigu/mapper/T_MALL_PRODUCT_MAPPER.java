package com.atguigu.mapper;

import com.atguigu.bean.T_MALL_PRODUCT;

import java.util.List;
import java.util.Map;

public interface T_MALL_PRODUCT_MAPPER {
    void insertspu(T_MALL_PRODUCT t_mall_product);
    void insert_image(Map<Object, Object> map);
    List<T_MALL_PRODUCT> getShp_list(int flbh2, int pp_id);
}
