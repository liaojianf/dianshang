package com.atguigu.test;

import com.atguigu.bean.Class1;
import com.atguigu.bean.Class2;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.ArrayList;
import java.util.List;

public class GsonMain {
    public static void main(String[] args) {
        //实例化对象
        Class1 class1 = new Class1(1,"手机");
        System.out.println(class1);
        Gson gson = new Gson();
        //对象转换成json
        String json = gson.toJson(class1);
        System.out.println(json);
        Class2 class2 = new Class2();
        //json转换成对象
        Class1 class11 = gson.fromJson(json, Class1.class);
        System.out.println(class11);
        testgosnlist();
    }
    public static void testgosnlist(){
        List<Class1> list = new ArrayList<Class1>();
        list.add(new Class1(1,"电脑办公"));
        list.add(new Class1(2,"服装"));
        list.add(new Class1(3,"生活用品"));
        System.out.println(list);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        System.out.println(json);
        TypeToken<List<Class1>> tt = new TypeToken<List<Class1>>(){};
        ArrayList<Class1> list1 = gson.fromJson(json,tt.getType());
        System.out.println(list1);
    }
}
