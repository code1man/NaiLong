<%--
  Created by IntelliJ IDEA.
  User: adolbook
  Date: 2024/11/3
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Boolean notLoggedIn = (Boolean) request.getAttribute("notLoggedIn"); %>

<% if (notLoggedIn != null && notLoggedIn) { %>
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


<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单确认</title>
    <link rel="stylesheet" href="./static/css/Order.css">
</head>

<body>
<header>
    <div class="header-container">
        <h1>NaiLong Store</h1>
        <input type="text" placeholder="请输入商品名称">
        <button>搜索</button>
    </div>
</header>

<main>
    <div class="breadcrumb">
        <p>NaiLongStore &gt; 订单确认</p>
    </div>

    <section class="address-section">
        <h2>收货地址</h2>
        <div class="address-grid">
            <div class="address active">湖南 长沙 (XXX) 收<br>天心区中南大学铁道校区XX舍</div>
            <div class="address">湖南 长沙 (XXX) 收<br>天心区中南大学铁道校区XX舍</div>
            <div class="address">湖南 长沙 (XXX) 收<br>天心区中南大学铁道校区XX舍</div>
            <div class="address">湖南 长沙 (XXX) 收<br>天心区中南大学铁道校区XX舍</div>
            <div class="address add-new">+ 使用新地址</div>
        </div>
    </section>

    <section class="order-summary">
        <h2>商品清单</h2>
        <table>
            <thead>
            <tr>
                <th>商品描述</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>华为/HUAWEI nova 9 SE 一亿像素超清摄影 创新Vlog体验 支持66W快充 8GB+256GB珊瑚 蓝 华为手机 [无充版]</td>
                <td>¥100.00</td>
                <td>5</td>
                <td>¥500.00</td>
            </tr>
            <tr>
                <td>Apple iPhone 14 128GB 蓝色A284手机 支持移动联通电信5G MPV93CH/A [企业客户专享]</td>
                <td>¥100.00</td>
                <td>5</td>
                <td>¥500.00</td>
            </tr>
            </tbody>
        </table>

        <div class="total-container">
            <span class="total-text">订单总价：</span>
            <span class="price">¥8999.00</span>
            <button class="submit-order">提交订单</button>
        </div>

    </section>
</main>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // 检查是否有未登录的标志
        let notLoggedIn = <%= notLoggedIn %>;

        if (notLoggedIn) {
            let login = confirm("您尚未登录，是否前往登录界面？");
            if (login) {
                // 如果用户确认，跳转到登录页面
                window.location.href = "${pageContext.request.contextPath}/login";
            } else {
                window.location.href = "${pageContext.request.contextPath}/ShoppingCart"
            }
        }
    });
</script>

</body>

</html>
