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
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="shortcut icon" type="image/icon" href="../images/jd.ico">
<link rel="stylesheet" href="../layui/css/layui.css"/>
<script type="text/javascript" src="../layui/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<head>
    <title>Title</title>
</head>
<script>
    var indexs = 1;
    function goto_addSh_msh(index) {
        addSh_msh(indexs);
        indexs = indexs+1;
    }
    function addSh_msh(index) {
      var a= '<br> <table border="1px" width="600px" id="t_'+index+'" class="layui-table"> ';
      var b = '<tr><td>属性名:<input type="text" name="list_attr['+index+'].shxm_mch"></td><td></td><td><select onclick="addTd(this,this.value)" style="border: none"><option value="'+index+'">添加属性值</option></select></td></tr>'
      var c = '<tr><td>属性值:<input type="text" name="list_attr['+index+'].list_value[0].shxzh"></td><td>单位:<input type="text" name="list_attr['+index+'].list_value[0].shxzh_mch"></td><td>删除</td></tr>';
      var d = ' <tr><td>属性值:<input type="text" name="list_attr['+index+'].list_value[1].shxzh"></td><td>单位:<input type="text" name="list_attr['+index+'].list_value[1].shxzh_mch"></td><td>删除</td></tr>';
      var e = '</table >'
      $("#t_"+(index-1)).after(a+b+c+d+e);
    }
    function addTd(thiss){
        var index = thiss.value;
        var id = thiss.parentNode.parentNode.parentNode.parentNode.id;
        var lenght = document.getElementById(id).rows.length-1;
        var d = ' <tr><td>属性值:<input type="text" name="list_attr['+index+'].list_value['+lenght+'].shxzh"></td><td>单位:<input type="text" name="list_attr['+index+'].list_value['+lenght+'].shxzh_mch"></td><td>删除</td></tr>';
        $("#"+id).append(d);
    }
</script>
<body>
    商品属性信息添加
    <hr style="height: 2px;background-color: lightgrey">
    <button onclick="goto_addSh_msh()" value="添加属性表格" class="layui-btn layui-btn-primary">添加属性表格${flbh2}</button>
    <form action="attr_add.do">
        <input type="text" name="flbh2" value="${flbh2}" style="display: none">
            <table border="1px" width="600px" id="t_0" class="layui-table">
                <tr><td>属性名:<input type="text" name="list_attr[0].shxm_mch"></td><td></td>
                    <td>
                    <select  onclick="addTd(this)" style="border:none">
                        <option value="0">添加属性值</option>
                    </select>
                    </td>
                </tr>
                <tr><td>属性值:<input type="text" name="list_attr[0].list_value[0].shxzh"></td><td>单位:<input type="text" name="list_attr[0].list_value[0].shxzh_mch"></td><td>删除</td></tr>
                <tr><td>属性值:<input type="text" name="list_attr[0].list_value[1].shxzh"></td><td>单位:<input type="text" name="list_attr[0].list_value[1].shxzh_mch"></td><td>删除</td></tr>
            </table >
        <br>
        <button type="submit" value="添加" class="layui-btn layui-btn-primary">添加</button>
    </form>

</body>
</html>
