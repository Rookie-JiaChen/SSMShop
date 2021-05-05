<%--
  Created by IntelliJ IDEA.
  User: JiaChen
  Date: 2020/6/21
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
    h4{
        color: #5bc0de;
    }
</style>
<body>
<h4>嘉辰商城管理后台</h4>
<ul class="nav nav-pills nav-stacked" >
    <li role="presentation" class="active">
        <a href="#" data-toggle="collapse" data-target="#listq" >商品管理</a>
        <ul id="listq"  class="collapse in">
            <li >
                <a href="/admin/goodsList.do">
                    商品信息
                </a>
            </li>
            <li >
                <%--传入names给查询，查询哪个表的名字--%>
                <a href="/Student/search.do">
                    查询商品信息
                </a>
            </li>
            <li>
                <a href="/admin/toAddGoods.do">
                    添加商品</a>
            </li>
        </ul>
    </li>
    <li role="presentation"><a href="#" data-toggle="collapse"  data-target="#list1">用户管理</a>
        <ul id="list1" class="collapse in">
            <li class="active">
                <a href="/admin/usersList.do">
                    用户信息
                </a>
            </li>
            <li class="active">
                <a href="#">
                    查询用户信息
                </a>
            </li>
            <li><a href="/admin/toAddUsers.do">添加用户</a></li>
        </ul></li>
    <li role="presentation"><a href="#" data-toggle="collapse"  data-target="#list2">管理员管理</a>
        <ul id="list2" class="collapse in">
            <li class="active">
                <a href="/admin/adminList.do">
                    管理员信息
                </a>
            </li>
            <li class="active">
                <a href="#">
                    查询管理员信息
                </a>
            </li>
            <li><a href="/admin/toAddAdmin.do">添加管理员</a></li>
        </ul></li>
    <li role="presentation"><a href="#" data-toggle="collapse"  data-target="#list3">订单管理</a>
        <ul id="list3" class="collapse in">
            <li class="active">
                <a href="/admin/ordersList.do">
                    订单信息
                </a>
            </li>
            <li class="active">
                <a href="#">
                    查询订单信息
                </a>
            </li>
            <li><a href="/admin/toAddOrders.do">添加订单</a></li>
        </ul>
    </li>
<%--    <li role="presentation"><a href="#" data-toggle="collapse"  data-target="#list4">专业管理</a>--%>
<%--        <ul id="list4" class="collapse in">--%>
<%--            <li >--%>
<%--                <a href="/MajorServlet/listmajor">--%>
<%--                    专业信息--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            <li class="active">--%>
<%--                <a href="/cx.jsp?names=/MavenTest/MajorServlet/search">--%>
<%--                    查询信息--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            <li><a href="/insertZhuanye.jsp">添加专业</a></li>--%>
<%--        </ul>--%>
<%--    </li>--%>
</ul>
</body>
</html>
