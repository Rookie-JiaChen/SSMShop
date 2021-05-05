<%--
  Created by IntelliJ IDEA.
  User: JiaChen
  Date: 2020/6/23
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加订单</title>
</head>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
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
        width:1000px;
        clear:both;
        margin: 0px auto;
        padding-top: 10%;
    }
    #content img{ margin-left:20px; margin-top:10px;}
    th{ background-color:#fc6a15;}
    #dingdan{ width:1000px; border:2px solid #999;padding:0 0px 10px 0px;}
    #dingdan h3{  background-color:#f85963; width:1000px; text-align:center;  }
    #tianxie{ margin:0px auto;}
    #tianxie tr {
        margin-bottom:5px;}
    .butt {
        width:100px;
        height:30px;
        line-height:30px;
        background:#fc6a15;
        border-radius:10px;
        border:0px;
        -moz-border-radius:10px;
        display:inline-block;
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
    <div id="dingdan">
        <h3 style="color:#FFF; font-size:15px;">请添写收货人信息</h3>

        <form action="/user/addOrders.do"  method="post">
            <table width="261" border="0" bordercolor="#FF9900" id="tianxie" cellspacing="0" cellpadding="0" >
                <tr>
                    <td width="88" height="35"><p>收货人姓名： </p></td>
                    <td width="166"><input  name="buyer" type="text" style="background-color:#e8f4ff " onMouseOver="this.style.backgroundColor='#ffffff'" onMouseOut="this.style.backgroundColor='#e8f4ff'"></td>
                </tr>
                <tr>
                    <td width="88" height="35"><p>收货人性别： </p></td>
                    <td width="166"><input type="radio" name="sex" value="女"  checked="checked"/>女<input type="radio" name="sex" value="男"/>男</td>
                </tr>
                <tr>
                    <td height="34">收货人地址：</td>
                    <td><input name="address" type="text" style="background-color:#e8f4ff " onMouseOver="this.style.backgroundColor='#ffffff'" onMouseOut="this.style.backgroundColor='#e8f4ff'">  </td>
                </tr>
                <tr>
                    <td height="34"><p>联系电话：</p></td>
                    <td><input name="telephone" type="text" style="background-color:#e8f4ff " onMouseOver="this.style.backgroundColor='#ffffff'" onMouseOut="this.style.backgroundColor='#e8f4ff'"></td>
                </tr>
                <tr>
                    <td height="34"><p>送货方式:</p></td>
                    <td><select name="express">
                        <option selected="selected">嘉辰快递</option>
                        <option>顺光快递</option>
                        <option>顺风快递</option>
                        <option>顺水快递</option>
                    </select></td>
                </tr>
                <tr>
                    <td colspan="2"> <div align="center">
                        <input name="submit" type="submit" class="butt" value="提交订单">
                        <input name="reset" type="reset" class="butt" value="重置订单" />
                    </div></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
<script type="text/javascript" src="/bootstrap/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
<script>
    $(window).scroll(function () {
        if ($(".navbar").offset().top > 50) {$(".navbar-fixed-top").addClass("top-nav");
        }else {$(".navbar-fixed-top").removeClass("top-nav");}
    })
</script>
</html>
