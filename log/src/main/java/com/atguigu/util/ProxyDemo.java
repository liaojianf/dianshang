package com.atguigu.util;

public class ProxyDemo {

    public static void main(String[] args) {
        consumer(new TargetObject());
        consumer(new SimpleProxy(new TargetObject()));
    }

    public static void consumer(Interface inter) {
        inter.doSomething();
        inter.somethingElse("Tomy");
    }

    interface Interface { //抽象主题角色
        void doSomething();
        void somethingElse(String arg);
    }

    static class TargetObject implements Interface { //真实主题角色
        public void doSomething() {
            System.out.println("target doSomething");
        }
        public void somethingElse(String arg) {
            System.out.println("target somethingElse " + arg);
        }
    }

    static class SimpleProxy implements Interface { //代理主题角色
        private Interface target;
        public SimpleProxy(Interface target) {
            this.target = target;
        }
        public void doSomething() {
            System.out.println("SimpleProxy doSomething");
            target.doSomething();
        }
        public void somethingElse(String arg) {
            System.out.println("SimpleProxy somethingElse " + arg);
            target.somethingElse(arg);
        }
    }
}
