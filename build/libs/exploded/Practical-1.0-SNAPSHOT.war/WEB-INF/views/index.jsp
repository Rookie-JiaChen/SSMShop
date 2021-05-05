<%--
  Created by IntelliJ IDEA.
  User: JiaChen
  Date: 2020/6/16
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>嘉辰商城</title>

</head>

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

  .carousel{
    height: 80%;
  }
  .carousel-inner{
    height: 100%;
  }

  .carousel-inner img{
    width: 100%;
  }
  .carousel-caption{
    bottom: 25%;
  }
  .goodsinfo {
    margin-bottom:10px;
    float:left;
    width:100%;
    height:auto;
    box-shadow: 0 5px 15px -5px rgba(0,0,0,.5) ;
    /*border: 1px solid #e7313d;*/
    margin-top:20px;
    padding: 20px;
    /*color:#4a4a4a;*/
  }
  .goodsinfo a {
    border:0px;
    color:#fc6a15;
    text-decoration:none;
  }

  .goodsinfo ul{
    list-style: none;
  }
  .goodsinfo ul li {
    padding: 20px;
    float:left;
    width: 33%;
    height: 25%;
    /*padding:10px 10px 10px 10px; border:dashed 1px #e7313d;*/

  }
   .goodsinfo h5 {
    color:#000;
    font-size:12px;
    padding-top:3px;
  }
   .goodsinfo h3 {
    float:left;
    width:750px;
    height:35px;
    line-height:35px;
    color:#ffffff;
  }
   .goodsinfo h3 span.hl {
    font-size:12px;
    text-align:left;
    float:left;
    color:#ffffff;
  }
   .goodsinfo h3 span.hr {
    color:#ffffff;
    font-size:10px;
    float:rightcolor: #F60;
    float:right;
  }
   .goodsinfo img {
    margin:5px 15px 5px 10px;
    border:0px;
    float:left;
  }
   .goodsinfo #conimg {
    margin:5px 5px 0px 10px;
  }
   .goodsinfo h5 span { font-size:12px; color:#a7a7a7;}
   .goodsinfo p span {
    color:#ed4e00
  }
   .goodsinfo ul {
    list-style:none;
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

<div class="carousel slide" id="myCarousel">
  <ul class="carousel-indicators">
    <li class="active" data-target="#myCarousel" data-slide-to="0"></li>
    <li data-target="#myCarousel"  data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ul>

  <div class="carousel-inner">
    <div class="item active">
      <a href="/goodsInfo.do?id=1" ><img src="/images/banner1.jpeg" ></a>
      <div class="carousel-caption">拯救者R7000 2020</div>
    </div>
    <div class="item">
      <a href="/goodsInfo.do?id=2" ><img src="/images/banner2.png" ></a>
      <div class="carousel-caption">机械革命X10Ti plus</div>
    </div>
    <div class="item">
      <a href="/goodsInfo.do?id=7" > <img src="/images/rtx2080.jpeg" ></a>
      <div class="carousel-caption">RTX2080 TI</div>
    </div>
  </div>

  <a class="left carousel-control" href="#myCarousel"
     data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
  <a class="right carousel-control" href="#myCarousel"
     data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
</div>

<div class="goodsinfo">
  <ul>

    <c:forEach items="${pageInfo.list}" var="goods">
      <li>
        <a href="/goodsInfo.do?id=${goods.goodsid}">
          <img width="100px" height="100px" src="/images/${goods.images}"/>
          <h5>
            <span>名称: </span>
              ${goods.goodsname}
          </h5>
          <p>${goods.introduction}</p>
        </a>
        <p>
        价格:<span>${goods.goodsprice}</span>
      </p>
      </li>
    </c:forEach>
  </ul>
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
