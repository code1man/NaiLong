<%--
  Created by IntelliJ IDEA.
  User: adolbook
  Date: 2024/11/3
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="Persistence.ItemDaoImpl, domain.Item" %>
<%@ page import="java.sql.SQLException" %>
<%
    // 从 session 中获取商品 ID，先作为 String 获取
    String itemIdStr = (String) session.getAttribute("item");
    Item item = null;

    if (itemIdStr != null) {
        try {
            // 将字符串转换为 Integer
            Integer itemId = Integer.parseInt(itemIdStr);

            // 继续调用数据库操作获取商品信息
            ItemDaoImpl itemDao = new ItemDaoImpl();
            item = itemDao.getItem(itemId);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            // 处理转换失败的情况
        } catch (SQLException e) {
            e.printStackTrace();
            // 处理数据库操作异常
        }
    }
%>
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
                <div class="address <c:if test="${address.is_default}">active</c:if>" onclick="selectAddress(this)">
                    <div class="address-info">
                            ${address.province}省 ${address.city}市 ${address.district}区 (收)<br>
                        详细地址：${address.detail_address}<br>
                        收件人：${address.receiver_name}<br>
                        电话：${address.phone_number}
                    </div>
                    <div class="address-actions">
                        <button class="delete-btn" onclick="deleteAddress(${address.id}, event)">删除</button>
                    </div>
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
        <h2>商品详情</h2>
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
                <td>
                    <img src="<%= item.getURL() %>" alt="<%= item.getName() %>" style="width: 100px; height: auto;">
                    <%= item.getName() %>
                </td>
                <td>¥<%= item.getPrice() %></td>
                <td>1</td> <!-- 假设数量为 1，如果需要，可以修改为实际数量 -->
                <td>¥<%= item.getPrice() %></td>
            </tr>
            </tbody>
        </table>

        <div class="total-container">
            <span class="total-text">订单总价：</span>
            <span class="price">¥<%= item.getPrice() %></span> <!-- 订单总价等于商品价格 -->
            <button class="submit-order">提交订单</button>
        </div>

    </section>
</main>

<div class="mouse-follow-icon" id="mouse-follow-icon" style="display: inline-flex; align-items: center; justify-content: center;">
    <img src="./static/images/cursor.gif" alt="跟随鼠标的GIF" />
</div>

<script src="./static/js/cursorFollow.js"></script>
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


    // 点击收货框选中
    function selectAddress(addressElement) {
        // 移除所有地址的active类
        const allAddresses = document.querySelectorAll('.address');
        allAddresses.forEach(function(address) {
            address.classList.remove('active');
        });

        // 给当前点击的地址添加active类
        addressElement.classList.add('active');
    }


    function deleteAddress(addressId, event) {
        event.stopPropagation(); // 防止触发selectAddress
        if (confirm("确认删除此地址吗？")) {
            fetch('${pageContext.request.contextPath}/order/' + addressId, {
                method: 'DELETE',
            })
                .then(response => response.json())
                .then(data => {
                    if (data.status === "success") {
                        location.reload();  // 刷新页面以更新地址列表
                        alert("删除成功！");
                    } else {
                        alert("删除失败：" + data.message);
                    }
                })
                .catch(error => console.error('Error:', error));
        }
    }
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
                })
                .catch(error => console.error('Error:', error));
        }
    });

</script>
</body>
</html>
