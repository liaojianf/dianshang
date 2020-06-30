package com.atguigu.bean;

import com.atguigu.bean.OBJECT_AV_NAME;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_PRODUCT_IMAGE;
import com.atguigu.bean.T_MALL_SKU;

import java.util.List;

public class DETAIL_T_MALL_SKU extends T_MALL_SKU {
//	private int id;
//	private int shp_id;
//	private int kc;
//	private BigDecimal jg;
//	private Date chjshj;
//	private String sku_mch;
//	private String kcdz;
//	private long sku_xl;
	private T_MALL_PRODUCT spu;
	private List<T_MALL_PRODUCT_IMAGE> list_image;
	private List<OBJECT_AV_NAME> list_av_name;

	public T_MALL_PRODUCT getSpu() {
		return spu;
	}

	public void setSpu(T_MALL_PRODUCT spu) {
		this.spu = spu;
	}

	public List<T_MALL_PRODUCT_IMAGE> getList_image() {
		return list_image;
	}

	public void setList_image(List<T_MALL_PRODUCT_IMAGE> list_image) {
		this.list_image = list_image;
	}

	public List<OBJECT_AV_NAME> getList_av_name() {
		return list_av_name;
	}

	public void setList_av_name(List<OBJECT_AV_NAME> list_av_name) {
		this.list_av_name = list_av_name;
	}

}
