package com.atguigu.util;


import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.springframework.beans.factory.FactoryBean;

//继承了FactoryBean的类不会直接调用FactoryBean的构造器去创建bean 而是通过getObject将结果返回给spring容器
//好处：让程序员参与到spring容器的创建过程，一般的bean，项目一启动就自动加载到ioc容器中，而这个需要调用getObject方法才生成bean
//继承抽象类  实现回调函数
public class MyWsFactoryBeans<T> implements FactoryBean<T> {
    private String url;
    private Class<T> t;
    public static <T> T getMyWs(String url, Class<T> t){//List<int> list
        System.out.println("来咯来咯...");
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
     //再spring容器启动时，如果有类继承了FactoryBean，那就会自动调用getObject()方法
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
