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
    <link rel="stylesheet" type="text/css" href="./static/css/index.css">
    <link rel="stylesheet" type="text/css" href="./static/css/ShoppingCart.css">
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
                    <c:when test="${sessionScope.loginUser != null}">
                        <a href="" class="link">欢迎回来！${sessionScope.loginUser.username}</a>
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
        <div class="site-header" style="opacity: 0.8; background-color: white">
            <div class="container">
                <div class="header-nav">
                    <ul class="nav-list  clearfix">
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

                <div class="header-search">
                    <form action="//search.mi.com/search" method="get" class="search-form clearfix">
                        <label class="hide">站内搜索</label>
                        <label for="search"></label>
                        <input type="search" id="search" name="keyword" autocomplete="off" class="search-text"
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
        <div id="floatingWindow" class="floating">
            <div class="content">商品名字</div>
        </div>

        <div style="background-color: rgba(255, 234, 175, 0.8) ">
            <div class="product-box container">
                <div class="img-left">
                    <img src="" alt="商品图片" class="img-box">
                </div>
                <div class="product-con">
                    <div style="flex: 5;">
                        <h2 data-v-70283663="">
                            <img data-v-70283663="">
                            ${requestScope.item}
                        </h2>
                        <div class="price-info">
                            <span>0.1元</span>
                        </div>
                        <div class="price-line"></div>
                    </div>
                    <div class="price-btn-box">
                        <div class="sale-btn">
                            <a href="${pageContext.request.contextPath}/order" class="price-btn price-btn-primary">购买</a>
                        </div>
                        <div class="favorite-btn">
                            <a href="/AddItemToCart?item=${requestScope.item}" class="btn-like btn-gray">加入购物车</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mouse-follow-icon" id="mouse-follow-icon"
         style="display: inline-flex; align-items: center; justify-content: center;">
        <img src="./static/images/cursor.gif" alt="跟随鼠标的GIF"/>
    </div>
</div>
<script src="./static/js/cursorFollow.js"></script>
</body>

<script src="https://kit.fontawesome.com/8c320534de.js" crossorigin="anonymous"></script>
<script>
    window.onscroll = function () {
        var floatingWindow = document.getElementById("floatingWindow");
        var windowScrollY = window.scrollY;
        // 获取元素的初始位置
        var initialOffset = floatingWindow.offsetTop; // 初始相对于页面顶部的距离

        // 判断是否需要固定
        if (windowScrollY > initialOffset) {
            floatingWindow.classList.add("fixed");
        } else {
            floatingWindow.classList.remove("fixed");
        }
    };
</script>

</html>
