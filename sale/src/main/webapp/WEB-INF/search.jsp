<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()--%>
<%--			+ request.getContextPath() + "/";--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" type="image/icon" href="images/logos.jpg">
<link rel="stylesheet" type="text/css" href="css/css.css">
	<link rel="shortcut icon" type="image/icon" href="images/logos.jpg">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function (){

	})
</script>
<title>剑来商城</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<img src="images/top_img.jpg" width="100%">
<jsp:include page="searchArea.jsp"></jsp:include>
<c:forEach items="${sku_list}" var="list">
	<div style="margin-top: 10px;margin-left: 10px;float: left;border: 1px #0f0f0f solid;width: 180px;height: 180px;">
		<img src="upload/image/${list.shp_tp}" alt="" style="width: 120px;height: 120px;margin-left: 30px" /><br>
		<a href="goto_sku_detail.do?sku_id=${list.id}&spu_id=${list.shp_id}" target="_blank">${list.sku_mch}</a> <br>
			${list.jg}
	</div>

</c:forEach>

<%--</C:forEach>--%>
</body>
</html>