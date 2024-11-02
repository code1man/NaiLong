<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/22
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%--主页面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="domain.Product" %>

<html>
<head>
    <title>奶龙商店</title>
    <link rel="stylesheet" type="text/css" href="./static/css/index.css">
</head>
<body>
<div>
    <div class="header">
        <!-- topBar -->
        <div class="site-topBar">
            <div class="container">
                <div class="topBar-cart">
                    <a class="link">
                        <em class="iconfont-cart"></em>
                        <em class="iconfont-cart-full hide cart-mini cart-mini"></em>购物车
                        <span class="cart-mini-num">（0）</span>
                    </a>
                </div>
                <div class="topBar-info" style="opacity: 1">
                    <c:choose>
                        <c:when test="${sessionScope.loginUser != null}">
                            <%--编辑个人信息--%>
                            <a href="javascript:void(0)" class="link"
                               onclick="openModal()">欢迎回来！${sessionScope.loginUser.username}
                            </a>
                            <div id="modal" class="modal register-container">
                                <div style="opacity: 1">
                                    <h2>编辑个人信息</h2>
                                    <form action="" method="post">
                                        <span>
                                            <input type="text" placeholder="用户名" name="username" required>
                                        </span>
                                        <br>
                                        <span>
                                            <input type="password" placeholder="密码" name="password" required>
                                        </span>
                                        <br>
                                        <span>
                                            <input type="email" placeholder="邮箱" name="email" required>
                                        </span>
                                        <br>
                                        <span>
                                            <input type="number" placeholder="年龄" name="age" required min="1">
                                        </span>
                                        <br>
                                        <input type="submit" value="更改个人信息">
                                    </form>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="login" class="link">登录</a>
                            <span class="sep">|</span>
                            <a href="" data-register="true" class="link">注册</a>
                            <span class="sep">|</span>
                            <span class="message">
                                <a href="" class="J_needAgreement">消息通知</a>
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <%--中间部分--%>
        <div class="site-header" style="opacity: 0.8; background-color: white">
            <div class="container">
                <%--Logo--%>
                <div class="header-logo">
                    <a href="https://www.bilibili.com/bangumi/play/ep453031" title="奶龙动画" class="logo ir"
                       style=" background: url(/static/images/Logo.png) no-repeat; background-size: 56px; margin-top: 22px;">
                    </a>
                </div>
                <%--测边框--%>
                <div class="header-nav">
                    <ul class="nav-list  clearfix">
                        <li class="nav-category">
                            <a href="" class="link-category">
                                <span class="text">全部商品分类</span>
                            </a>
                            <div class="site-category" style="display: block">
                                <ul class="site-category-list clearfix site-category-list-custom">
                                    <c:forEach var="entry" items="${requestScope.productsByType.entrySet()}">
                                        <li class="category-item">
                                            <a href="" class="title">
                                                    ${entry.key.description}
                                                <em class="iconfont-arrow-right-big"></em>
                                            </a>
                                            <div class="children clearfix children-col-2">
                                                <ul class="children-list children-list-col children-list-col-1">
                                                    <c:forEach var="product" items="${entry.value}">
                                                        <li>
                                                            <a href="#" class="link clearfix">
                                                                <<img src="${product.URL}" width="40" height="40" alt=""
                                                                      class="thumb">
                                                                <span class="text">${product.name}</span>
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </li>
                        <%--上边框--%>
                        <li class="nav-item">
                            <a href="" class="link" data-settrack="true"><span
                                    class="text">表情包</span></a>
                            <div class="item-children">
                                <div class="container">
                                    <ul class="children-list clearfix">
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="" class="link"><span class="text">手办</span></a>
                            <div class="item-children">
                                <div class="container">
                                    <ul class="children-list clearfix">
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="" class="link"><span class="text">日常用品</span></a>
                            <div class="item-children">
                                <div class="container">
                                    <ul class="children-list clearfix">
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <%--搜索按钮--%>
                <div class="header-search">
                    <form action="//search.mi.com/search" method="get" class="search-form clearfix">
                        <label class="hide">站内搜索</label>
                        <label for="search"></label>
                        <input type="search" id="search" name="keyword" autocomplete="off"
                               class="search-text"
                               placeholder="奶龙">
                        <a class="no-style-msq">
                            <input type="submit" value="" class="search-btn iconfont">
                        </a>
                        <div class="search-hot-words"></div>
                        <div class="keyword-list hide">
                            <ul class="result-list"></ul>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 轮转屏幕 -->
    <div style="background-color: rgba(255, 234, 175, 0.8) ">
        <div class="home-hero-container container">
            <div class="home-hero box">
                <ul>
                    <li>
                        <img src="./static/images/swiper1.jpg"
                             alt="轮播图1">
                    </li>
                    <li>
                        <img src="./static/images/swiper.png"
                             alt="轮播图2">
                    </li>
                    <li>
                        <img src="https://img14.360buyimg.com/n0/jfs/t1/135035/7/42615/34447/660284caFfb4bc8ff/6f5383ba048b6a30.jpg"
                             alt="轮播图3">
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="page-main home-main">
        <div class="container">
            <%--banner图--%>
            <div class="home-banner-box">
                <a href="https://www.163.com/dy/article/JDO2AG060518VHUU.html">
                    <img src="./static/images/leijun.png" alt="借鉴对象金主爸爸的广告"
                         width="1226"
                         height="120">
                </a>
            </div>
            <%--商品展示--%>
            <c:forEach var="entry" items="${requestScope.productsByType.entrySet()}">
                <div class="home-brick-box home-brick-row-2-box xm-plain-box">
                    <div class="box-hd">
                        <h2 class="title"
                            style="font-weight: bolder">${entry.key.description}</h2>
                    </div>
                    <div class="box-hd clearfix" style="height: 686px">
                        <div class="row" style="margin-left: -14px">
                            <div class="span4">
                                <ul class="brick-promo-list clearfix">
                                    <li class="brick-item brick-item-l">
                                        <a href="">
                                            <img alt=""
                                                 src=""
                                                 style="width: 234px; height: 628px">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="span16">
                                <ul class="brick-list clearfix">
                                    <c:forEach var="product" items="${entry.value}">
                                        <li class="brick-item brick-item-m brick-item-m-2">
                                            <a href="ShoppingCart?${product.id}">
                                                <div class="figure figure-img">
                                                    <img width="160" height="160" alt="1" src="">
                                                </div>
                                                <h3 class="title">${product.name}</h3>
                                                <p class="price">
                                                    <span class="num">${product.price}</span>元<span>起</span>
                                                    <del><span class="num">10000</span>元</del>
                                                </p>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<div class="mouse-follow-icon" id="mouse-follow-icon"
     style="display: inline-flex; align-items: center; justify-content: center;">
    <img src="./static/images/cursor.gif" alt="跟随鼠标的GIF"/>
</div>
</body>

<script>
    // 打开模态框
    function openModal(event) {
        const modal = document.getElementById("modal");
        modal.style.display = "block";

        // 监听点击事件
        document.addEventListener('click', closeModalOutside)
    }

    // 关闭模态框
    function closeModal() {
        const modal = document.getElementById("modal");
        modal.style.display = "none";

        // 移除点击事件监听器
        document.removeEventListener('click', closeModalOutside);
    }

    // 关闭模态框的外部点击处理
    function closeModalOutside(event) {
        const modal = document.getElementById("modal");
        const modalContent = document.querySelector('.topBar-info');

        // 只有在模态框显示时，并且点击目标不在模态框内部时关闭模态框
        if (modal.style.display === "block" && !modalContent.contains(event.target)) {
            closeModal();
        }
    }
</script>
<script src="./static/js/cursorFollow.js"></script>
<script src="https://kit.fontawesome.com/8c320534de.js" crossorigin="anonymous"></script>
</html>
