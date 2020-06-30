package com.atguigu.bean;

import com.atguigu.bean.T_MALL_ATTR;
import com.atguigu.bean.T_MALL_VALUE;

import java.util.List;

public class OBJECT_T_MALL_ATTR extends T_MALL_ATTR {

	private List<T_MALL_VALUE> list_value;

	public List<T_MALL_VALUE> getList_value() {
		return list_value;
	}

	public void setList_value(List<T_MALL_VALUE> list_value) {
		this.list_value = list_value;
	}


}
