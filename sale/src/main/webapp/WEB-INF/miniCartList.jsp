<%--
  Created by IntelliJ IDEA.
  User: ljf
  Date: 2020/1/19
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="shortcut icon" type="image/icon" href="images/logos.jpg">
<link rel="stylesheet" type="text/css" href="css/css.css">
<link rel="stylesheet" href="layui/css/layui.css"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
function cartList() {
    window.location.href="cartList.do";
}
</script>
<head>
    <title>剑来商城</title>
</head>
<body>


<h6>最新加入的商品</h6>
<c:forEach items="${shoppingcars}" var="shop">
    <div class="one">
        <img src="upload/image/${shop.shp_tp}" width="60px;" height="60px"/>
        <span class="one_name">
                ${shop.sku_mch}
        </span>
        <span class="one_prece" >
						￥${shop.sku_jg}
						<a href="javascript:;"><button>删除</button></a>
					</span>
    </div>
</c:forEach>
<div class="gobottom">
    共<span>${num}</span>件商品&nbsp;&nbsp;&nbsp;&nbsp;
    共计￥<span>${sum}</span>
     <button class="goprice" onclick="cartList()">去购物车</button>
</div>


</body>
</html>
