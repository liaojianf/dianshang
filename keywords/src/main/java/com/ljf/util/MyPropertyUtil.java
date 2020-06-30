package com.ljf.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class MyPropertyUtil {

    public static String getProperty(String pro,String key){
        //1.new Properties对象 java -Dsolr.solr.home=atguigu1018 -jar start.jar
        Properties properties = new Properties();
        //2.获取本类的输入流
        InputStream resourceAsStream = MyPropertyUtil.class.getClassLoader().getResourceAsStream(pro);
        //3.加载输入流文件
        try {
            properties.load(resourceAsStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //4.根据传入的key获取对应的属性值
        String property = properties.getProperty(key);
        return property;
    }
}
