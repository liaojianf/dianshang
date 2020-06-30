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
    <link rel="shortcut icon" type="image/icon" href="images/logos.jpg">
    <link rel="stylesheet" type="text/css" href="css/css.css">
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        function cart_submit(){

            $("#cart_form").submit();
        }
    </script>
    <title>剑来商城</title>
</head>
<body>
<div class="Dbox">
    <div class="box">
        <div class="left">
            <div class="timg"><img src="images/img_5.jpg" alt=""></div>
            <div class="timg2">
                <div class="lf"><img src="images/lf.jpg" alt=""></div>
                <div class="center">
                    <span><img src="images/icon_2.jpg" alt=""></span>
                    <span><img src="images/icon_3.jpg" alt=""></span>
                    <span><img src="images/icon_2.jpg" alt=""></span>
                    <span><img src="images/icon_3.jpg" alt=""></span>
                    <span><img src="images/icon_2.jpg" alt=""></span>
                </div>
                <div class="rg"><img src="images/rg.jpg" alt=""></div>
            </div>
            <div class="goods"><img src="images/img_6.jpg" alt=""></div>
        </div>
        <div class="cent">
            <div class="title">${obj_sku.sku_mch}</div>
            <div class="bg">
                <p>市场价：<strong>￥${obj_sku.jg}</strong></p>
                <p>促销价：<strong>￥${obj_sku.jg}</strong></p>
            </div>
            <div class="clear">
            <div class="min_t">选择款式：</div>
            <c:forEach items="${list_sku}" var="sku">

                    <c:if test="${sku.id==obj_sku.id}">
                        <div class="min_mx" style="border:3px red solid">
                            <a href="goto_sku_detail.do?sku_id=${sku.id}&spu_id=${sku.shp_id}" >
                                ${sku.sku_mch}</a></div>
                    </c:if>
                <c:if test="${sku.id!=obj_sku.id}">
                    <div class="min_mx"><a href="goto_sku_detail.do?sku_id=${sku.id}&spu_id=${sku.shp_id}" >
                            ${sku.sku_mch}</a></div>
                </c:if>
            </c:forEach>
        </div>  <div class="clear">
            <div class="min_t">选择版本：</div>
            <c:forEach items="${colver}" var="cv">
                <c:choose>

                    <c:when test="${cvid.get(0)==cv.colorList.id && cvid.get(1)==cv.versionList.id}">    <!--如果 -->
                        <span id="${cv.colorList.id}${cv.versionList.id}">
                <div class="min_mx" style="border:3px red solid">
                    <a href="goto_sku_detail.do?sku_id=${sku.id}&spu_id=${sku.shp_id}&cid=${cv.colorList.id}&vid=${cv.versionList.id}">
                        ${cv.colorList.shp_ys}${cv.versionList.shp_bb}</a></div>
                </span>
                    </c:when>

                    <c:otherwise>  <!--否则 -->
                        <span id="${cv.colorList.id}${cv.versionList.id}">
                <div class="min_mx" >
                    <a href="goto_sku_detail.do?sku_id=${obj_sku.id}&spu_id=${obj_sku.spu.id}&cid=${cv.colorList.id}&vid=${cv.versionList.id}">
                        ${cv.colorList.shp_ys}${cv.versionList.shp_bb}</a></div>
                </span>
                    </c:otherwise>

                </c:choose>

            </c:forEach>

            <div class="clear">
                <div class="min_t" >服务：</div>
                <div class="min_mx" >售后服务</div>
                <div class="min_mx" >维修服务</div>
                <div class="min_mx" >退款换货服务</div>
                <div class="min_mx" >联系客服(可转人工)</div>
                <div class="min_mx" >满一万减1999活动火热进行中!!!</div>
            </div>
            <div class="clear" style="margin-top:20px;">
                <div class="min_t" style="line-height:36px">数量：</div>
                <div class="num_box">
                    <input type="text" name="num" value="1" style="width:40px;height:32px;text-align:center;float:left">
                    <div class="rg">
                        <img src="images/jia.jpg" id='jia' alt="">
                        <img src="images/jian.jpg" id='jian' alt="">
                    </div>
                </div>
            </div>
            <div class="clear" style="margin-top:20px;">
                <form  id="cart_form" action="add_cart.do" method="post">
                    <input type="hidden" name="sku_mch" value="${obj_sku.sku_mch}" />
                    <input type="hidden" name="sku_jg" value="${obj_sku.jg}" />
                    <input type="hidden" name="tjshl" value="1" />
                    <input type="hidden" name="hj" value="${obj_sku.jg}" />
                    <input type="hidden" name="shp_id" value="${obj_sku.shp_id}" />
                    <input type="hidden" name="sku_id" value="${obj_sku.id}" />
                    <input type="hidden" name="shp_tp" value="${obj_sku.spu.shp_tp}" />
                    <input type="hidden" name="shfxz" value="1" />
                    <input type="hidden" name="kcdz" value="${obj_sku.kcdz}" />
                    <c:if test="${not empty user}">
                        <input type="text" name="yh_id" value="${user.id}" />
                    </c:if>
                    <img src="images/shop.jpg" onclick="cart_submit()" alt="" style="cursor:pointer;">
                </form>

            </div>
        </div>
    </div>
</div>
<div class="Dbox1">
    <div class="boxbottom">
        <div class="top">
            <span>商品详情</span>


            <span>评价</span>
        </div>
        <div class="btm">
            商品描述:${obj_sku.spu.shp_msh}<hr>
            <c:forEach items="${obj_sku.list_image}" var="image">
                <img src="upload/image/${image.url}" height="200px"/>
            </c:forEach>
            <hr>
            <c:forEach items="${obj_sku.list_av_name}" var="av_name">
                ${av_name.shxm_mch}:${av_name.shxzh_mch}<br>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
