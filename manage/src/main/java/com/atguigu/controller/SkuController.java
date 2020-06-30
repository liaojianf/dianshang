package com.atguigu.controller;

import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.service.imp.AttrServiceImp;
import com.atguigu.service.imp.SkuServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class SkuController {
    @Autowired
    AttrServiceImp attrServiceImp;
    @Autowired
    SkuServiceImp skuServiceImp;

    @RequestMapping("/save_sku")
    public ModelAndView sku_add(int flbh1, int flbh2, MODEL_T_MALL_SKU_ATTR_VALUE list_attr, ModelMap map,
                                T_MALL_SKU sku, T_MALL_PRODUCT spu){
        System.out.println(sku.getId()+"   "+spu.getId());
        skuServiceImp.save_sku(sku,spu,list_attr.getList_attr());
        System.out.println(list_attr.getList_attr().get(0).getShxm_id());
        ModelAndView mv = new ModelAndView("redirect:/goto_sku_add.do");
        List<OBJECT_T_MALL_ATTR> list_attrs = attrServiceImp.get_attr_list(flbh2);
        mv.addObject("flbh1",flbh1);
        mv.addObject("flbh2",flbh2);
        mv.addObject("list_attr",list_attrs);
        return mv;
    }

    @RequestMapping("/goto_sku")
    public String goto_sku(){
        return "sku";
    }

    @RequestMapping("/goto_sku_add")
    public String goto_sku_add(int flbh1,int flbh2, ModelMap map){
        List<OBJECT_T_MALL_ATTR> list_attr = attrServiceImp.get_attr_list(flbh2);
        map.put("flbh1",flbh1);
        map.put("flbh2",flbh2);
        map.put("list_attr",list_attr);
        return "skuAdd";
    }
}
