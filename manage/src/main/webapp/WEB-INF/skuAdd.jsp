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
<link rel="shortcut icon" type="image/icon" href="../images/jd.ico">
<link rel="stylesheet" href="../layui/css/layui.css"/>
<script type="text/javascript" src="../layui/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<head>
    <title>硅谷商城</title>
</head>
<script>
    var flbh2 = "${flbh2}";
$(function () {
    var flbh1 ="${flbh1}";
    $.getJSON("js/json/tm_class_1_"+flbh1+".js",function (data) {
        $("#sku_tm_select").empty();
        $(data).each(function (i,json) {
            $("#sku_tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>")
        })
    })
})
    function get_pinp_list(index) {
    var pp_id =index;
        $.post("get_shp_list.do",{flbh2:flbh2,pp_id:pp_id},function (data) {
            $("#spu_list").empty();
            $(data).each(function (i,json) {
                $("#spu_list").append("<option value="+json.id+">"+json.shp_mch+"</option>")
            })
        })
    }

    function show_val(attr_id,checked) {
    if(checked){
        $("#val_"+attr_id).show();
    }else {
        $("#val_"+attr_id).hide();
    }
    }
</script>
<body>
<%--   flbh 分列编号--%>
商品sku管理<br>

<%--以这种二进制的multipart--%>
<form action="save_sku.do" method="post">
    品牌:<select id="sku_tm_select" onchange="get_pinp_list(this.value)" name="pp_id" ></select>
    商品<select id="spu_list" name="id"></select>
    <hr style="height: 2px;background-color: lightgrey">
    <input type="text" value="${flbh1}" name="flbh1" style="display: none">
    <input type="text" value="${flbh2}" name="flbh2" style="display: none">
    分类属性:<br>
    <c:forEach items="${list_attr}" var="attr" varStatus="status">
        <input type="checkbox" value="${attr.id}" name="list_attr[${status.index}].shxm_id" id="attr_${attr.id}" onclick="show_val(${attr.id},this.checked)">${attr.shxm_mch}
    </c:forEach><br>
    <c:forEach items="${list_attr}" var="attr" varStatus="status">
        <div id="val_${attr.id}" style="display: none">
        <c:forEach items="${attr.list_value}" var="val" >
            <input type="radio" value="${val.id}" name="list_attr[${status.index}].shxzh_id">${val.shxzh}${val.shxzh_mch}
        </c:forEach>
        </div>
    </c:forEach><br>
    <hr style="height: 2px;background-color: lightgrey">
    商品库存名称:<input type="text" name="sku_mch"><br>
    商品库存数量:<input type="text" name="kc"><br>
    商品库存价格:<input type="text" name="jg"><br>
    商品库存地址:<input type="text" name="kcdz"><br>
    <input  type="submit" value="添加" class="btn-primary"/>
</form>


</body>
</html>
