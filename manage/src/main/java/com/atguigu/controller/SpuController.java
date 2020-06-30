package com.atguigu.controller;


import com.atguigu.bean.*;
import com.atguigu.service.imp.AttrServiceImp;
import com.atguigu.service.imp.SkuServiceImp;
import com.atguigu.service.imp.SpuServiceImp;
import com.atguigu.service.imp.T_MALL_PROCUCT_SERVICE_IMP;
import com.atguigu.util.MyFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class SpuController {
	@Autowired
	SpuServiceImp spuServiceImp;


	@Autowired
	T_MALL_PROCUCT_SERVICE_IMP t_mall_procuct_service_imp;

	@ResponseBody
	@RequestMapping("/get_shp_list")
	public List<T_MALL_PRODUCT> get_sh_list(int flbh2,int pp_id,ModelMap map){

		List<T_MALL_PRODUCT> shp_list = t_mall_procuct_service_imp.getShp_list(flbh2, pp_id);
		map.put("shp_list",shp_list);
		return shp_list;
	}
	@RequestMapping("goto_spu_add")
	public String goto_spu_add(ModelMap map,T_MALL_PRODUCT spu){
		map.put("spu", spu);
		return "spuAdd";
	}

	@RequestMapping("spu_add")
	public ModelAndView spu_add(@RequestParam("files") MultipartFile[] files, T_MALL_PRODUCT spu, MODEL_T_MALL_PRODUCT_COLOR color, MODEL_T_MALL_PRODUCT_VERSION version) throws UnsupportedEncodingException {
		for (int a=0;a<color.getList_color().size();a++){
			System.out.println(color.getList_color().get(a).getShp_ys()+"  "+version.getList_version().get(a).getShp_bb());

		}
		//上传图片
		List<String>list_image = MyFileUpload.upload_image(files);
		//保存商品信息
		spuServiceImp.save_spu(list_image,spu,color,version);
		ModelAndView mv = new ModelAndView("redirect:/goto_spu_add.do");
		mv.addObject("flbh1", spu.getFlbh1());
		mv.addObject("flbh2", spu.getFlbh2());
		mv.addObject("pp_id", spu.getPp_id());

		return mv;
	}






















}
