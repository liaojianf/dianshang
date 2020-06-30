package com.atguigu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {


	@RequestMapping("/goto_spu")
	public String goto_spu(){
		return "spu";
	}

	@RequestMapping("/index")
	public String index(){
		return "main";
	}

	@RequestMapping("/admin")
	public String admin(){
		return "admin";
	}

}
