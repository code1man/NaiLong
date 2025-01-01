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
<%@ page import ="javax.servlet.ServletContext" %>

<html>
<head>
    <title>奶龙商店</title>
    <link rel="stylesheet" type="text/css" href="./static/css/index.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 定时请求在线人数
        function updateOnlineCount() {
            $.ajax({
                url: '/getOnlineUserCount',  // 上面创建的 Servlet URL
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    // 更新显示的在线人数
                    $('#onlineCount').text(response.onlineUserCount);
                },
                error: function() {
                    console.error('获取在线人数失败');
                }
            });
        }

        $(document).ready(function() {
            // 每隔5秒更新一次在线人数
            setInterval(updateOnlineCount, 5000);
        });
    </script>

</head>
<body>
<%
    if ("logout".equals(request.getParameter("action"))) {
        session.removeAttribute("loginUser");  // 清除 loginUser 对象
        response.sendRedirect(request.getContextPath() + "/mainForm"); // 可选：重定向到登录页面
    }
%>

<%
    ServletContext context = application;
    Integer onlineCount = (Integer) context.getAttribute("onlineUserCount");
    if (onlineCount == null) {
        onlineCount = 0;
    }
%>

<!-- 悬浮窗 -->
<div id="product-hover-info">
    <h4 id="hover-product-name"></h4>
    <p id="hover-product-description"></p>
    <p><strong>价格：</strong><span id="hover-product-price"></span>元</p>
</div>
<div>
    <div class="header">
        <!-- topBar -->
        <div class="site-topBar">
            <div>
                <label>
                    当前在线人数: <span id="onlineCount">1</span>
                </label>
                <div class="topBar-cart">
                    <a class="link">
                        <span class="iconfont-cart"></span>
                        购物车
                    </a>
                    <c:choose>
                        <c:when test="${sessionScope.loginUser != null && sessionScope.cart != null}">
                            <%--购物车--%>
                            <span id="topBarItemCount"
                                  class="cart-mini-num J_cartNum">（${sessionScope.cart.getTotalNum()}）</span>
                            <div id="J_miniCartMenu" class="cart-menu" style="height: 0;">
                                <div class="menu-content">
                                    <c:choose>
                                        <c:when test="${sessionScope.cart.getTotalNum() > 0}">
                                            <ul id="J_miniCartList" class="cart-list">
                                                <c:forEach var="cartItem"
                                                           items="${sessionScope.cart.getCartItemList()}">
                                                    <li data-item-id="${cartItem.getItem().id}">
                                                        <div class="cart-item clearfix first">
                                                            <a class="thumb"
                                                               href="//www.mi.com/shop/buy?product_id=1230801081">
                                                                <img alt="" src="${cartItem.getItem().URL}">
                                                            </a>
                                                            <span id="ItemName"
                                                                  class="name">${cartItem.getItem().name}</span>
                                                            <span class="price Item-price"> ${cartItem.getItem().price} </span>
                                                            <div class="count-control">
                                                                <button class="count_d">-</button>
                                                                <span class="price Item-count">${cartItem.getQuantity()}</span>
                                                                <button class="count_i">+</button>
                                                            </div>
                                                            <a class="btn-del J_delItem">
                                                                <em class="iconfont-close"></em>
                                                            </a>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <div id="J_miniCartListTotal" class="cart-total clearfix">
                                                    <span class="total">共 <em
                                                            id="CartListTotalCount">${sessionScope.cart.getTotalNum()}</em> 件商品
                                                        <span class="price"><em
                                                                id="CartListTotalPrice">${sessionScope.cart.getSubTotal()}</em>元</span>
                                                    </span>
                                                <a href="${pageContext.request.contextPath}/CartCount"
                                                   class="btn btn-primary btn-cart">结算</a>
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
                </div>
                <div class="topBar-info">
                    <c:choose>
                        <c:when test="${sessionScope.loginUser != null}">
                            <%--编辑个人信息--%>
                            <a href="javascript:void(0)" class="link"
                               onclick="openModal()">欢迎回来！${sessionScope.loginUser.username}
                            </a>
                            <a href="<%= request.getContextPath() %>/mainForm?action=logout" class="link"
                               style="margin-left: 20px;">
                                退出登录
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
                                                       id="username"
                                                       required>
                                            </label>
                                        </span>
                                        <br>
                                        <div id="feedback"></div>
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
                            <a href="register" data-register="true" class="link">注册</a>
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
                                            <a href="#${product.getProductName()}" class="title itemTitle">
                                                    ${product.getProductName()}
                                                <em class="iconfont-arrow-right-big"></em>
                                            </a>
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
                    <form class="search-form clearfix">
                        <label class="hide">站内搜索</label>
                        <label for="search"></label>
                        <input type="search" id="search" name="keyword" autocomplete="off"
                               class="search-text"
                               placeholder="奶龙"
                               oninput="SearchItem()">
                        <a class="no-style-msq">
                            <button class="search-btn iconfont-arrow-right-big" id="searchButton"></button>
                        </a>
                        <div class="search-hot-words"></div>
                        <div id="J_keywordList" class="keyword-list">
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
                <ul id="carousel">
                    <li>
                        <img src="./static/images/我.png"
                             alt="轮播图1">
                    </li>
                    <li>
                        <img src="./static/images/是.png"
                             alt="轮播图2">
                    </li>
                    <li>
                        <img src="./static/images/奶龙.png"
                             alt="轮播图3">
                    </li>
                </ul>
                <!-- 分页导航 -->
                <div class="carousel-indicators">
                    <span data-index="0" class="active"></span>
                    <span data-index="1"></span>
                    <span data-index="2"></span>
                </div>
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
                <div id="${product.getProductName()}" class="home-brick-box home-brick-row-2-box xm-plain-box">
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
                                    <c:forEach var="cartItem" items="${product.items}">
                                        <li class="brick-item brick-item-m brick-item-m-2">
                                            <a href="ShoppingCart?item=${cartItem.id}">
                                                <div class="figure figure-img">
                                                    <img class="thumbImg" width="160" height="160" alt="1"
                                                         src="${cartItem.URL}"
                                                         data-name="${cartItem.name}"
                                                         data-price="${cartItem.price}"
                                                         data-description="${cartItem.description}">
                                                </div>
                                                <h3 class="title">${cartItem.name}</h3>
                                                <p class="price">
                                                    <span class="num">${cartItem.price}</span>元<span>起</span>
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


<%--鼠标--%>
<div class="mouse-follow-icon" id="mouse-follow-icon"
     style="display: inline-flex; align-items: center; justify-content: center;">
    <img src="./static/images/cursor.gif" alt="跟随鼠标的GIF"/>
</div>

</body>
<script src="/static/js/checkuserinfo.js"></script>
<script src="/static/js/showDiscription.js"></script>
<script src="./static/js/topBar.js"></script>
<script src="./static/js/cursorFollow.js"></script>
<script src="./static/js/Search.js"></script>
<script src="./static/js/cart.js"></script>
<script src="./static/js/scroll.js"></script>
<script src="./static/js/carousel.js"></script>
<script>
    window.onload = function () {
        let updateMsg = '<%= session.getAttribute("UpdateMsg") != null ? session.getAttribute("UpdateMsg") : "" %>';
        if (updateMsg) {
            alert(updateMsg); // 显示警告消息
            <% session.removeAttribute("UpdateMsg"); %> // 移除消息
        }
    };
</script>

<script src="https://kit.fontawesome.com/8c320534de.js" crossorigin="anonymous"></script>
</html>
