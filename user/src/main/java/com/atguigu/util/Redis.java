package com.atguigu.util;

import redis.clients.jedis.Jedis;

public class Redis {

    public Jedis getRedis (){
         Jedis jedis = new Jedis("192.168.88.9",6379);
         return jedis;
    }
    public Redis(){
    }

}
