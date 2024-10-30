<%--
  Created by IntelliJ IDEA.
  User: adolbook
  Date: 2024/10/30
  Time: 8:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./static/css/Register.css">
    <title>注册</title>
</head>

<body>

<div class="register-container">
    <div class="cute-dragon">
        <img src="./static/images/welcome.jpg" alt="奶龙图片" class="naidragon-image">
    </div>
    <form action="${pageContext.request.contextPath}/handlerRegister" method="post">
            <span>
                <i class="fa-regular fa-user"></i>
                <input type="text" placeholder="用户名" name="username" required>
            </span>
        <br>
        <span>
                <i class="fa-solid fa-lock"></i>
                <input type="password" placeholder="密码" name="password" required>
            </span>
        <br>
        <span>
                <i class="fa-solid fa-envelope"></i>
                <input type="email" placeholder="邮箱" name="email" required>
            </span>
        <br>
        <span>
                <i class="fa-solid fa-calendar-alt"></i>
                <input type="number" placeholder="年龄" name="age" required min="1">
            </span>
        <br>
        <span>
                <select name="is_admin" required>
                    <option value="" disabled selected>身份选择</option>
                    <option value="user">用户</option>
                    <option value="admin">管理员</option>
                </select>
            </span>
        <br>
        <input type="submit" value="注册">
    </form>
    <div class="footer-text">
       <a href="login"> 已经有账号？立即登录！</a>
    </div>
</div>

<script src="https://kit.fontawesome.com/8c320534de.js" crossorigin="anonymous"></script>
</body>

</html>