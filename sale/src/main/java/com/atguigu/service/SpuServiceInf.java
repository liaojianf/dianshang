package com.atguigu.service;

import com.atguigu.bean.T_MALL_PRODUCT;
import org.springframework.stereotype.Service;

import java.util.List;

public interface SpuServiceInf {
    public  void save_spu(List<String> list_image, T_MALL_PRODUCT spu);
    public List<T_MALL_PRODUCT> getShp_list(int flbh2, int tm_id);
}
