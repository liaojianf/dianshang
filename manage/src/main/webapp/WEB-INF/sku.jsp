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
     <link rel="stylesheet" href="../static/bootstrap-3.3.7-dist/css/bootstrap.css"/>
     <script type="text/javascript" src="../static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<head>
     <title>Title</title>
</head>
<script>
     function get_class_2(class_1_id){
          $.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
               $("#sku_class_2_select").empty();
               $(data).each(function(i,json){
                    $("#sku_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
               });
          });

     }


     function goto_sku_add(){
          var class_1_id = $("#sku_class_1_select").val();
          var class_2_id = $("#sku_class_2_select").val();
          window.location.href="goto_sku_add.do?flbh1="+class_1_id+"&flbh2="+class_2_id;
     }


     $(function () {
          $.getJSON("js/json/class_1.js",function(data){
               $(data).each(function(i,json){
                    $("#sku_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
               });
          });
     });
</script>
<body>
一级：<select id="sku_class_1_select" onchange="get_class_2(this.value);"><option>请选择</option></select>
二级：<select  id="sku_class_2_select" ><option>请选择</option></select>
<br>
<a href="javascript:;" > <button type="button" class="layui-btn layui-btn-primary">查询</button></a>&#12288;
<a href="javascript:goto_sku_add();" style="color: #1d7db1"> <button type="button" class="layui-btn layui-btn-primary">添加</button></a>&#12288;
<a href="javascript:;"> <button type="button" class="layui-btn layui-btn-primary">删除</button></a>&#12288;
<a href="javascript:;"> <button type="button" class="layui-btn layui-btn-primary">编辑</button></a><br>


</body>



