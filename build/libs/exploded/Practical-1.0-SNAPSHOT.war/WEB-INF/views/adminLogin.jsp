<%--
  Created by IntelliJ IDEA.
  User: JiaChen
  Date: 2020/6/20
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理登陆</title>
</head>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="/bootstrap/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.js"></script>
<style>
    .div1{
        padding: 0px;
        margin: 0px auto;
        text-align: center;
        width: 300px;
        height: 300px;
    }
</style>
<body>
<div class="div1" >
    <h2 style="color: #2aabd2">管理登陆</h2>
    <form class="bs-example bs-example-form" role="form" method="post" action="/admin/login.do">
        <div class="input-group">
            <span class="input-group-addon">账号</span>
            <input type="text" class="form-control" name="adminname" placeholder="请输入账号">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">密码</span>
            <input type="password" class="form-control" name="password" placeholder="请输入密码">
        </div>
        <br>
        <%--            <div class="input-group">--%>
        <%--                <span class="input-group-addon">类型</span>--%>
        <%--                <input type="text" class="form-control" name="type" placeholder="请输入类型">--%>
        <%--            </div>--%>
<%--        <div class="checkbox">--%>
<%--            <label class="radio-inline">--%>
<%--                <input type="radio" name="user_type" id="student" value="1" checked> 学生--%>
<%--            </label>--%>
<%--            <label class="radio-inline">--%>
<%--                <input type="radio" name="user_type" id="teacher" value="2"> 教师--%>
<%--            </label>--%>
<%--            <label class="radio-inline">--%>
<%--                <input type="radio" name="user_type" id="admin" value="3"> 管理员--%>
<%--            </label>--%>
<%--        </div>--%>

        <br>

        <div>
            <button id="fat-btn" class="btn btnlog btn-primary" data-loading-text="登陆中..."
                    type="submit"> 登陆
            </button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="fat-btn" class="btn btn-primary" type="reset">重写</button>
        </div>
        <form>
</div>
</body>
<script>
    $(function() {
        $(".btnlog").click(function(){
            $(this).button('loading').delay(1000).queue(function() {
                // $(this).button('reset');
                // $(this).dequeue();
            });
        });
    });
</script>
</html>
