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
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
    function show_cart() {
        $.get("miniCart.do",function (data) {
            $("#cart_list").html(data);
        })
        $("#cart_list").attr("style","display:none");
    }
    function hidden_cart() {
        $("#cart_list").attr("style","display:block");
    }
</script>
<head>
    <title>剑来商城</title>
</head>
<body>
<div class="card" onmouseout="show_cart()" onmouseover="hidden_cart()" >
    <a href="cartList.do">购物车<div class="num">0</div></a>

    <!--购物车商品-->
    <div id="cart_list" class="cart_pro"style="display: none" >
       <jsp:include page="miniCartList.jsp"></jsp:include>
    </div>
</div>
</body>
</html>
