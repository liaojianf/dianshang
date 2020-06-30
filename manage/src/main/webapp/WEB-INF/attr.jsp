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
<%--<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="shortcut icon" type="image/icon" href="../images/jd.ico">
<link rel="stylesheet" href="../layui/css/layui.css"/>
<script type="text/javascript" src="../layui/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<script>
    function attr_get_class_2(class_1_id){
        $.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
            $("#attr_class_2_select").empty();
            $(data).each(function(i,json){
                $("#attr_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
            });
        });

        attr_get_tm(class_1_id);
    }

    function attr_get_tm(class_1_id){
        $.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
            $("#attr_tm_select").empty();
            $(data).each(function(i,json){
                $("#attr_tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>");
            });
        });
    }

    function get_attr_lists(flbh2) {
        $.post("get_attr_lists.do",{flbh2:flbh2},function (data) {
            $("#attrListInner").html(data);
        })
    }

    function goto_spu_add(){
        var class_2_id = $("#attr_class_2_select").val();
        window.location.href="goto_attr_add.do?flbh2="+class_2_id;
    }

    $(function () {
        $.getJSON("js/json/class_1.js",function(data){
            $(data).each(function(i,json){
                $("#attr_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
            });
        });

    });

</script>
<body>
<div class="layui-row">
    <div class="layui-col-xs12 layui-col-md8" style="height: 85px;width: 100%;border: 2px solid slategrey">
        <div class="grid-demo grid-demo-bg1" style="margin-top: 10px">
            一级：<select id="attr_class_1_select" onchange="attr_get_class_2(this.value);"><option>请选择</option></select>
            二级：<select  id="attr_class_2_select" onchange="get_attr_lists(this.value)"><option>请选择</option></select><br>
            <a href="javascript:;" > <button type="button" class="layui-btn layui-btn-primary" style="margin-top: 5px">查询</button></a>
        </div>
    </div>
    <div class="layui-col-xs6 layui-col-md4" style="width: 10%;height: 600px;border: 2px solid slategrey">
        <div class="grid-demo">

            <a href="javascript:goto_spu_add();" > <button type="button" class="layui-btn layui-btn-primary">添加</button></a><br>
            <a href="javascript:;"> <button type="button" class="layui-btn layui-btn-primary">删除</button></a><br>
            <a href="javascript:;"> <button type="button" class="layui-btn layui-btn-primary">编辑</button></a>
        </div>
    </div>
    <div class="layui-col-xs8 layui-col-md8" style="height: 600px;width: 90%;border: 2px solid slategrey">
        <div class="grid-demo grid-demo-bg2">
            <div id="attrListInner"></div>
        </div>
    </div>
</div>
</body>
</html>
