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
<link rel="stylesheet" type="text/css" href="css/css.css">
    <link rel="shortcut icon" type="image/icon" href="images/logos.jpg">
<link rel="stylesheet" href=" static/bootstrap-3.3.7-dist/css/bootstrap.css"/>
<link rel="stylesheet" href=" layui/css/layui.css"/>
    <script type="text/javascript" src=" static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script type="text/javascript" src=" layui/layui.js"></script>
<script type="text/javascript" src=" js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
    var a=0;
    function save_param(shxm_id,shxzh_id,shxmch) {
        var a=0;
        $("#paramArea span[name = 'shxparams']").each(function (i,json) {
            if (shxzh_id==json.id){
                a=1;
                $("#"+shxzh_id).remove();
            }
        })
        if(a==0){
            $("#paramArea").append("<span id='"+shxm_id+"-"+shxzh_id+"' name='shxparams' onclick='removes(this)' class='layui-btn layui-btn-primary layui-btn-xs'>" +
                "<input name='shxparam' type='text' value='{\"shxm_id\":"+shxm_id+",\"shxzh_id\":"+shxzh_id+"}' style='width: 160px;text-align: center;display: none'>"+shxmch+'&#12288;'
                +"</span>");
            get_list_by_attr();
        }
        $("#"+shxm_id+"s").hide();
    }

    function get_list_by_attr(){
        //获取参数
        // var param_arry = new Array();
        <%--var jsonStr = "flbh2="+${flbh2};--%>
        var kong = 1;
        var AttrJson = {};

        $("#paramArea input[name = 'shxparam']").each(function (i,data){
           var json  = $.parseJSON(data.value);
            AttrJson["list_attr["+i+"].shxm_id"] = json.shxm_id;
            AttrJson["list_attr["+i+"].shxzh_id"] = json.shxzh_id;
            AttrJson["flbh2"] = ${flbh2};
            // jsonStr = jsonStr +"&list_attr["+i+"].shxm_id="+json.shxm_id+"&list_attr["+i+"].shxzh_id="+json.shxzh_id;
        })

        //异步提交请求
        //刷新商品列表
        if ($("#paramArea input[name = 'shxparam']").length==0){
            window.location.href="goto_list.do?flbh2="+${flbh2};
        }else {
            $.get("get_list_by_attr.do",AttrJson,function (data) {
                $("#skuListInner").html(data);
            })
        }

    }

    function removes(thiss) {

        var id1 = thiss.id;
        var id_arry = id1.split("-");
        $("#"+id1).remove();
        $("#"+id_arry[0]+"s").show();
        get_list_by_attr();

    }
    function select() {
        var AttrJson = {};
        $("#paramArea input[name = 'shxparam']").each(function (i,data){
            var json  = $.parseJSON(data.value);
            AttrJson["list_attr["+i+"].shxm_id"] = json.shxm_id;
            AttrJson["list_attr["+i+"].shxzh_id"] = json.shxzh_id;
            AttrJson["flbh2"] = ${flbh2};
            // jsonStr = jsonStr +"&list_attr["+i+"].shxm_id="+json.shxm_id+"&list_attr["+i+"].shxzh_id="+json.shxzh_id;
        })

        //异步提交请求
        //刷新商品列表
        $.get("get_list_by_attr.do",AttrJson,function (data) {
            $("#skuListInner").html(data);
        })
    }
</script>
<title>剑来商城</title>
</head>
<body>
    商品属性
    <div id="paramArea">

    </div>
    <hr style="margin: 0px">
      价格:&#12288;&#12288;0-4399&#12288;&#12288;4400-5699&#12288;&#12288;5700-6499&#12288;&#12288;6500-7299
       &#12288;&#12288;7300-8799&#12288;&#12288;<input type="text" style="width: 50px;" class="layui-btn layui-btn-primary layui-btn-xs"><input type="text" style="width: 50px;" class="layui-btn layui-btn-primary layui-btn-xs"><button value="确认" class="layui-btn layui-btn-primary layui-btn-xs">确认</button>
    <hr style="margin: 0px">
    <c:forEach items="${list_attr}" var="attr">
        <span id="${attr.id}s">
              ${attr.shxm_mch}:
                    <c:forEach items="${attr.list_value}" var="val">
                        &#12288;&#12288;<a href="javascript:save_param(${attr.id},${val.id},'${val.shxzh}${val.shxzh_mch}');">${val.shxzh}${val.shxzh_mch}</a>&#12288;&#12288;
                    </c:forEach>
            <hr style="margin: 0px">
        </span>
        </c:forEach>
</body>
</html>