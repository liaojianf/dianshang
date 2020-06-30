package com.atguigu.service.imp;

import com.atguigu.mapper.IndexMapper;
import com.atguigu.service.IndexServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service(value = "IndexServiceImp")
public class IndexServiceImp implements IndexServiceInf {
	@Autowired
	IndexMapper indexMapper;

	@Override
	public void log(Map<String,Object> map) {
		indexMapper.log(map);
	}
}
