//package com.atguigu.util;
//
//import com.atguigu.server.UserInf;
//import com.atguigu.service.imp.UserImp;
//import org.springframework.beans.factory.FactoryBean;
//
//public class TestBean implements FactoryBean {
//    private int age;
//    private String sex;
//
//    public static UserInf bean(int age, String sex){
//        UserInf userinf = new UserImp();
////        userinf.Hello("廖剑锋",age,sex);
//        return userinf;
//    }
//
//    //再spring容器启动时，如果有类继承了FactoryBean，那就会自动调用getObject()方法
//    @Override
//    public Object getObject() throws Exception{
//        return bean(this.age,this.sex);
//    }
//
//    @Override
//    public Class<?> getObjectType(){
//        return UserInf.class;
//    }
//
//    @Override
//    public boolean isSingleton() {
//        return false;
//    }
//
//    public int getAge() {
//        return age;
//    }
//
//    public void setAge(int age) {
//        this.age = age;
//    }
//
//    public String getSex() {
//        return sex;
//    }
//
//    public void setSex(String sex) {
//        this.sex = sex;
//    }
//
//
//}
