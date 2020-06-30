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
     <title>Title</title>
</head>
<script>
     function get_class_2(class_1_id){
          $.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
               $("#class_2_select").empty();
               $(data).each(function(i,json){
                    $("#class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
               });
          });

          get_tm(class_1_id);
     }

     function get_tm(class_1_id){
          $.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
               $("#tm_select").empty();
               $(data).each(function(i,json){
                    $("#tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>");
               });
          });
     }

     function goto_spu_add(){
          var class_1_id =  $("#class_1_select").val();
          var class_2_id = $("#class_2_select").val();
          var tm_id = $("#tm_select").val();

          window.location.href="goto_spu_add.do?flbh1="+class_1_id+"&flbh2="+class_2_id+"&pp_id="+tm_id;
     }


     $(function () {
          $.getJSON("js/json/class_1.js",function(data){
               $(data).each(function(i,json){
                    $("#class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
               });
          });



     });

</script>
<body>
一级：<select id="class_1_select" onchange="get_class_2(this.value); "><option>请选择</option></select>
二级：<select  id="class_2_select"><option>请选择</option></select>
品牌：<select  id="tm_select"><option>请选择</option></select><br>
<a href="javascript:;" > <button type="button" class="layui-btn layui-btn-primary">查询</button></a>&#12288;
<a href="javascript:goto_spu_add();" style="color: #1d7db1"> <button type="button" class="layui-btn layui-btn-primary">添加</button></a>&#12288;
<a href="javascript:;"> <button type="button" class="layui-btn layui-btn-primary">删除</button></a>&#12288;
<a href="javascript:;"> <button type="button" class="layui-btn layui-btn-primary">编辑</button></a><br>

</body>



