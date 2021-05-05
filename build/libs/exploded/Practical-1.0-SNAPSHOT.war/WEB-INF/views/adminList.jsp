
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
    <title>管理员列表</title>
</head>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/bootstrap/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
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
    .admininfo{
        position: relative;
        text-align: center;
    }
</style>
<body>
<div class="" style="float: left"><jsp:include page="left.jsp"></jsp:include></div>
<div class="admininfo">
    <h5 style="color: #9acfea">你好,管理员:
        <%Cookie[] cookies=request.getCookies();
            if (cookies!=null){
                for(int i=0;i<cookies.length;i++){
                    if(cookies[i].getName().equals("adminname")){
                        out.println(cookies[i].getValue());
                    }
                }
            } else{
                out.println("没有登陆");
            }
        %>
    </h5>
</div>

<div class="tab">
    <table class="table table-hover">
        <tr>
            <th>管理员ID</th>
            <th>用户名</th>
            <th>密码</th>
            <th>邮箱</th>
            <th>电话</th>
            <th>删除</th>
            <th>修改</th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="admin">
            <tr>
                <td>${admin.adminid}</td>
                <td>${admin.adminname}</td>
                <td>${admin.password}</td>
                <td>${admin.email}</td>
                <td>${admin.telephone}</td>
                <td><a href="/admin/deleteAdmin.do?adminid=${admin.adminid}">删除</a></td>
                <td><a href="/admin/toUpdateAdmin.do?adminid=${admin.adminid}">修改</a></td>
            </tr>
        </c:forEach>
    </table>
    <div class="row">
        <div class="col-md-6"> 第 ${pageInfo.pageNum} 页 ， 共 ${pageInfo.pages} 页 ， 共 ${pageInfo.total}条记录
        </div>
        <div class="col-md-6 offset-md-4">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item">
                        <a class="page-link" href="adminList.do?page=1">首页</a>
                    </li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li class="page-item">
                            <a class="page-link" href="adminList.do?page=${pageInfo.pageNum-1}">上一页</a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfo.pageNum}">
                            <li class="page-item active">
                                <a class="page-link" href="#">${page}</a>
                            </li> </c:if> <c:if test="${page!=pageInfo.pageNum}">
                        <li class="page-item">
                            <a class="page-link" href="adminList.do?page=${page}">${page}</a>
                        </li>
                    </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li class="page-item">
                            <a class="page-link" href="adminList.do?page=${pageInfo.pageNum+1}">下一页</a>
                        </li>
                    </c:if>
                    <li class="page-item">
                        <a class="page-link" href="adminList.do?page=${pageInfo.pages}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
