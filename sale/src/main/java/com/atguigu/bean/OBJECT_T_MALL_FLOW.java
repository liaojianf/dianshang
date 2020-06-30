package com.atguigu.bean;

import java.util.Date;
import java.util.List;

public class OBJECT_T_MALL_FLOW extends T_MALL_FLOW{
	//用户个人订单信息
	private List<T_MALL_ORDER_INFO>  order_info;

	public List<T_MALL_ORDER_INFO> getOrder_info() {
		return order_info;
	}

	public void setOrder_info(List<T_MALL_ORDER_INFO> order_info) {
		this.order_info = order_info;
	}

	@Override
	public String toString() {
		return "OBJECT_T_MALL_FLOW{" +
				"order_info=" + order_info +
				'}';
	}
}
