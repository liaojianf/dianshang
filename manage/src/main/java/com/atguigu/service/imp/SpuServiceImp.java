package com.atguigu.service.imp;

import com.atguigu.bean.MODEL_T_MALL_PRODUCT_COLOR;
import com.atguigu.bean.MODEL_T_MALL_PRODUCT_VERSION;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.mapper.ColorMapper;
import com.atguigu.mapper.T_MALL_PRODUCT_MAPPER;
import com.atguigu.mapper.VersionMapper;
import com.atguigu.service.SpuServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SpuServiceImp implements SpuServiceInf {
    @Autowired
    T_MALL_PROCUCT_SERVICE_IMP t_mall_procuct_service_imp;
    @Autowired
    ColorMapper colorMapper;
    @Autowired
    VersionMapper versionMapper;
    public void save_spu(List<String> list_image, T_MALL_PRODUCT spu, MODEL_T_MALL_PRODUCT_COLOR color, MODEL_T_MALL_PRODUCT_VERSION version) {
        spu.setChjshj(new Date());
        //保存商品信息
        spu.setShp_tp(list_image.get(0));
        t_mall_procuct_service_imp.insertspu(spu);
        //保存图片
        Map<Object,Object> map = new HashMap<Object, Object>();
        map.put("shp_id",spu.getId());
        map.put("list_image",list_image);
        t_mall_procuct_service_imp.insert_image(map);
        Map<Object,Object> colmap = new HashMap<Object, Object>();
        colmap.put("shp_id",spu.getId());
        colmap.put("colmap",color.getList_color());
        colorMapper.insertColor(colmap);
        Map<Object,Object> vermap = new HashMap<Object, Object>();
        vermap.put("shp_id",spu.getId());
        vermap.put("vermap",version.getList_version());
        versionMapper.insertVersion(vermap);
    }


    public List<T_MALL_PRODUCT> getShp_list(int flbh2, int pp_id) {
        return t_mall_procuct_service_imp.getShp_list(flbh2,pp_id);
    }
}
