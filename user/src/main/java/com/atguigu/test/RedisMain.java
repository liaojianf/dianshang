package com.atguigu.test;


import com.atguigu.util.JedisPoolUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.Transaction;

public class RedisMain {
//    static Jedis jedis = new Jedis("192.168.88.9",6379);
    public static void main(String[] args) throws InterruptedException {

//        Set<String> keys = jedis.keys("*");
//        Iterator<String> iterator = keys.iterator();
//        while (iterator.hasNext()){
//            System.out.println(iterator.next());
//        }
//        //hash
//        Map<String,String> hash = new HashMap<String, String>();
//        hash.put("age","22");
//        hash.put("name","ljf");
//        hash.put("height","172");
//        hash.put("sex","男");
//        jedis.hmset("user",hash);
//        Map<String, String> user = jedis.hgetAll("user");
//        //1、迭代器
//        Iterator<Map.Entry<String, String>> entry = user.entrySet().iterator();
//        while (entry.hasNext()){
//            Map.Entry<String, String> next = entry.next();
//            String key = next.getKey();
//            String value = next.getValue();
//            System.out.println(key+":"+value);
//        }
////        for(String key:user.keySet()){
////            System.out.println(key+":"+user.get(key));
////        }
//        //zset
//        jedis.zadd("zset01",60,"v1");
//        jedis.zadd("zset01",70,"v2");
//        jedis.zadd("zset01",80,"v3");
//        jedis.zadd("zset01",90,"v4");
//        jedis.zadd("zset01",100,"v5");
//        Set<Tuple> zset01 = jedis.zrangeWithScores("zset01", 0, -1);
//        Iterator<Tuple> iterator1 = zset01.iterator();
//        while (iterator1.hasNext()){
//            Tuple next = iterator1.next();
//            String element = next.getElement();
//            double score = next.getScore();
//            System.out.println(element+":"+score);
//        }
////        Set<String> zset011 = jedis.zrange("zset01", 0, -1);
////        Iterator<String> iterator2 = zset011.iterator();
////        while (iterator2.hasNext()){
////            System.out.println(iterator2.next());
////        }
//        //set
//        jedis.sadd("order","jd001");
//        jedis.sadd("order,","jd004");
//        jedis.sadd("order","jd005");
//        jedis.sadd("orders","jd001");
//        jedis.sadd("orders","jd002");
//        jedis.sadd("orders","jd003");
//        Set<String> orders = jedis.smembers("orders");
//        Iterator<String> iterator2 = orders.iterator();
//        while (iterator2.hasNext()){
//            System.out.println(iterator2.next());
//        }
////        jedis.srem("orders","jd002");
//        System.out.println(orders.size());
//        System.out.println("sdiff");
//        Set<String> sdiff = jedis.sdiff("order", "orders");
//        Iterator<String> iterator3 = sdiff.iterator();
//        while (iterator3.hasNext()){
//            System.out.println(iterator3.next());
//        }
//        System.out.println("sinter");
//        Set<String> sinter = jedis.sinter("order", "orders");
//        Iterator<String> iterator4 = sinter.iterator();
//        while (iterator4.hasNext()){
//            System.out.println(iterator4.next());
//        }
//        System.out.println("sunion");
//        Set<String> sunion = jedis.sunion("order", "orders");
//        Iterator<String> iterator5 = sunion.iterator();
//        while (iterator5.hasNext()){
//            System.out.println(iterator5.next());
//        }
//事物
//        transMethod();
//主从复制
//         Jedis jedis_M = new Jedis("192.168.88.9",6379);
//         Jedis jedis_S = new Jedis("192.168.88.9",6384);
//         jedis_M.set("a","1314");
//         System.out.println(jedis_S.get("a"));
//连接池
        JedisPoolUtils jedisPoolUtils = new JedisPoolUtils();
        JedisPool jedisPool =  jedisPoolUtils.jedisPool;
        Jedis jedis = null;
        try{
            jedis = jedisPool.getResource();
            System.out.println(jedis.get("class"));
        }catch (Exception e){

        }finally {

            jedisPoolUtils.getJedis();
        }

    }
    public static boolean transMethod() throws InterruptedException {
        Jedis jedis = new Jedis("192.168.88.9",6379);

        int swiping =10;
        Thread.sleep(7000);
        jedis.watch("balance");
        int balance =Integer.parseInt(jedis.get("balance"));
        int debt = Integer.parseInt(jedis.get("debt"));
        if (balance<swiping){
            jedis.unwatch();
            System.out.println("modify");
            return false;
        }else {
            Transaction transaction = jedis.multi();//开启事物
            transaction.decrBy("balance",swiping);
            transaction.incrBy("debt",swiping);
            transaction.exec();//提交事物
            return true;
        }
    }
}
