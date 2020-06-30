package com.atguigu.controller;

import com.atguigu.bean.T_MALL_SHOPPINGCAR;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.server.AddressServerInf;
import com.atguigu.server.LoginServerInf;
import com.atguigu.server.LoginServerInfs;
import com.atguigu.server.TestServerInf;
import com.atguigu.service.CartServiceInf;
import com.atguigu.service.LoginServiceInf;
import com.atguigu.util.MyHttpGetUtil;
import com.atguigu.util.MyJsonUtil;
import com.atguigu.util.MyPropertyUtil;
import com.atguigu.util.MyWsFactoryBean;
import org.apache.activemq.Message;
import org.apache.activemq.command.ActiveMQQueue;
import org.apache.activemq.command.ActiveMQTopic;
import org.apache.commons.lang3.StringUtils;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jms.JMSException;
import javax.jms.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginController {

	@Autowired
	LoginServiceInf loginServiceImp;
	@Autowired
	CartServiceInf cartServiceImp;
	LoginServerInf loginServerInf = MyWsFactoryBean.getMyWs(MyPropertyUtil.getProperty("ws.properties", "login_url"), LoginServerInf .class);
	@Autowired
	LoginServerInfs loginServerInfs;
	//	@Autowired
//	LoginServerInf loginServerInf;
//	MyWsFactoryBean.
	@Autowired
	JmsTemplate jmsTemplate;
	@Autowired
	ActiveMQTopic topicDestination;
	@Autowired
	ActiveMQQueue queueDestination;

//	@RequestMapping("login")
//	public String goto_login(HttpServletResponse response, HttpSession session, T_MALL_USER_ACCOUNT user,
//			HttpServletRequest request, ModelMap map) {

		// 登陆，远程用户认证接口
//		T_MALL_USER_ACCOUNT select_user = loginMapper.select_user(user);

//		if (select_user == null) {
//			return "redirect:/login.do";
//		} else {
//			session.setAttribute("user", select_user);
//
//			// 在客户端存储用户个性化信息，方便用户下次再访问网站时使用
//			try {
//				Cookie cookie = new Cookie("yh_mch", URLEncoder.encode(select_user.getYh_mch(), "utf-8"));
//				// cookie.setPath("/");
//				cookie.setMaxAge(60 * 60 * 24);
//				response.addCookie(cookie);
//
//				Cookie cookie2 = new Cookie("yh_nch", URLEncoder.encode("周润发", "utf-8"));
//				// cookie.setPath("/");
//				cookie2.setMaxAge(60 * 60 * 24);
//				response.addCookie(cookie2);
//			} catch (UnsupportedEncodingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//		}
//
//		return "redirect:/index.do";
//	}
	//@RequestParam(value = "redirect",required = false)支付订单时，用户未登陆页面传递的一个参数
	@RequestMapping("login")
	public String login(@RequestParam(value = "redirect",required = false) String redirect, @CookieValue(value = "list_cart_cookie",required = false) String list_cart_cookie, HttpServletResponse response, HttpSession session, T_MALL_USER_ACCOUNT user,
						HttpServletRequest request, ModelMap map, String dataSource_type) throws Exception {
			System.out.println(user.getYh_mch());
			String login = "";
			T_MALL_USER_ACCOUNT users = null;
//			T_MALL_USER_ACCOUNT users = loginServiceImp.select_user(user);
			String loginJson = "";
//			JaxWsProxyFactoryBean jwfb = new JaxWsProxyFactoryBean();
//			jwfb.setAddress(MyPropertyUtil.getProperty("ws.properties","login_url"));
//			jwfb.setServiceClass(LoginServerInf.class);
//			LoginServerInf create = (LoginServerInf) jwfb.create();
			if (dataSource_type.equals("1")){
				 loginJson = loginServerInfs.login(user);
			}else if(dataSource_type.equals("2")){
				 loginJson = loginServerInfs.login2(user);
			}

			users = MyJsonUtil.json_to_object(loginJson,T_MALL_USER_ACCOUNT.class);
			if (users==null)
			{
				session.setAttribute("err","用户名或密码错误");
				return "redirect:/goto_login.do";
			} else {
				//添加数据到日志框架数据库
			MyHttpGetUtil.doGet(MyPropertyUtil.getProperty("ws.properties", "log_url") + "=" + users.getYh_mch());
				//发送mq消息
				final String str = "ID:"+user.getId()+" 用户名:"+user.getYh_mch()+"登陆了";
				jmsTemplate.send(queueDestination, new MessageCreator() {
					@Override
					public Message createMessage(Session session) throws JMSException {
						return (Message) session.createTextMessage(str);
					}
				});
				session.setAttribute("user",users);
				// 在客户端存储用户个性化信息，方便用户下次再访问网站时使用   转码
				Cookie cookie = new Cookie("yh_mch", URLEncoder.encode(user.getYh_mch(),"utf-8"));
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
				Cookie cookie2 = new Cookie("yh_nch", URLEncoder.encode("周润发","utf-8"));
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie2);
				combine_cart(list_cart_cookie,users,response,session);
				System.out.println(redirect);
				if (StringUtils.isBlank(redirect)){
					//主页面
					return "redirect:/index.do";
				}else {
					//直接去到订单页面
					return "redirect:/"+redirect;
				}

			}
	}

	public void combine_cart(@CookieValue(value = "list_cart_cookie",required = false) String list_cart_cookie, T_MALL_USER_ACCOUNT user,HttpServletResponse response, HttpSession session){
		List<T_MALL_SHOPPINGCAR> shoppingcars = new ArrayList<T_MALL_SHOPPINGCAR>();
		//cookie为空
		if (StringUtils.isBlank(list_cart_cookie)) {
			//cookie不为空
		} else {
			shoppingcars = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
			List<T_MALL_SHOPPINGCAR> shoppingcar_bd = cartServiceImp.selet_all(user.getId());
			//数据库为空 把cookie中的值添加进入数据库中
			for (int i=0;i<shoppingcars.size();i++) {
				T_MALL_SHOPPINGCAR cart = shoppingcars.get(i);
				cart.setYh_id(user.getId());
				boolean b = cartServiceImp.select_cart_exists(shoppingcars.get(i));
				if (b) {
					//更新
					for(int a=0;a<shoppingcar_bd.size();a++){
						if (cart.getSku_id()==shoppingcar_bd.get(a).getYh_id()){
							cart.setTjshl(shoppingcars.get(i).getTjshl()+shoppingcar_bd.get(a).getTjshl());
							cart.setHj(shoppingcars.get(i).getTjshl()*cart.getSku_jg());
							cartServiceImp.update(cart);
						}
					}
				} else {
					//添加
					cartServiceImp.add(shoppingcars.get(i));
				}
			}

//				if (shoppingcar_bd==null||shoppingcar_bd.size()==0){
//					for (int a=0;a<shoppingcars.size();a++){
//						shoppingcars.get(a).setYh_id(user.getId());
//						cartServiceImp.add(shoppingcars.get(a));
//					}
//					//数据库不为空
//				}else {
//
//					for (int i=0;i<shoppingcars.size();i++){
//						boolean b =if_new_car(shoppingcars.get(i),shoppingcar_bd);
//						if (b){
//							shoppingcars.get(i).setYh_id(user.getId());
//							cartServiceImp.add(shoppingcars.get(i));
//						}else {
//							for(int a=0;a<shoppingcar_bd.size();a++){
//								if (shoppingcars.get(i).getSku_id()==shoppingcar_bd.get(a).getYh_id()){
//
//									shoppingcars.get(a).setTjshl(shoppingcars.get(a).getTjshl()+shoppingcar_bd.get(a).getTjshl());
//									shoppingcars.get(a).setHj(shoppingcars.get(a).getTjshl()*shoppingcars.get(a).getSku_jg());
//									cartServiceImp.update(shoppingcars.get(a));
//
//								}
//							}
//						}
//
//
//					}
//				}
//			}
		}
		//清空cookie,同步session
		response.addCookie(new Cookie("list_cart_cookie",""));
		List<T_MALL_SHOPPINGCAR> shoppingcars1 = cartServiceImp.selet_all(user.getId());
		session.setAttribute("list_cart_session",shoppingcars1);
		List<T_MALL_SHOPPINGCAR>  listCartSession = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");

	}
	@RequestMapping("/goto_logout")
	public String goto_logout(HttpSession session,ModelMap map){
			session.invalidate();
		return "redirect:/goto_login.do";
	}

	@RequestMapping("index")
	public String index(){
		    return "index";
    }

	@RequestMapping("/goto_login")
	public String goto_logo(){
		return "login";
	}
	@RequestMapping("/goto_login_checkOrder")
	public String goto_login_checkOrder(){
		return "loginOrder";
	}






}
