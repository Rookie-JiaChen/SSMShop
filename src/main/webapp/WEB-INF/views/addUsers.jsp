<%--
  Created by IntelliJ IDEA.
  User: JiaChen
  Date: 2020/6/21
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
<%--    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />--%>
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
    <form class="form-horizontal" action="/admin/addUsers.do" method="post">
        <div class="form-group">
            <label  class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="username" placeholder="username" name="username" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="password" placeholder="password" name="password" >
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="email" placeholder="email" name="email">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">联系方式</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="telephone" placeholder="telephone" name="telephone" >
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">确认提交</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>
