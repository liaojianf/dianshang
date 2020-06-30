package com.atguigu.service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;

import java.util.List;
import java.util.Map;

public interface SkuServiceInf {
    void insert_sku(T_MALL_SKU sku);

    void insert_sku_av(Map<Object, Object> map);

    void save_sku(T_MALL_SKU sku, T_MALL_PRODUCT spu, List<T_MALL_SKU_ATTR_VALUE> list_attr);
}
