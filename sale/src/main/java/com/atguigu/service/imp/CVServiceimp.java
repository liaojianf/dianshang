package com.atguigu.service.imp;

import com.atguigu.bean.OBJECT_T_MALL_COLVER;
import com.atguigu.mapper.CVMapper;
import com.atguigu.service.CVServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "CVServiceimp")
public class CVServiceimp implements CVServiceInf {
    @Autowired
    CVMapper cvMapper;
    @Override
    public List<OBJECT_T_MALL_COLVER> get_colver_by_shp_id(int shp_id) {
        return cvMapper.select_colver_by_shp_id(shp_id);
    }
}
