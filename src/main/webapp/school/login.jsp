<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <style>
        /* 全局样式 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* 登录框样式 */
        .login-container {
            background-color: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px; /* 增加宽度以适应一行显示 */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #333333;
        }

        /* 表单行样式 */
        .form-row {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
            width: 100%;
        }

        .form-row label {
            margin-bottom: 5px;
            color: #555;
            font-size: 14px;
        }

        .form-row input[type="text"], .form-row input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            height: 40px;
        }

        /* 提交按钮样式 */
        .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px; /* 新增 */
        }

        .login-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* 错误信息样式 */
        .error-message {
            color: red;
            margin-bottom: 15px;
        }
    </style>
    <script>
        function validatePhone() {
            var phone = document.getElementById("phone").value;
            var phonePattern = /^\d{11}$/;
            if (!phonePattern.test(phone)) {
                alert("电话号码格式不正确，请输入11位数字");
                return false;
            }
            return true;
        }

        function validatePassword() {
            var password = document.getElementById("password").value;
            if (password.length !== 6) {
                alert("密码长度必须为6位");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="login-container">
    <h2>登录</h2>
    <%-- 显示错误信息 --%>
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
    <div class="error-message"><%= error %></div>
    <%
        }
    %>
    <form action="login" method="post" accept-charset="UTF-8" onsubmit="return validatePhone() && validatePassword()">
        <div class="form-row">
            <label for="phone">号码:</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div class="form-row">
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <input type="submit" value="登录">
    </form>
    <a href="register">没有账号，去注册</a>
</div>
</body>
</html>