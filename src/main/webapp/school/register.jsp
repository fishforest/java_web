<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            display: flex;
            flex-direction: column;
        }
        h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        .form-row {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            height: 40px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a {
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }
        a:hover {
            text-decoration: underline;
        }
        .registered-message {
            text-align: center;
            color: #333;
            font-size: 16px;
            margin-top: 20px;
        }
        .hidden {
            display: none;
        }
        .admin-button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .admin-button:hover {
            background-color: #218838;
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
    <form action="register" method="post" accept-charset="UTF-8" onsubmit="return validatePhone() && validatePassword()">
        <div class="form-row">
            <label for="name">姓名:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-row">
            <label for="phone">号码:</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div class="form-row">
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <input type="submit" value="注册">
        <button type="button" class="admin-button" onclick="window.location.href='admin'">管理员页面</button>
    </form>
</body>
</html>