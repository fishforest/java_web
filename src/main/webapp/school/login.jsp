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
            justify-content: flex-start; /* 修改此行以左对齐 */
            align-items: center;
            margin-bottom: 15px;
        }

        .form-row label {
            flex: 1;
            text-align: right;
            margin-right: 10px;
            font-size: 14px;
        }

        .form-row input[type="text"] {
            flex: 2;
            padding: 8px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            font-size: 14px;
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
        }

        .login-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>登录</h2>
    <form action="login" method="post" accept-charset="UTF-8">
        <div class="form-row">
            <label for="phone">号码:</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div class="form-row">
            <label for="captcha">验证码:</label>
            <input type="text" id="captcha" name="captcha" required>
        </div>
        <input type="submit" value="登录">
    </form>
    <a href="register">没有账号，去注册</a> <!-- 添加注册链接 -->
</div>
</body>
</html>
