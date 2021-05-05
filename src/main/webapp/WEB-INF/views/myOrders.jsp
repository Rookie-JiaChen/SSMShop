
<%--
  Created by IntelliJ IDEA.
  User: JiaChen
  Date: 2020/6/13
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的订单</title>
</head>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/bootstrap/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
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
    .tab{
        padding: 5px;
        float: right;
        text-align: center;
        width: 90%;
        height: auto;
    }
    table{
        border: 1px solid #9acfea;
        text-align: center;
    }
    #content{
        width:1000px;
        clear:both;
        margin: 0px auto;
        padding-top: 10%;
    }
    #content img{ margin-left:20px; margin-top:10px;}
    th{ background-color:#fc6a15; border:0px;}
    #dingdan{ width:1000px; border:0px; }
    #content h1{  width:1000px; text-align:center;  }

    td{ height:50px; text-align:center; line-height:50px ; }

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
                    <li><a href="/login.jsp">登陆|注册</a></li>
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
    <h1>我的订单</h1>
    <form action="" method="post">
        <table width="1000" border="1" bordercolor='#006600' bgcolor="#FFFFFF"  cellspacing="0" >
            <tr>
                <td width="8" style="border:0px;"><table width="1000" border="1" bordercolor='#006600' bgcolor="#FFFFFF"  cellspacing="0" >
                    <tr >
                        <th width="123" >订单号</th>
                        <th width="117">收货人</th>
                        <th width="121">付款方式</th>
                        <th width="128">订单总金额</th>
                        <th width="121">订单状态</th>
                        <th width="123">下单时间</th>
                        <th width="225">操作</th>
                    </tr>
                <c:forEach items="${pageInfo.list}" var="orders">
                    <tr>
                        <td>${orders.orderid} </td>
                        <td>${orders.buyer}</td>
                        <td><span title="货到付款">货到付款</span></td>
                        <td>￥${orders.total}</td>
                        <td>${orders.state}</td>
                        <td>${orders.orderdate}</td>
                        <td><a href="/user/delOrders.do?orderid=${orders.orderid}">取消订单</a></td>
                    </tr>
                    </c:forEach>
    </form>
</div>


    <div class="row">
        <div class="col-md-6"> 第 ${pageInfo.pageNum} 页 ， 共 ${pageInfo.pages} 页 ， 共 ${pageInfo.total}条记录
        </div>
        <div class="col-md-6 offset-md-4">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item">
                        <a class="page-link" href="myOrders.do?page=1">首页</a>
                    </li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li class="page-item">
                            <a class="page-link" href="myOrders.do?page=${pageInfo.pageNum-1}">上一页</a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfo.pageNum}">
                            <li class="page-item active">
                                <a class="page-link" href="#">${page}</a>
                            </li> </c:if> <c:if test="${page!=pageInfo.pageNum}">
                        <li class="page-item">
                            <a class="page-link" href="myOrders.do?page=${page}">${page}</a>
                        </li>
                    </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li class="page-item">
                            <a class="page-link" href="myOrders.do?page=${pageInfo.pageNum+1}">下一页</a>
                        </li>
                    </c:if>
                    <li class="page-item">
                        <a class="page-link" href="myOrders.do?page=${pageInfo.pages}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
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
