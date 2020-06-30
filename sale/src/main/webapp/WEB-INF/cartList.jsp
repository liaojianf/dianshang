<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

	<link rel="shortcut icon" type="image/icon" href="images/logos.jpg">
<link rel="stylesheet" type="text/css" href="css/css.css">
<link rel="stylesheet" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function change_shfxz(checked,skuid){
		var check = "";
		if (checked===true){
			check= "1";
		}else {
			check= "0";
		}
		$.post("change_shfxz.do",{check:check,skuid:skuid},function (data) {
			$("#cartListInner").html(data);
		})
	}

</script>
<title>剑来商城</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<img src="/images/top_img.jpg" width="100%">
<jsp:include page="searchArea.jsp"></jsp:include>
	<div id="cartListInner">
		<jsp:include page="cartListInner.jsp"></jsp:include>
	</div>

	<div class="footer">
		<div class="top"></div>
		<div class="bottom"><img src="images/foot.jpg" alt=""></div>
	</div>
</body>
</html>