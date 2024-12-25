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
<% boolean notLoggedIn = request.getSession().getAttribute("loginUser") == null; %>
<% if (notLoggedIn) { %>
<script type="text/javascript">
    // 页面加载时立即执行未登录提示
    if (confirm("您尚未登录，是否前往登录界面？")) {
        // 用户点击确认，跳转到登录页面
        window.location.href = "${pageContext.request.contextPath}/login";
    } else {
        window.location.href = "${pageContext.request.contextPath}/ShoppingCart";
    }
</script>
<% } %>

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
                    <em class="iconfont-cart-full cart-mini"></em>
                    购物车
                    <c:choose>
                        <c:when test="${sessionScope.loginUser != null}">
                            <%--购物车--%>
                            <span class="cart-mini-num J_cartNum">（${sessionScope.cart.getTotalNum()}）</span>
                            <div id="J_miniCartMenu" class="cart-menu" style="height: 0;">
                                <div class="menu-content">
                                    <c:choose>
                                        <c:when test="${sessionScope.cart.getTotalNum() > 0}">
                                            <ul id="J_miniCartList" class="cart-list">
                                                <c:forEach var="cartItem"
                                                           items="${sessionScope.cart.getCartItemList()}">
                                                    <li>
                                                        <div class="cart-item clearfix first">
                                                            <a class="thumb"
                                                               href="//www.mi.com/shop/buy?product_id=1230801081">
                                                                <img alt="" src="${cartItem.getItem().URL}">
                                                            </a>
                                                            <a class="name" href="javascript: void(0)">
                                                                    ${cartItem.getItem().name}
                                                            </a>
                                                            <span class="price"> ${cartItem.getItem().price} </span>
                                                            <a class="btn-del J_delItem"
                                                               href="/RemoveItem?id=${cartItem.getItem().id}&pageFrom=/mainForm">
                                                                <em class="iconfont-close"></em>
                                                            </a>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <div id="J_miniCartListTotal" class="cart-total clearfix">
                                                    <span class="total">共 <em>${sessionScope.cart.getTotalNum()}</em> 件商品
                                                        <span class="price"><em>${sessionScope.cart.getSubTotal()}</em>元</span>
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

                <%--搜索按钮--%>
                <div class="header-search">
                    <form action="${pageContext.request.contextPath}/SearchServlet" method="get"
                          class="search-form clearfix">
                        <label class="hide">站内搜索</label>
                        <label for="search"></label>
                        <input type="search" id="search" name="keyword" autocomplete="off"
                               class="search-text"
                               placeholder="奶龙"
                               oninput="SearchItem()">
                        <a class="no-style-msq">
                            <button class="search-btn iconfont" id="searchButton"></button>
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
        <div id="floatingWindow" class="floating">
            <div class="content">商品名字</div>
        </div>

        <div style="background-color: rgba(255, 234, 175, 0.8) ">
            <div class="product-box container">
                <div class="img-left">
                    <img src="${requestScope.item.URL}" alt="商品图片" class="img-box">
                </div>
                <div class="product-con">
                    <div style="flex: 5;">
                        <h2>
                            ${requestScope.item.name}
                        </h2>
                        <div class="price-info">
                            <span>${requestScope.item.price}</span>
                        </div>
                        <div class="price-line"></div>
                        <h3>
                            ${requestScope.item.description}
                        </h3>
                    </div>
                    <div class="price-btn-box">
                        <div class="sale-btn">
                            <c:choose>
                                <c:when test="${sessionScope.loginUser != null}">
                                    <a href="${pageContext.request.contextPath}/orderForm"
                                       class="price-btn price-btn-primary"
                                       onclick="">
                                        购买
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a class="price-btn price-btn-primary" href="javascript: void(0)">
                                        购买
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="favorite-btn">
                            <c:choose>
                                <c:when test="${sessionScope.loginUser != null}">
                                    <a href="/AddItemToCart?item=${requestScope.item}" class="btn-like btn-gray">
                                        加入购物车
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0)" class="btn-like btn-gray">
                                        加入购物车
                                    </a>
                                </c:otherwise>
                            </c:choose>
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
<script src="./static/js/topBar.js"></script>
<script src="./static/js/Search.js"></script>
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
