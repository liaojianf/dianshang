<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()--%>
<%--			+ request.getContextPath() + "/";--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="shortcut icon" type="image/icon" href="images/logos.jpg">
<html>
<head>
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script>
		$(function () {
			window.location.href="goto_login.do";
		})
	</script>
<title>硅谷商城</title>
</head>
<body>
<center><h2><a href="goto_login.do">欢迎来到电商页面!!!</a></h2></center>
</body>
</html>