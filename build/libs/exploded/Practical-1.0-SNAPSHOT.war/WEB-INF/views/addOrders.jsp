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
    <title>添加订单</title>
    <%--    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />--%>
</head>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/bootstrap/js/jquery-3.4.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
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
    <form class="form-horizontal" action="/admin/addOrders.do" method="post">
        <div class="form-group">
            <label  class="col-sm-2 control-label">用户ID</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="userid" placeholder="userid" name="userid" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">商品类型</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="goodstag" placeholder="goodstag" name="goodstag" >
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">数量</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="quantity" placeholder="quantity" name="quantity">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">购买者</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="buyer" placeholder="buyer" name="buyer" >
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="sex" placeholder="sex" name="sex" >
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">地址</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="address" placeholder="address" name="address" >
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">联系方式</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="telephone" placeholder="telephone" name="telephone" >
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">快递类型</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="express" placeholder="express" name="express" >
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">订单日期</label>
            <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                <input class="form-control" size="16" type="text" id="orderdate" name="orderdate" value="" readonly>
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
            <input type="hidden" id="dtp_input2" value="" /><br/>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">描述</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="state" placeholder="state" name="state" >
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">总计</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="total" placeholder="total" name="total" >
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
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('.form_time').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
</script>
</html>
