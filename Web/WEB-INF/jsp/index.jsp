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
                        <em class="iconfont-cart-full cart-mini"></em>
                        购物车
                        <c:choose>
                            <c:when test="${sessionScope.loginUser != null}">
                                <%--购物车--%>
                                <span class="cart-mini-num J_cartNum">（${sessionScope.loginUser.getTotalProductsNumber()}）</span>
                                <div id="J_miniCartMenu" class="cart-menu" style="height: 0;">
                                    <div class="menu-content">
                                        <c:choose>
                                            <c:when test="${sessionScope.loginUser.getTotalProductsNumber()} > 0">
                                                <ul id="J_miniCartList" class="cart-list">
                                                    <c:forEach var="item"
                                                               items="${sessionScope.loginUser.hasBeenPutInShoppingCartProducts}">
                                                        <li>
                                                            <div class="cart-item clearfix first">
                                                                <a class="thumb"
                                                                   href="">
                                                                    <img alt="" src="${item.URL}">
                                                                </a>
                                                                <a class="name" href="javascript: void(0)">
                                                                        ${item.name}
                                                                </a>
                                                                <span class="price"> ${item.price} × 1</span>
                                                                <a class="btn-del J_delItem"
                                                                   href="javascript: void(0);">
                                                                    <em class="iconfont-close"></em>
                                                                </a>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                                <div id="J_miniCartListTotal" class="cart-total clearfix">
                                                    <span class="total">共 <em>${sessionScope.loginUser.getTotalProductsNumber()}</em> 件商品
                                                        <span class="price"><em>${sessionScope.loginUser.getTotalPrice()}</em>元</span>
                                                    </span>
                                                    <a href="" class="btn btn-primary btn-cart">结算</a>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="msg msg-empty">购物车中还没有商品，赶紧选购吧！</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <span class="cart-mini-num">（0）</span>
                            </c:otherwise>
                        </c:choose>
                    </a>
                </div>
                <div class="topBar-info">
                    <c:choose>
                        <c:when test="${sessionScope.loginUser != null}">
                            <%--编辑个人信息--%>
                            <a href="javascript:void(0)" class="link"
                               onclick="openModal()">欢迎回来！${sessionScope.userLog.userId}${sessionScope.userLog.action}${sessionScope.userLog.itemId}${sessionScope.loginUser.username}
                            </a>
                            <div id="modal" class="modal register-container">
                                <div style="opacity: 1">
                                    <h2>编辑个人信息</h2>
                                    <form action="${pageContext.request.contextPath}/mainForm" method="post"
                                          autocomplete="off">
                                        <span>
                                            <label>用户名：
                                                <input type="text" placeholder="用户名"
                                                       value="${sessionScope.loginUser.username}" name="username"
                                                       required>
                                            </label>
                                        </span>
                                        <br>
                                        <span>
                                            <label>邮箱：
                                                <input type="email" placeholder="邮箱" name="email"
                                                       value="${sessionScope.loginUser.email}" required>
                                            </label>
                                        </span>
                                        <br>
                                        <span>
                                            <label>年龄：
                                                <input type="number" placeholder="年龄" name="age"
                                                       value="${sessionScope.loginUser.age}" required min="1">
                                            </label>
                                        </span>
                                        <br>
                                        <span>
                                            <label>旧密码：
                                                <input type="password" placeholder="旧密码" value="" name="OldPassword"
                                                       autocomplete="off"
                                                       required>
                                            </label>
                                        </span>
                                        <br>
                                        <span>
                                            <label>新密码：
                                                <input type="password" placeholder="新密码" value="" name="NewPassword"
                                                       autocomplete="off"
                                                       required>
                                            </label>
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
                                    <c:forEach var="product" items="${requestScope.productList}">
                                        <li class="category-item">
                                            <a href="" class="title">
                                                    ${product.getProductName()}
                                                <em class="iconfont-arrow-right-big"></em>
                                            </a>
                                            <div class="children clearfix children-col-2">
                                                <ul class="children-list children-list-col children-list-col-1">
                                                    <c:forEach var="item" items="${product.items}">
                                                        <li>
                                                            <a href="#" class="link clearfix">
                                                                <<img src="${item.URL}" width="40" height="40" alt=""
                                                                      class="thumb">
                                                                <span class="text">${item.name}</span>
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
                        <c:forEach var="category" items="${requestScope.categoryList}">
                            <li class="nav-item">
                                <a href="" class="link" data-settrack="true"><span
                                        class="text">${category.getCategoryName()}</span></a>
                                <div class="item-children">
                                    <div class="container">
                                        <ul class="children-list clearfix">
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <%--搜索按钮--%>
                <div class="header-search">
                    <form action="${pageContext.request.contextPath}/SearchServlet" method="get"
                          class="search-form clearfix">
                        <label class="hide">站内搜索</label>
                        <label for="search"></label>
                        <input type="search" id="search" name="keyword" autocomplete="off"
                               class="search-text"
                               placeholder="奶龙"
                               oninput="search()">
                        <a class="no-style-msq">
                            <input type="submit" value="" class="search-btn iconfont">
                        </a>
                        <div class="search-hot-words"></div>
                        <div id="J_keywordList" class="keyword-list hide">
                            <ul class="result-list">
                            </ul>
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
            <c:forEach var="product" items="${requestScope.productList}">
                <div class="home-brick-box home-brick-row-2-box xm-plain-box">
                    <div class="box-hd">
                        <h2 class="title"
                            style="font-weight: bolder">${product.getProductName()}</h2>
                    </div>
                    <div class="box-hd clearfix" style="height: 686px">
                        <div class="row" style="margin-left: -14px">
                            <div class="span4">
                                <ul class="brick-promo-list clearfix">
                                    <li class="brick-item brick-item-l">
                                        <a href="">
                                                <%--<img alt=""
                                                     src=""
                                                     style="width: 234px; height: 628px">--%>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="span16">
                                <ul class="brick-list clearfix">
                                    <c:forEach var="item" items="${product.items}">
                                        <li class="brick-item brick-item-m brick-item-m-2">
                                            <a href="ShoppingCart?id=${item.id}">
                                                <div class="figure figure-img">
                                                    <img width="160" height="160" alt="1" src="${item.URL}">
                                                </div>
                                                <h3 class="title">${item.name}</h3>
                                                <p class="price">
                                                    <span class="num">${item.price}</span>元<span>起</span>
                                                    <del><span class="num">1000</span>元</del>
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

<script>
    function search() {
        var query = document.getElementById("search").value;
        console.log(query);

        if (query.length < 3) { // 当输入小于3个字符时不进行搜索
            document.getElementById("J_keywordList").style.display = 'none';
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/SearchServlet?SearchContent=" + encodeURIComponent(query), true);
        xhr.onreadystatechange = function () {
            console.log(xhr.responseText);
            if (xhr.readyState === 4 && xhr.status === 200) {
                var results = JSON.parse(xhr.responseText);
                displayResults(results);
            }
        };
        xhr.send();
    }

    function displayResults(results) {
        var resultsContainer = document.getElementById("J_keywordList");
        var resultList = resultsContainer.querySelector('.result-list');
        resultList.innerHTML = "";  // 清空之前的搜索结果

        if (results.length > 0) {
            resultsContainer.style.display = 'block';
            results.forEach(function (item) {
                // 创建一个 <li> 元素来包含每个搜索结果
                var li = document.createElement("li");

                // 创建一个 <a> 元素，将商品的名称作为链接
                var a = document.createElement("a");
                a.textContent = item.name;
                a.href = "/ShoppingCart?item=" + item.id; // 假设商品详情页面使用产品 ID 作为查询参数
                a.classList.add("result-item");  // 添加样式类，方便你进行样式设置

                // 将 <a> 标签添加到 <li> 元素中
                li.appendChild(a);

                // 将 <li> 元素添加到搜索结果列表中
                resultList.appendChild(li);
            });
        } else {
            resultsContainer.style.display = 'none';
        }
    }
</script>

<%--鼠标--%>
<div class="mouse-follow-icon" id="mouse-follow-icon"
     style="display: inline-flex; align-items: center; justify-content: center;">
    <img src="./static/images/cursor.gif" alt="跟随鼠标的GIF"/>
</div>
</body>

<script src="./static/js/topBar.js"></script>
<script src="./static/js/cursorFollow.js"></script>
<script src="./static/js/Search.js"></script>
<script src="https://kit.fontawesome.com/8c320534de.js" crossorigin="anonymous"></script>
</html>
