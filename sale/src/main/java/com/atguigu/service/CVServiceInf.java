package com.atguigu.service;

import com.atguigu.bean.OBJECT_T_MALL_COLVER;

import java.util.List;

public interface CVServiceInf {
    List<OBJECT_T_MALL_COLVER> get_colver_by_shp_id(int shp_id);
}
