package com.atguigu.bean;

public class User {
    private int age;
    private String name;
    private String sex;
    private int height;

    public User(int age, String name, String sex, int height) {
        this.age = age;
        this.name = name;
        this.sex = sex;
        this.height = height;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }
}
