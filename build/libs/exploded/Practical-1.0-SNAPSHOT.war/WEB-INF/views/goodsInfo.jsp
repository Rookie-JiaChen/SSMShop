<%--
  Created by IntelliJ IDEA.
  User: JiaChen
  Date: 2020/6/19
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品详情</title>
</head>
<script language="javascript">
    function resizeImage(obj){if(obj.height>300)obj.height=300;if(obj.width>300)obj.width=300; }
</script>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">

<style type="text/css">
    /*html, body {*/
    /*  width:100%;*/
    /*  height:100%;*/
    /*          } !*非常重要的样式让背景图片100%适应整个屏幕*!*/
    .bg {
        display: table;
        width: 100%;
        height: 500%;
        padding: 10px 0;
        text-align: center;
        color: #fff;
        background: no-repeat bottom center;
        background-color: #ffffff;
        background-size: cover;}
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

     #right{
         width:750px;
         margin:0 auto;
         padding: 100px;
     }
     #right	 h3{ border-bottom: 1px dotted #999;}
     #right	 h3 span{ color:#00F; float:right;}

     #rleft { float:left;}

     #rleft .img2{ float:left; margin-top:60px;}

     #rright {
         /*float:right;*/
         position: absolute;
         left: 53%;
         margin:50px 0px 0px 10px;
         font-size:12px;
         color:#254B62;
     }

     #rright p{ line-height:30px; letter-spacing:3px;}
     #rright .p1 span{ color:#03F; float:right; padding-right:15px;}

     #rright .p2 span{ color:#F00; font-size:18px; font-weight:bold;  }
     #rright .p3  span{ color:#F00;}
     #rright .p4   span{ color:#4669ef;}
     #rright .p5   span{ color:#4669ef;}
     #rright  img{vertical-align:bottom; padding-top:10px; padding-left:5px; }
     #rfooter{ clear:both;}
     #rfooter ul{ list-style:none; width:750px ; border-bottom:1px solid #f85963; height:40px; }
     #rfooter  ul li{ float:left; width:100px; background-color:#dbdbdb; margin:10px; height:30px; line-height:30px; text-align:center;color:#FFF;}
     #rfooter  ul li a{color:#ffffff; background-color:#f85963 ;
        width:100px;
        display:block;
        text-decoration:none;
        height:30px;
        line-height:30px;
        text-align:center;
        font-size:12px;}
     #rfooter  li a:hover { background-color:#8ec657 ; }
     #rfooter p{ text-align:left; clear:both; text-indent:2em; margin:10px; }
     #rfooter h4{ color:#4669ef; margin:20px;}
    .btn{
        color: #FFFFFF;
    }
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

<div id="right">
    <h3 > ${goods.goodsname}</h3>
    <div id="rleft"style="margin-top:20px;"><img src="/images/${goods.images}" onload="resizeImage(this)"/></div>

    <div id="rright">
        <p class="p2">现价：<span>￥${goods.goodsprice}</span></p>
        <p class="p3">原价：￥${goods.goodsprice}</p>
        <p class="p3">规格：${goods.size}</p>
        <form id="form1" name="form1" method="post" action="addToCart.do?goodsid=${goods.goodsid}">
        <button class="btn" type="submit" name="addcar" href="" style="background: red">加入购物车</button>
        </form>
    </div>

    <div id="rfooter">
        <ul>
            <li><a href="#">内容简介</a></li>
        </ul>
        <p>${goods.introduction} </p>
    </div>
</div>
</div>

</body>
<script type="text/javascript" src="/bootstrap/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>

</html>
