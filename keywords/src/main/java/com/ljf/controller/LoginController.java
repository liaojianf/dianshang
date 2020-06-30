package com.ljf.controller;

import com.ljf.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.ljf.bean.T_MALL_USER_ACCOUNT;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	@RequestMapping(value="login",produces="text/html; charset=UTF-8")
	@ResponseBody
	public String login(MODEL_T_MALL_SKU_ATTR_VALUE list_attr,T_MALL_USER_ACCOUNT user) {
		return "成功";
	}

}
