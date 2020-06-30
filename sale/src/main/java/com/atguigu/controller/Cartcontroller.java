package com.atguigu.controller;

import com.atguigu.bean.T_MALL_SHOPPINGCAR;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.service.CartServiceInf;
import com.atguigu.service.imp.CartServiceImp;
import com.atguigu.util.MyJsonUtil;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class Cartcontroller {
    @Autowired
    CartServiceInf cartServiceImp;

    @RequestMapping("/change_shfxz")
    public String cartlists(HttpServletResponse response,String check,int skuid,HttpSession session,ModelMap map, @CookieValue(value = "list_cart_cookie",required = false) String list_cart_cookie){
        T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
        List<T_MALL_SHOPPINGCAR> shoppingcars = null;
        if (user==null){
           // 修改cookie
            shoppingcars = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
        }else {
            // 修改db
            shoppingcars = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");// 数据库
        }
        for (int a=0;a<shoppingcars.size();a++){
            if (skuid==shoppingcars.get(a).getSku_id()){
                shoppingcars.get(a).setShfxz(check);
                if (user==null){
                    // 覆盖cookie
                    Cookie cookie = new Cookie("list_cart_cookie", MyJsonUtil.list_to_json(shoppingcars));
                    cookie.setMaxAge(60 * 60 * 24);
                    response.addCookie(cookie);
                }else {
                    cartServiceImp.update(shoppingcars.get(a));
                    session.setAttribute("list_cart_session",cartServiceImp.selet_all(user.getId()));
                }

            }
        }

        map.put("sum",get_sum(shoppingcars));
        map.put("list_cart",shoppingcars);
        return "cartListInner";
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
    public int get_num(List<T_MALL_SHOPPINGCAR> shoppingcars){
        int num = 0;
        for(int a=0;a<shoppingcars.size();a++){
            num+= shoppingcars.get(a).getTjshl();
        }
        return num;
    }

    @RequestMapping("/cartList")
    public String cartlist(@CookieValue(value = "list_cart_cookie",required = false) String list_cart_cookie,ModelMap map,HttpSession session){
        List<T_MALL_SHOPPINGCAR> shoppingcars = null;
        T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
        if(user==null){
            shoppingcars = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
            System.out.println(shoppingcars.size());
        }else {
            System.out.println(user.getId());
            shoppingcars = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");//数据库
            if (shoppingcars==null){
                shoppingcars = cartServiceImp.selet_all(user.getId());

            }
        }

        map.put("sum",get_sum(shoppingcars));
        map.put("list_cart",shoppingcars);
        return "cartList";
    }

    @RequestMapping("/miniCart")
    public String miniCart(ModelMap map,HttpSession session, @CookieValue(value = "list_cart_cookie",required = false) String list_cart_cookie){
        T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT)session.getAttribute("user");
        List<T_MALL_SHOPPINGCAR> shoppingcars ;
        if (user==null){
            shoppingcars = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
        }else {
            shoppingcars = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");//数据库
            if (shoppingcars==null){
                shoppingcars = cartServiceImp.selet_all(user.getId());

            }
        }
        map.put("shoppingcars",shoppingcars);
        map.put("num",get_num(shoppingcars));
        map.put("sum",get_sum(shoppingcars));
        return "miniCartList";
    }

    @RequestMapping("/add_cart")
    public String add_cart(HttpSession session,HttpServletResponse response, @CookieValue(value = "list_cart_cookie",required = false) String list_cart_cookie, T_MALL_SHOPPINGCAR cart, ModelMap map){
        List<T_MALL_SHOPPINGCAR> shoppingcars = new ArrayList<T_MALL_SHOPPINGCAR>();
        //添加购物车操作
        if (cart.getYh_id()==0){
            //用户未登录，操作cookie 如果list_cart_cookie为空则执行以下操作
            if (StringUtils.isBlank(list_cart_cookie)){

                shoppingcars.add(cart);

            }else {
                shoppingcars = MyJsonUtil.json_to_list(list_cart_cookie,T_MALL_SHOPPINGCAR.class);
                //判断是否重复
                boolean b = if_new_car(cart,shoppingcars);
                if (b){
                    //新车，添加
                    shoppingcars.add(cart);
                }else {
                    //老车，更新
                    for(int a=0;a<shoppingcars.size();a++){
                        if (shoppingcars.get(a).getSku_id()==cart.getSku_id()){
                            shoppingcars.get(a).setTjshl(shoppingcars.get(a).getTjshl()+cart.getTjshl());
                            shoppingcars.get(a).setHj(shoppingcars.get(a).getTjshl()*shoppingcars.get(a).getSku_jg());
                        }
                    }
                }

            }
            //覆盖cookie
            Cookie cookie = new Cookie("list_cart_cookie", MyJsonUtil.list_to_json(shoppingcars));
           System.out.println(cookie.getValue());
            cookie.setMaxAge(60*60*24);
            response.addCookie(cookie);
        }else {
//            shoppingcars = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");//数据库
//            //用户已经登陆，操作db
//            if (shoppingcars==null || shoppingcars.isEmpty()){
//                //db中没有数据
//                cartServiceImp.add(cart);
//                //同步session
//                shoppingcars = new ArrayList<T_MALL_SHOPPINGCAR>();
//                shoppingcars.add(cart);
//                session.setAttribute("list_cart_session",shoppingcars);
//            }else{
//                boolean b = if_new_car(cart,shoppingcars);
//                if (b){
//                    //新车，添加
//                    cartServiceImp.add(cart);
//                    //同步session
//                    shoppingcars.add(cart);
//                }else {
//                    //同步session
//                    for(int a=0;a<shoppingcars.size();a++){
//                        if (shoppingcars.get(a).getSku_id()==cart.getSku_id()){
//                            shoppingcars.get(a).setTjshl(shoppingcars.get(a).getTjshl()+cart.getTjshl());
//                            shoppingcars.get(a).setHj(shoppingcars.get(a).getTjshl()*shoppingcars.get(a).getSku_jg());
//                            cartServiceImp.update(shoppingcars.get(a));
//
//                        }
//                    }
//
//                }
//            }
            shoppingcars = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");//数据库
            if (shoppingcars==null){
                System.out.println("null");
                shoppingcars = cartServiceImp.selet_all(cart.getYh_id());

            }

            //用户已经登陆，操作db
            boolean b = cartServiceImp.select_cart_exists(cart);
            if (!b){
                System.out.println(cart.toString()+"  1");
                cartServiceImp.add(cart);
                if (shoppingcars==null||shoppingcars.isEmpty()){
                    shoppingcars = new ArrayList<T_MALL_SHOPPINGCAR>();
                    shoppingcars.add(cart);
                    session.setAttribute("list_cart_session",shoppingcars);
                }else {
                    shoppingcars.add(cart);
                }
            }else {
                       for(int a=0;a<shoppingcars.size();a++){
                        if (shoppingcars.get(a).getSku_id()==cart.getSku_id()){

                            shoppingcars.get(a).setTjshl(shoppingcars.get(a).getTjshl()+cart.getTjshl());
                            shoppingcars.get(a).setHj(shoppingcars.get(a).getTjshl()*shoppingcars.get(a).getSku_jg());
                            cartServiceImp.update(shoppingcars.get(a));

                        }
                    }
            }


        }

        map.put("cart",cart);
        return "redirect:/cart_success.do";
    }

    private boolean if_new_car(T_MALL_SHOPPINGCAR cart, List<T_MALL_SHOPPINGCAR> shoppingcars) {
        for(int a=0;a<shoppingcars.size();a++){
            if (shoppingcars.get(a).getSku_id()==cart.getSku_id()){
                return false;
            }
        }
        return true;

    }

    @RequestMapping("/cart_success")
    public String cart_success(){
        return "cartSuccess";
    }

    @Test
    public void account(){
        T_MALL_USER_ACCOUNT account = cartServiceImp.account();
        System.out.println(account);

    }

    public static void main(String[] args) {
        CartServiceInf cartServiceInf = new CartServiceImp();
        System.out.println(cartServiceInf.account());
    }
}
