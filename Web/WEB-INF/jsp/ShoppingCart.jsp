<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/30
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>购物界面</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/index.css">
</head>
<body>
<div>
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
            <div class="topBar-info">
                <c:choose>
                    <c:when test="${sessionScope.loginUser.Username}">
                        <a href="" class="link">欢迎回来！${sessionScope.loginUser.Username}</a>
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
</div>
</body>
</html>
