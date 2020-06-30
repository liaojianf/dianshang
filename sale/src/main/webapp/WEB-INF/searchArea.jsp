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
	function b(){

	}

</script>
<title>剑来商城</title>
</head>
<body>
	<div class="search">
		<div class="logo"><a href="index.do"><img src="images/logos.jpg" style="width: 225px;height: 72px;" alt=""></a> </div>1
		<div class="search_on">
			<div class="se">
				<form action="keywords.do">
					<input type="text" name="keywords" class="lf">
					<input type="submit" class="clik" value="搜索">
				</form>
			</div>
			<div class="se">
				<a href="">取暖神奇</a>
				<a href="">1元秒杀</a>
				<a href="">吹风机</a>
				<a href="">玉兰油</a>
			</div>
		</div>
		<jsp:include page="miniCart.jsp"></jsp:include>
	</div>

</body>
</html>