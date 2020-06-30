package com.atguigu.server.Imp;

import com.atguigu.server.TestServerInf;

public class TestServerImp implements TestServerInf {

	public String ping(String hello) {
		System.out.println("cxf接口调用:" + hello);
		return "pong";
	}

}
