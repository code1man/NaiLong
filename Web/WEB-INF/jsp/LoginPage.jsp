<%--
  Created by IntelliJ IDEA.
  User: adolbook
  Date: 2024/10/24
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./static/css/LoginPage.css">
    <title>登陆</title>
</head>

<body>
<div class="login-container">
    <div class="cute-dragon">
        <img src="./static/images/welcome.gif" alt="奶龙图片" class="naidragon-image">
    </div>
    <h1>奶龙商店 </h1>
    <form action="${pageContext.request.contextPath}/handler" method="post">
    <span>
      <i class="fa-regular fa-user"></i>
      <input type="text" placeholder="用户名" name="username" required>
    </span>
        </br>
        <span>
      <i class="fa-solid fa-lock"></i>
      <input type="password" placeholder="密码" name="password" required>
    </span>
        <input type="submit" value="登录">
    </form>
    <div class="agreement">
        <input type="checkbox" id="agreement">
        <label for="agreement">我已阅读并同意
            <a href="#">《用户协议》</a>
            <a href="#">《隐私政策》</a>
        </label>
    </div>
    <div class="footer-text">
        <a href="register">还没有账号？立即注册！</a>
    </div>
</div>


<div class="mouse-follow-icon" id="mouse-follow-icon"
     style="display: inline-flex; align-items: center; justify-content: center;">
    <img src="./static/images/cursor.gif" alt="跟随鼠标的GIF"/>
</div>

<script src="./static/js/cursorFollow.js"></script>
<script>
    // 检查是否有注册成功的消息
    window.addEventListener('DOMContentLoaded', (event) => {
        <%
            String message = (String) session.getAttribute("message");
            session.removeAttribute("message"); // 清除消息，避免重复显示
        %>
        let message = "<%= message %>";
        if (message === "注册成功，请登录！") {
            alert(message); // 显示弹出框
        }
    });
</script>
<script src="https://kit.fontawesome.com/8c320534de.js" crossorigin="anonymous"></script>
</body>

</html>
