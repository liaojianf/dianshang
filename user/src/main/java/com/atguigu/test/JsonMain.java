package com.atguigu.test;

import com.atguigu.bean.Class1;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class JsonMain {
    public static void main(String[] args){
        Class1 class1 = new Class1(2,"手机");
        System.out.println(class1);
        JSONObject jsonObject =  JSONObject.fromObject(class1);
        String str = jsonObject.toString();
        System.out.println(str);
        Object bean = JSONObject.toBean(jsonObject, Class1.class);
        System.out.println(bean);
        testjsonlist();
    }
    public static void testjsonlist(){
        List<Class1> list = new ArrayList<Class1>();
        list.add(new Class1(1,"电脑办公"));
        list.add(new Class1(2,"服装"));
        list.add(new Class1(3,"生活用品"));
        System.out.println(list);
        //对象集合转换成json数据
        JSONArray jsonObject = JSONArray.fromObject(list);
        System.out.println(jsonObject);
        //json数据转换成对象集合
        List<Class1> list1 = (List<Class1>) JSONArray.toCollection(jsonObject,Class1.class);
        System.out.println(list1);
    }
}
