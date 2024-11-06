<%--
  Created by IntelliJ IDEA.
  User: adolbook
  Date: 2024/11/3
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <c:forEach var="address" items="${sessionScope.addressList}">
                <div class="address <c:if test="${address.is_default}">active</c:if>">
                        ${address.province} ${address.city} ${address.district} (收)<br>
                        ${address.detail_address}<br>
                        ${address.receiver_name}<br>
                    电话：${address.phone_number}
                </div>
            </c:forEach>
            <div class="address add-new" id="addNewAddressBtn">+ 使用新地址</div>
        </div>
        <!-- 模态框 -->
        <div id="addAddressModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>添加新地址</h2>
                <form id="addAddressForm">
                    <label for="province">省：</label>
                    <input type="text" id="province" name="province" required><br>
                    <label for="city">市：</label>
                    <input type="text" id="city" name="city" required><br>
                    <label for="district">区：</label>
                    <input type="text" id="district" name="district" required><br>
                    <label for="detailAddress">详细地址：</label>
                    <input type="text" id="detailAddress" name="detailAddress" required><br>
                    <label for="phoneNumber">电话：</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" required><br>
                    <label for="receiverName">收件人姓名：</label>
                    <input type="text" id="receiverName" name="receiverName" required><br>
                    <label>
                        <input type="checkbox" id="isDefault">
                        设为默认地址
                    </label><br>
                    <button type="submit">确认</button>
                </form>
            </div>
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
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const modal = document.getElementById("addAddressModal");
        const btn = document.getElementById("addNewAddressBtn");
        const span = document.getElementsByClassName("close")[0];

        // 点击“+ 使用新地址”按钮时打开模态框
        btn.onclick = function() {
            modal.style.display = "block";
        }

        // 点击关闭按钮时关闭模态框
        span.onclick = function() {
            modal.style.display = "none";
        }

        // 点击模态框外部时关闭模态框
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        // 表单提交事件
        const form = document.getElementById("addAddressForm");
        form.onsubmit = function(e) {
            e.preventDefault(); // 防止页面刷新

            // 获取表单数据
            const province = document.getElementById("province").value;
            const city = document.getElementById("city").value;
            const district = document.getElementById("district").value;
            const detail_address = document.getElementById("detailAddress").value;
            const phone_number = document.getElementById("phoneNumber").value;
            const receiver_name = document.getElementById("receiverName").value;
            const is_default = document.getElementById("isDefault").checked;


            // 发送 AJAX 请求到服务器
            fetch('${pageContext.request.contextPath}/order', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    province: province,
                    city: city,
                    district: district,
                    detail_address: detail_address,
                    phone_number: phone_number,
                    receiver_name: receiver_name,
                    is_default: is_default
                })
            })
                .then(response => response.json())
                .then(data => {
                    console.log(data);
                    // 关闭模态框
                    modal.style.display = "none";
                    location.reload();
                    // 可以在这里更新地址列表（例如，在页面上动态添加新地址）
                })
                .catch(error => console.error('Error:', error));
        }
    });

</script>
</body>

</html>