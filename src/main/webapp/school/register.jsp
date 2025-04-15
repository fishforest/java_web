<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<h2>注册</h2>
<form action="register" method="post">
    姓名: <input type="text" name="name" required><br>
    号码: <input type="text" name="phone" required><br>
    验证码: <input type="text" name="captcha" required><br>
    <input type="submit" value="注册">
</form>
<a href="login">已有账号，去登录</a> <!-- 添加登录链接 -->
</body>
</html>