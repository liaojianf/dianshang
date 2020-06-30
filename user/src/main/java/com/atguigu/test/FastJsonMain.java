package com.atguigu.test;

import com.alibaba.fastjson.JSON;
import com.atguigu.bean.Class1;

import java.util.ArrayList;
import java.util.List;


public class FastJsonMain {
    public static void main(String[] args) {
        Class1 class1 = new Class1(1,"手机");
        System.out.println(class1);
        String s = JSON.toJSONString(class1);
        System.out.println(s);
        Class1 class11 = JSON.parseObject(s, Class1.class);
        System.out.println(class11);
        FastJsonlist();
    }
    public static void FastJsonlist(){
        List<Class1> list = new ArrayList<Class1>();
        list.add(new Class1(1,"电脑办公"));
        list.add(new Class1(2,"服装"));
        list.add(new Class1(3,"生活用品"));
        System.out.println(list);
        String str = JSON.toJSONString(list);
        System.out.println(str);
        List<Class1> s = JSON.parseArray(str, Class1.class);
        System.out.println(s);

    }












}
