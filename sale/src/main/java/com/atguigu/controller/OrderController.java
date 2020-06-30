package com.atguigu.controller;

import com.atguigu.bean.*;
import com.atguigu.exception.OverSaleException;
import com.atguigu.server.AddressServerInf;
import com.atguigu.server.AddressServerInfs;
import com.atguigu.server.LoginServerInf;
import com.atguigu.service.CartServiceInf;
import com.atguigu.service.OrderServiceInf;
import com.atguigu.service.imp.CartServiceImp;
import com.atguigu.service.imp.OrderServiceImp;
import com.atguigu.util.MyPropertyUtil;
import com.atguigu.util.MyWsFactoryBean;
//import com.atguigu.util.TestStatic;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.opensaml.xml.signature.G;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;

@Controller
@SessionAttributes("order")//order的值来源于这个类里面order的值
public class OrderController {
    @Autowired
    AddressServerInfs addressServerInfs;

    @Autowired
    OrderServiceInf orderServiceImp;
    @Autowired
    CartServiceInf cartServiceImp;

    AddressServerInf addressServerInf = MyWsFactoryBean.getMyWs(MyPropertyUtil.getProperty("ws.properties", "address_url"), AddressServerInf.class);

    @RequestMapping("/goto_checkOrder")
    public String goto_checkOrder(HttpSession session, ModelMap map){
        T_MALL_USER_ACCOUNT  user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
        if (user == null){
            //如果用户未登陆，重定向到goto_login_checkOrder
            return "redirect:/goto_login_checkOrder";
        }else {
            //session购物车列表
            List<T_MALL_SHOPPINGCAR> shoppingcars =(List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");//数据库

            //主订单
            OBJECT_T_MALL_ORDER order = new OBJECT_T_MALL_ORDER();
            order.setYh_id(user.getId());
            order.setJdh(1);
            order.setZje(get_sum(shoppingcars));

            //结算业务

            //根据购物车的选中状态，获得库存地址
            Set<String> set_kcdz =  new HashSet<String>();
            for(int a=0;a<shoppingcars.size();a++){
                if (shoppingcars.get(a).getShfxz().equals("1")){
                    //去重
                    set_kcdz.add(shoppingcars.get(a).getKcdz());
                }
            }
            //根据库存地址封装送货清单
            List<OBJECT_T_MALL_FLOW> list_flow = new ArrayList<OBJECT_T_MALL_FLOW>();

            //迭代循环遍历
            Iterator<String> iterator = set_kcdz.iterator();
            //每一个送货地址生成一个送货清单
            while (iterator.hasNext()){
                String kcdz = iterator.next();
                //根据库存地址生成送货清单
                OBJECT_T_MALL_FLOW flow = new OBJECT_T_MALL_FLOW();
                flow.setMqdd("商品未出库");
                flow.setPsfsh("硅谷快递");
                flow.setYh_id(user.getId());
                List<T_MALL_ORDER_INFO> list_info = new ArrayList<T_MALL_ORDER_INFO>();

                //循环购物车，将购物车对象转换成订单信息
                for(int a=0;a<shoppingcars.size();a++){
                    if(shoppingcars.get(a).getShfxz().equals("1")&&shoppingcars.get(a).getKcdz().equals(kcdz)){
                        T_MALL_SHOPPINGCAR cart = shoppingcars.get(a);//转换成flow
                        //将购物车转换为订单信息
                        T_MALL_ORDER_INFO info = new T_MALL_ORDER_INFO();
                        info.setSku_kcdz(cart.getKcdz());
                        info.setGwch_id(cart.getId());
                        info.setShp_tp(cart.getShp_tp());
                        info.setSku_id(cart.getSku_id());
                        info.setSku_jg(cart.getSku_jg());
                        info.setSku_mch(cart.getSku_mch());
                        info.setSku_shl(cart.getTjshl());
                        list_info.add(info);//3
                    }
                }
                flow.setOrder_info(list_info);//商品信息集合
                //将送货清单放进送货清单集合
                list_flow.add(flow);//2  物流集合
            }
            //送货清单放入主订单
            order.setList_flow(list_flow);//内存中的对象，游离态对象
//            JaxWsProxyFactoryBean jwfb = new JaxWsProxyFactoryBean();
//            jwfb.setAddress(MyPropertyUtil.getProperty("ws.properties","address_url"));
//            jwfb.setServiceClass(AddressServerInf.class);
//            AddressServerInf create = (AddressServerInf) jwfb.create();
           String address = addressServerInfs.get_address();
            Gson gson = new Gson();
            TypeToken<List<T_MALL_ADDRESS>> tt = new TypeToken<List<T_MALL_ADDRESS>>(){};
            ArrayList<T_MALL_ADDRESS> list_address = gson.fromJson(address,tt.getType());
            map.put("address",list_address);

            map.put("order",order);
        }
        return "checkOrder";
    }

    @RequestMapping("save_order")
    public String save_order(@ModelAttribute("order") OBJECT_T_MALL_ORDER order,Integer id,HttpSession session){
        T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
        //获取地址信息
        T_MALL_ADDRESS t_mall_address = addressServerInfs.select_address_byId(id);
        //保存订单信息
        orderServiceImp.save_order(t_mall_address,order);
        //同步session
        session.setAttribute("list_cart_session",cartServiceImp.select_list_cart_by_user(user));
        //重定向到支付页面，传入订单号和交易金额
        return "redirect:/goto_pay.do";
    }
    @RequestMapping("/real_goto_pay")
    public String real_goto_pay(){

        return "realpay";
    }
    @RequestMapping("/goto_pay")
    public String goto_pay(){

        return "pay";
    }

    @RequestMapping("/pay_success")
    public String pay_success(@ModelAttribute("order") OBJECT_T_MALL_ORDER order) throws OverSaleException {
        try{
            orderServiceImp.paySuccess(order);
        }catch (Exception e){
            return "redirect:/order_fail.do";
        }

        return "redirect:/order_success.do";
    }

    @RequestMapping("/real_pay_success")
    @ResponseBody
    public String real_pay_success(@ModelAttribute("order") OBJECT_T_MALL_ORDER order) throws OverSaleException {
        try{
            orderServiceImp.paySuccess(order);
        }catch (Exception e){
            return "success";
        }

        return "success";
    }

    @RequestMapping("/order_success")
    public String order_success() {

        return "orderSuccess";
    }
    @RequestMapping("/order_fail")
    public String order_fail() {

        return "orderFail";
    }


    public BigDecimal get_sum(List<T_MALL_SHOPPINGCAR> shoppingcars){
        BigDecimal sum = new BigDecimal("0");
        for (int a=0;a<shoppingcars.size();a++){
            if (shoppingcars.get(a).getShfxz().equals("1")){
                sum = sum.add(new BigDecimal(shoppingcars.get(a).getHj() + ""));
            }
        }
        return sum;
    }
}
