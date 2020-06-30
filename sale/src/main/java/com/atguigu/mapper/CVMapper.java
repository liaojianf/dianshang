package com.atguigu.mapper;

import com.atguigu.bean.OBJECT_T_MALL_COLVER;

import java.util.List;

public interface CVMapper {
    List<OBJECT_T_MALL_COLVER> select_colver_by_shp_id(int shp_id);
}
