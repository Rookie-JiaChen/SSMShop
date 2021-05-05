<%--
  Created by IntelliJ IDEA.
  User: JiaChen
  Date: 2020/6/21
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改商品</title>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
</head>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/bootstrap/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<style>
    .tab{
        padding: 5px;
        left: 10%;
        position: absolute;
        width: 40%;
        height: auto;
    }
</style>
<body>
<div class="" style="float: left"><jsp:include page="left.jsp"></jsp:include></div>

<div class="tab">
<form class="form-horizontal" action="/admin/UpdateGoods.do" enctype="multipart/form-data" method="post">
    <div class="form-group">
        <label  class="col-sm-2 control-label">Id</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="id" placeholder="Id" name="goodsid" value="${goods.goodsid}" readonly="true">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">类型</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="type" placeholder="Type" name="typeid" value="${goods.typeid}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">商品名称</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="name" placeholder="Name" name="goodsname" value="${goods.goodsname}">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">规格</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="size" placeholder="Size" name="size" value="${goods.size}">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">商品价格</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="goodsprice" placeholder="Price" name="goodsprice" value="${goods.goodsprice}">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">图片</label>
        <div class="col-sm-10">
            <img src="/images/${goods.images}" class="img-circle" height="50px" width="50px">
            <input type="file" class="form-control" id="file" name="file" placeholder="Image">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">商品介绍</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="introduction" placeholder="Introduction" name="introduction" value="${goods.introduction}">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">确认修改</button>
        </div>
    </div>
</form>
</div>

</body>
</html>
