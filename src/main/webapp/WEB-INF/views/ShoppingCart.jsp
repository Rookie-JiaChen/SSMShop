<%--
  Created by IntelliJ IDEA.
  User: JiaChen
  Date: 2020/6/22
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>购物车</title>
</head>
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<style>
    .my-navbar {
        background-color: #3c3c3c;
        padding:10px 0;
        opacity: 0.8;
        transition: background 0.5s ease-in-out, padding 0.5s ease-in-out;}

    .my-navbar a{
        background:transparent !important;
        color:#fff !important
    }
    .my-navbar a:hover {
        color:#45bcf9 !important;
        background: transparent;
        outline:0}
    .my-navbar a {
        transition: color 0.5s ease-in-out;
    }/*-webkit-transition ;-moz-transition*/
    .top-nav {
        padding:0;
        background:#000;
    }
    button.navbar-toggle {
        background-color:#fbfbfb;
    }/*整个背景都是transparent透明的，会看不到，所以再次覆盖一下*/
    button.navbar-toggle > span.icon-bar
    {
        background-color:#dedede
    }
    #content{
        width:1500px;
        clear:both;
        margin: 0px auto;
        padding-top: 10%;
    }
    #content p { margin-bottom:20px;
        height:60px;
        font-size:12px;
        line-height:20px;
        padding:10px 5px 5px 8px;
        color:#FFF;
    }
    #content  p img {
        vertical-align:middle;

        padding-right:10px; margin-bottom:10px;

    }

    th{ background-color:#f85963; border:0px;  }
    td{ text-align:center; font-size:14px; border:0px; border-right:2px solid #254B62;background-color:#FFFFFF;   }

    #ft{ width:1000px; height:50px;  }
    #ft p{ height:10px;}
    #ft .p2{ color:#000; text-align:right; float:right; }

    #ft .p1{ text-align:left; float:left;}
    .i1{
        float:right;
        height:38px;
    }
    #footer {
        clear:both;
        width:1000px;
        text-align:center;
        margin-top:20px;
        height:40px;
        padding-top:5px;
        background-color:#fc6a15;
    }

    .butt {
        width:100px;
        height:30px;
        line-height:30px;
        background:#fc6a15;
        border-radius:10px;
        -moz-border-radius:10px;
        display:inline-block;
        border:0px;
        text-align:center;}
</style>
<body>
<div>
    <nav class="navbar navbar-fixed-top my-navbar" role="navigation">
        <div class="container-fluid">

            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#example-navbar-collapse">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/list.do">嘉辰商城</a>
            </div>

            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">没想好不知道写啥哈哈哈哈</a></li>
                    <li><a href="login.jsp">登陆|注册</a></li>
                    <li>
                        <a href="#">
                            <%Cookie[] cookies=request.getCookies();
                                if (cookies!=null){
                                    for(int i=0;i<cookies.length;i++){
                                        if(cookies[i].getName().equals("username")){
                                            out.println("你好,"+cookies[i].getValue());
                                        }
                                    }
                                }
                            %>
                        </a>
                    </li>
                    <li><a href="/showCart.do">购物车</a></li>
                    <li><a href="/user/myOrders.do">我的订单</a></li>
                </ul>
            </div>

        </div>
    </nav>
</div>
<div id="content">
    <h3 style="color: #5bc0de;text-align:center">购物车</h3>
    <form  method="post" onsubmit="return slyz()">
        <table width="auto" border="1"cellspacing="0" >
            <tr style="color:#FFFFFF;" >
                <th width="214" >商品名称</th>
                <th width="252">商品价格</th>
                <th width="261">商品数量</th>
                <th width="261">小计</th>
                <th width="255">操作</th>
            </tr>
            <c:forEach items="${ cart }" var="carts">
            <tr >
                <td style="border-top:1px #254B62 solid;"><p><img src="/images/${carts.key.images}" width="44" height="59" onload="resizeImage(this)"/><a href="/goodsInfo.do?id=${carts.key.goodsid}">${carts.key.goodsname}</a></p></td>
                <td style="border-top:1px #254B62 solid;">￥${carts.key.goodsprice} </td>
                <td style="border-top:1px #254B62 solid;"><input type="text" name="num[]" id="textfield"  value="${carts.value}"onblur="slyz()"/></td>
                <td style="border-top:1px #254B62 solid;">￥${carts.key.goodsprice*carts.value} </td>
                <td style="border-top:1px #254B62 solid; border-right:0px"><a href="javascript:void(0);" onclick="confrimDelete('${carts.key.goodsid}')">取消商品</a></td>
            </tr>
            </c:forEach>
        </table>
        <div id="ft">
            <p><span class="p1">
<%--        <input type="submit" name="updateGoodNum" value="修改商品数量" class="butt" />--%>
        &nbsp;&nbsp;&nbsp;&nbsp;</span><span class="p1"><a href="clearShoppingCar.do" class="butt">清空购物车</a> </span> <span class="p2" > 商品金额总计：未知 </span></p>
        </div>
        <a href="/user/toAddOrders.do" class="butt">提交订单</a>
        <a href="/list.do" style="position: absolute;right: 25%" class="butt">继续购物</a>
    </form>
</div>
</body>
<script type="text/javascript" src="/bootstrap/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
<script>
    $(window).scroll(function () {
        if ($(".navbar").offset().top > 50) {$(".navbar-fixed-top").addClass("top-nav");
        }else {$(".navbar-fixed-top").removeClass("top-nav");}
    })</script>

</html>
