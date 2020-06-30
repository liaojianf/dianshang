package com.atguigu.test;

import com.atguigu.util.MyHttpGetUtil;
import com.atguigu.util.MyPropertyUtil;

public class test {
    public static void main(String[] args) throws Exception {

             MyHttpGetUtil.doGet(MyPropertyUtil.getProperty("ws.properties", "log_url")+"=ABC");

    }
}
