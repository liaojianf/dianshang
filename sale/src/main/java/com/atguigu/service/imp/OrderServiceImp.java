package com.atguigu.service.imp;

import com.atguigu.bean.OBJECT_T_MALL_FLOW;
import com.atguigu.bean.OBJECT_T_MALL_ORDER;
import com.atguigu.bean.T_MALL_ADDRESS;
import com.atguigu.bean.T_MALL_ORDER_INFO;
import com.atguigu.exception.OverSaleException;
import com.atguigu.mapper.OrderMapper;
import com.atguigu.service.OrderServiceInf;
import com.atguigu.util.MyDataUtil;
import com.atguigu.util.MyDateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service(value = "OrderServiceImp")
public class OrderServiceImp implements OrderServiceInf {
    @Autowired
    OrderMapper orderMapper;
    public void save_order(T_MALL_ADDRESS address,OBJECT_T_MALL_ORDER order){
        System.out.println(address.toString());
        System.out.println(order.toString());
        ArrayList<Integer> list_id = new ArrayList<Integer>();
        //保存订单
        Map<Object,Object> map = new HashMap<Object, Object>();
        map.put("chjshj",new Date());
        map.put("order",order);
        map.put("address",address);

        orderMapper.insert_order(map);

        List<OBJECT_T_MALL_FLOW> list_flow = order.getList_flow();
        for (int i=0;i<list_flow.size();i++){
            //保存物流
            OBJECT_T_MALL_FLOW flow = list_flow.get(i);
//            flow.setLxfsh(address.getLxfsh());
            Map<Object,Object> map_flow = new HashMap<Object, Object>();
            flow.setMdd(address.getYh_dz());
            map_flow.put("flow",flow);
            map_flow.put("chjshj",new Date());
            map.put("dd_id",order.getId());
            orderMapper.insert_flow(map_flow);

            List<T_MALL_ORDER_INFO> list_info = flow.getOrder_info();
            //保存订单信息
                Map<Object,Object> map_info = new HashMap<Object, Object>();
            map_info.put("chjshj",new Date());
                map_info.put("list_info",list_info);
                map_info.put("dd_id",order.getId());
                map_info.put("flow_id",flow.getId());
                orderMapper.insert_infos(map_info);

                for (int j=0;j<list_info.size();j++){
                    list_id.add(list_info.get(j).getGwch_id());
                }
        }

        //删除已经生成订单的购物车对象
        Map<Object,Object> map_cart = new HashMap<Object, Object>();
        map_cart.put("list_id",list_id);
        orderMapper.delete_carts(map_cart);
    }

    @Override
    public void insert_order(Map<Object, Object> map){
        orderMapper.insert_order(map);
    }

    @Override
    public void insert_flow(Map<Object, Object> map){
        orderMapper.insert_flow(map);
    }

    @Override
    public void insert_infos(Map<Object, Object> map){
        orderMapper.insert_infos(map);
    }

    @Override
    public void update_order(OBJECT_T_MALL_ORDER order){
        orderMapper.update_order(order);
    }

    @Override
    public void update_flow(OBJECT_T_MALL_FLOW object_T_MALL_FLOW){
        orderMapper.update_flow(object_T_MALL_FLOW);
    }

    @Override
    public void delete_carts(Map<Object, Object> map_cart){
        orderMapper.delete_carts(map_cart);
    }

    public void paySuccess(OBJECT_T_MALL_ORDER order) throws OverSaleException {
        //修改订单状态，已支付
        order.setJdh(2);
        //修改订单信息
        orderMapper.update_order(order);
        //修改物流信息
        List<OBJECT_T_MALL_FLOW> list_flow = order.getList_flow();
        for (int i=0;i<list_flow.size();i++){
            OBJECT_T_MALL_FLOW flow = list_flow.get(i);
            //修改物流的业务
            flow.setPsmsh("商品正在出库");
            flow.setPsshj(MyDataUtil.getMyDate(1));//明天
            flow.setYwy("老廖");
            flow.setLxfsh("13229852791");
            flow.setDd_id(order.getId());
            orderMapper.update_flow(flow);
            List<T_MALL_ORDER_INFO> order_info = flow.getOrder_info();
            //修改sku数据和销量信息
            for (int j=0;j<order_info.size();j++){
                int id = order_info.get(j).getSku_id();
                int xl = order_info.get(j).getSku_shl();
                System.out.println("xl:"+xl);
                System.out.println("id:"+id);
                long kc = 0;
                long count = orderMapper.select_count_kc(id);
                System.out.println("count:"+count);
                //库存数量足够多可以并发查询
                kc = getKc(count,id);
                System.out.println("库存数量为:"+kc);
                if (order_info.get(j).getSku_shl()<kc){//确定购买数量小于库存数
                    //对kc进行修改
                    System.out.println(order_info.get(j));
                    orderMapper.update_kc(order_info.get(j));
                    //修改sku数据和销量等信息
                    Map<String,Integer> map = new HashMap<String, Integer>();
                    map.put("id",id);
                    map.put("xl",xl);
                    orderMapper.update_xl(map);
                }else {
                     throw new OverSaleException("over sale");
                }
            }
        }
        //修改订单状态，出库
        order.setYjsdshj(MyDataUtil.getMyDate(3));
        orderMapper.update_order(order);

    }

    private long getKc(long count, int id) {
        Map<Object,Object> maps = new HashMap<Object, Object>();
        maps.put("sku_id",id);
        maps.put("count",count);
        long counts  =orderMapper.select_kc(maps);
        return counts;
    }
}
