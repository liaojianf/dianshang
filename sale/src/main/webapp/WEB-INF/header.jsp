<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" type="image/icon" href="images/logos.jpg">
	<link rel="stylesheet" type="text/css" href="css/css.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function (){
		var yh_mch = getMyCookie("yh_mch");
		$("#show_name").text(decodeURIComponent(yh_mch));
	})
	function getMyCookie(key) {
		var val = "";
		var cookies = document.cookie;
		cookies = cookies.replace(/\s/,"");
		var cookies_arry = cookies.split(";");
		if(cookies_arry!=null){
			for(i=0;i<cookies_arry.length;i++){
				var arry= cookies_arry[i].split("=");
				if(arry[0]===key){
					val = arry[1];

				}
			}
		}
		return val;
	}
</script>
<title>剑来商城</title>
</head>
<body>
	<div class="top">
		<div class="top_text">
			<c:if test="${empty user}">
				<a href="goto_login.do">用户登录:<span id="show_name" style="color:red"></span></a>
				<a href="javascript:;">用户注册</a>
			</c:if>
			<c:if test="${not empty user}">
				<a href="javascript:;">用户名称:${user.yh_nch}</a>
				<a href="javascript:;">用户订单</a>
				<a href="goto_logout.do">退出</a>
			</c:if>
		</div>

	</div>
</body>
</html>