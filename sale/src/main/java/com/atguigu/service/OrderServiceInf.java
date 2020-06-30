package com.atguigu.service;

import com.atguigu.bean.OBJECT_T_MALL_FLOW;
import com.atguigu.bean.OBJECT_T_MALL_ORDER;
import com.atguigu.bean.T_MALL_ADDRESS;
import com.atguigu.exception.OverSaleException;

import java.util.Map;

public interface OrderServiceInf {
    void insert_order(Map<Object, Object> map);

    void insert_flow(Map<Object, Object> map1);

    void insert_infos(Map<Object, Object> map);

    void update_order(OBJECT_T_MALL_ORDER order);

    void update_flow(OBJECT_T_MALL_FLOW object_T_MALL_FLOW);

    void delete_carts(Map<Object, Object> map_cart);
    void paySuccess(OBJECT_T_MALL_ORDER order) throws OverSaleException;

    void save_order(T_MALL_ADDRESS t_mall_address, OBJECT_T_MALL_ORDER order);

}
