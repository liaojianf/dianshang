package com.atguigu.service.imp;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.mapper.T_MALL_PRODUCT_MAPPER;
import com.atguigu.service.T_MALL_PRODUCT_SERVICE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class T_MALL_PROCUCT_SERVICE_IMP implements T_MALL_PRODUCT_SERVICE {
    @Autowired
    T_MALL_PRODUCT_MAPPER t_mall_product_mapper;
    public void insertspu(T_MALL_PRODUCT t_mall_product) {
        t_mall_product_mapper.insertspu(t_mall_product);
    }

    public void insert_image(Map<Object,Object> map) {
        t_mall_product_mapper.insert_image(map);
    }

    @Override
    public List<T_MALL_PRODUCT> getShp_list(int flbh2, int pp_id) {
        System.out.println(flbh2+"-->"+pp_id);
        return t_mall_product_mapper.getShp_list(flbh2,pp_id);
    }
}
