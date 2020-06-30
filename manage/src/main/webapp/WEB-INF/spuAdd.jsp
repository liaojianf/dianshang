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

    var tp_num = 3;
    $(function () {
        $("#tp_nums").text("还可添加"+(tp_num+2)+"张图片！");
    })
    function click_image(index){
        $("#file_"+index).click();
    }
    function chang_image(index) {
        var blob_image = $("#file_"+index)[0].files[0];
        var url = window.URL.createObjectURL(blob_image);
        //替换image
        $("#image_"+index).attr("src",url);
        var length = $(":file").length;
        if((index+1) == length){
            add_image(index);
        }

    }
    function add_image(index) {
        if (tp_num>-1){
            $("#tp_nums").text("还可添加"+(tp_num+1)+"张图片！");
            tp_num = tp_num-1;
            var a = '<div id="d_'+(index+1)+'" style="float: left;border: 1px black solid;margin-left: 15px;">';
            var b = '<img src="../images/upload_hover.png" id="image_'+(index+1)+'" style="cursor: pointer; width: 100px;height: 100px"  onclick="click_image('+(index+1)+')"/>';
            var c = '<input id="file_'+(index+1)+'" type="file" name="files" style="display: none;"  onchange="chang_image('+(index+1)+')"/><br>';
            var d = '</div>';
            $("#d_"+index).after(a+b+c+d);
        }else {
            alert("添加的图片过多!!!");
            $("#tp_nums").css("display","none");
        }

    }
</script>
<body>
<%--   flbh 分列编号--%>
spu信息添加:${spu.flbh1}/${spu.flbh2}/${spu.pp_id}
<hr style="height: 2px;background-color: lightgrey">
<%--以这种二进制的multipart--%>
<form action="spu_add.do" enctype="multipart/form-data" method="post">
    <input type="hidden" name="flbh1" value="${spu.flbh1}" />
    <input type="hidden" name="flbh2" value="${spu.flbh2}"/>
    <input type="hidden" name="pp_id" value="${spu.pp_id}"/>
    商品名称:<input type="text" name="shp_mch"/><br>
    商品描述:<textarea rows="10" cols="50" name="shp_msh"></textarea><br>
    商品图片:<br>
    <p id="tp_nums"></p>
    <div id="d_0">
        <img src="../images/upload_hover.png" id="image_0" style="cursor: pointer; width: 100px;height: 100px;float: left;margin-top: 16px;margin-left: 15px;border: 1px black solid"  onclick="click_image(0)">
        <input id="file_0" type="file" name="files" style="display: none;" onchange="chang_image(0)"/><br>
    </div>
    <hr>
    商品颜色:
    <div id="col_0">
        <input type="text" name="list_color[0].shp_ys" style="width: 100px">
        <input type="text" name="list_color[1].shp_ys" style="width: 100px">
    </div>
    <hr>
    商品版本:
    <div id="ver_0">
        <input type="text" name="list_version[0].shp_bb" style="width: 100px">
        <input type="text" name="list_version[1].shp_bb" style="width:100px;">
    </div>
    <hr>
    <input  type="submit" value="提交" class="btn-primary"/>
</form>


</body>
</html>
