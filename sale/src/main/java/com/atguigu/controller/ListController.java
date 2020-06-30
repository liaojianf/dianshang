package com.atguigu.controller;

import com.atguigu.bean.KEYWORDFS_T_MALL_SKU;
import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_SKU;
import com.atguigu.service.AttrServiceInf;
import com.atguigu.service.ListServiceInf;
import com.atguigu.service.imp.ListServiceImp;
import com.atguigu.util.MyHttpGetUtil;
import com.atguigu.util.MyJsonUtil;
import com.atguigu.util.MyPropertyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ListController {
    @Autowired
    AttrServiceInf attrServiceInf;
    @Autowired
    ListServiceInf listServiceImp;

    @RequestMapping("keywords")
    public String keywords(String keywords,ModelMap map) throws Exception {
        //调用keyword的关键词接口
        String  str = new String(keywords.getBytes("ISO8859_1"), "UTF-8");

        String keyword_url= MyPropertyUtil.getProperty("ws.properties","keys_url")+"?keywords="+str;
//        String  str = new String(keyword.getBytes("ISO8859_1"), "UTF-8");字符转码

        String doGet = MyHttpGetUtil.doGet(keyword_url);
        List<KEYWORDFS_T_MALL_SKU> keywordfs_t_mall_skus = MyJsonUtil.json_to_list(doGet, KEYWORDFS_T_MALL_SKU.class);
        System.out.println(keywordfs_t_mall_skus);

        map.put("keywords",str);

        map.put("sku_list",keywordfs_t_mall_skus);
        return "search";
    }
    @RequestMapping("goto_list")
    public String goto_list(int flbh2, ModelMap map) {

        // flbh2属性的集合
        List<OBJECT_T_MALL_ATTR> list_attr = attrServiceInf.get_attr_list(flbh2);

        // flbh2商品列表
        List<OBJECT_T_MALL_SKU> list_sku = new ArrayList<OBJECT_T_MALL_SKU>();

        // 缓存检索
        String key = "class_2_" + flbh2;
//        list_sku = MyCacheUtil.getList(key, OBJECT_T_MALL_SKU.class);

//        if (list_sku == null || list_sku.size() < 1) {
//            // mysql检索
            list_sku = listServiceImp.get_list_by_flbh2(flbh2);
//
//            // 将检索结果同步到redis
//        }
//        list_sku.get(0).getSku_mch()
        map.put("list_attr", list_attr);
        map.put("list_sku", list_sku);
        map.put("flbh2", flbh2);
        return "list";
    }
    @RequestMapping("/get_list_by_attr")
    public String get_list_by_attr(int flbh2,MODEL_T_MALL_SKU_ATTR_VALUE attr_value, ModelMap map){
        System.out.println(flbh2);
        List<OBJECT_T_MALL_SKU> list_sku = listServiceImp.get_list_by_attr(attr_value.getList_attr(),flbh2);
        map.put("list_sku",list_sku);
        return "skulist";
    }
}
