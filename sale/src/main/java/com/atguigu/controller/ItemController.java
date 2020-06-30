package com.atguigu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.atguigu.bean.OBJECT_T_MALL_COLVER;
import com.atguigu.service.CVServiceInf;
import com.atguigu.service.imp.CVServiceimp;
import com.atguigu.service.imp.ItemServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.bean.DETAIL_T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.service.ItemServiceInf;

@Controller
public class ItemController {

	@Autowired
	ItemServiceInf itemServiceInf;
	@Autowired
	CVServiceInf cvServiceimpl;


	@RequestMapping("goto_sku_detail")
	public String goto_sku_detail(int sku_id, int spu_id, ModelMap map,Integer cid,Integer vid) {
		if (cid==null&&vid==null){
			cid=4;
			vid=3;
		}
		// 查询商品详细信息对象
		DETAIL_T_MALL_SKU obj_sku = itemServiceInf.get_sku_detail(sku_id);
		// 查询同spu下的相关的其他sku信息
		List<T_MALL_SKU> list_sku = itemServiceInf.get_sku_list_by_spu(spu_id);
		// 查询商品销售属性列表
		List<OBJECT_T_MALL_COLVER> colver = cvServiceimpl.get_colver_by_shp_id(obj_sku.getShp_id());
		// 颜色列表
		// 版本列表
		List<Integer> cvid =new  ArrayList<Integer>();
		cvid.add(cid);
		cvid.add(vid);
		map.put("cvid",cvid);
		map.put("colver",colver);
		map.put("obj_sku", obj_sku);
		map.put("list_sku", list_sku);

		return "skuDetail";
	}

}
