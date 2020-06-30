package com.atguigu.bean;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class OBJECT_T_MALL_ORDER extends T_MALL_ORDER {
	List<OBJECT_T_MALL_FLOW> list_flow;

	public List<OBJECT_T_MALL_FLOW> getList_flow(){
		return list_flow;
	}

	public void setList_flow(List<OBJECT_T_MALL_FLOW> list_flow){
		this.list_flow = list_flow;
	}

	@Override
	public String toString() {
		return "OBJECT_T_MALL_ORDER{" +
				"list_flow=" + list_flow +
				'}';
	}
}
