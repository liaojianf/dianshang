package com.atguigu.util;


import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.apache.cxf.ws.security.wss4j.WSS4JOutInterceptor;
import org.apache.wss4j.dom.handler.WSHandlerConstants;
import org.springframework.beans.factory.FactoryBean;

import java.util.HashMap;
public class TestBean2<T> implements FactoryBean<T>{
    private String url;
    private Class<T> t;
    public static <T> T getMyWs(String url, Class<T> t){//List<int> list
        JaxWsProxyFactoryBean jwfb = new JaxWsProxyFactoryBean();
        jwfb.setAddress(url);
        jwfb.setServiceClass(t);
        //加入安全协议
        // 加入安全协议
//        if (t.getSimpleName().equals("LoginServerInf")) {
//            HashMap<String, Object> hashMap = new HashMap<String, Object>();
//            hashMap.put(WSHandlerConstants.ACTION, WSHandlerConstants.USERNAME_TOKEN);
//            hashMap.put(WSHandlerConstants.PASSWORD_TYPE, "PasswordText");
//            hashMap.put("user", "username");
//            hashMap.put(WSHandlerConstants.PW_CALLBACK_CLASS, MyCallback.class.getName());
//            WSS4JOutInterceptor wss4jOutInterceptor = new WSS4JOutInterceptor(hashMap);
//            jwfb.getOutInterceptors().add(wss4jOutInterceptor);
//        }
        T create = (T)jwfb.create();
        return create;
    }

    //创建bean自动调用这个方法返回
    //这个bean是什么
    @Override
    public T getObject(){
        return getMyWs(url,this.t);
    }
    //bean的类型
    @Override
    public Class<?> getObjectType(){
        return this.t;
    }
    //bean是否是单例
    @Override
    public boolean isSingleton(){
        return false;
    }

    public String getUrl(){
        return url;
    }

    public void setUrl(String url){
        this.url = url;
    }

    public Class<T> getT(){
        return t;
    }

    public void setT(Class<T> t){
        this.t = t;
    }
}
