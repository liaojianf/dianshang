package com.atguigu.service.imp;

import java.util.Date;
import java.util.List;


import com.atguigu.service.AttrServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.mapper.AttrMapper;

@Service(value = "AttrServiceImp")
public class AttrServiceImp implements AttrServiceInf {

	@Autowired
	AttrMapper attrMapper;

	public void save_attr(int flbh2, List<OBJECT_T_MALL_ATTR> list_attr) {
		for (int i = 0; i < list_attr.size(); i++) {
			list_attr.get(i).setChjshj(new Date());
			// 插入属性，返回主键
			OBJECT_T_MALL_ATTR attr = list_attr.get(i);
			attrMapper.insert_attr(flbh2, attr);

			// 获得返回主键批量插入属性值
			attr.getList_value().get(0).setChjshj(new Date());
			attr.getList_value().get(1).setChjshj(new Date());
			attrMapper.insert_values(attr.getId(), attr.getList_value());
		}

	}

	public List<OBJECT_T_MALL_ATTR> get_attr_list(int flbh2) {
		List<OBJECT_T_MALL_ATTR> list_attr = attrMapper.select_attr_list(flbh2);
		return list_attr;
	}

}
