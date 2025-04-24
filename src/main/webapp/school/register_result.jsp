<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册结果</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9ecef;
        }
        .result-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }
        .result-message {
            font-size: 20px;
            color: #495057;
            margin-bottom: 25px;
            font-weight: 500;
        }
        .login-button {
            padding: 12px 24px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }
        .login-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="result-container">
    <div class="result-message">
        <%= request.getAttribute("message") %>
    </div>
    <a href="login" class="login-button">去登录</a>
</div>
</body>
</html>