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
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous"></script>
</head>

<body>

<div class="register-container">
    <div class="cute-dragon">
        <img src="./static/images/register.gif" alt="奶龙图片" class="naidragon-image">
    </div>
    <form action="${pageContext.request.contextPath}/handlerRegister" method="post">
            <span>
                <i class="fa-regular fa-user"></i>
                <input type="text" placeholder="用户名" name="username" id="username" required>
            </span>
        <br>
            <div id="feedback"></div>
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
                 <i class="fa-solid fa-user" style="margin-right: 5px; font-size: 20px; color: #333;"></i>
                <select name="is_admin" required>
                    <option value="" disabled selected>身份选择</option>
                    <option value="user">用户</option>
                    <option value="admin">管理员</option>
                </select>
            </span>
        <br>

        <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
            <i class="fa-solid fa-shield" style="margin-right: 5px; font-size: 20px; color: #333;"></i>
            <input type="text" name="captcha" id="captcha" placeholder="请输入验证码" style="width: 160px; height: 30px; margin-right: 10px;" required/>
            <a href="#" onclick="refreshCaptcha(); return false;">
                <img src="captcha" id="captchaImage" alt="Captcha" style="height: 30px; width: 80px;"/>
            </a>
        </div>
        <input type="submit" value="注册">

    </form>
    <div class="footer-text">
       <a href="login"> 已经有账号？立即登录！</a>
    </div>
</div>



<div class="mouse-follow-icon" id="mouse-follow-icon" style="display: inline-flex; align-items: center; justify-content: center;">
    <img style="width: 25px !important; height: auto !important; border-radius: 50%;" src="./static/images/cursor.gif" alt="跟随鼠标的GIF" />
</div>

<script src="./static/js/cursorFollow.js"></script>
<script src="./static/js/checkuserinfo.js"></script>

<script type="text/javascript">
    // 当用户点击“换一换”链接时，调用此函数以刷新验证码图像
    function refreshCaptcha() {
        let captchaImage = document.getElementById('captchaImage');
        // 更新图像的src属性，因为是get请求，所以要在后面添加一个时间戳以防止浏览器缓存图像
        captchaImage.src = 'captcha?' + new Date().getTime();
    }

</script>

<script src="https://kit.fontawesome.com/8c320534de.js" crossorigin="anonymous"></script>
</body>

</html>