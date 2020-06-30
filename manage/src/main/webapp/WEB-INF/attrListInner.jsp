<%--
  Created by IntelliJ IDEA.
  User: ljf
  Date: 2020/1/3
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="../layui/css/layui.css"/>
<script type="text/javascript" src="../layui/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<link rel="stylesheet" href="../static/bootstrap-3.3.7-dist/css/bootstrap.css"/>
<script type="text/javascript" src="../static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<head>
    <title>Title</title>
</head>
<body>
<table  class="layui-table">
    <thead>
    <th>ID</th>
    <th>属性名</th>
    <th>属性值</th>
    <th>创建时间</th>
    </thead>
    <c:forEach items="${list_attr}" var="attr">
        <tr>
            <td>
                    ${attr.id}
            </td>
            <td>
                    ${attr.shxm_mch}
            </td>
            <td>
        <c:forEach items="${attr.list_value}" var="val">
                    ${val.shxzh}${val.shxzh_mch}&#12288;
        </c:forEach>
            </td>
            <td>${attr.chjshj}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
