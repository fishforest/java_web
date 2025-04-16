<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学校详情</title>
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
        .detail-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        p {
            margin-bottom: 15px;
            color: #555;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
    String schoolId = request.getParameter("id");
%>
<div class="detail-container">
    <h2>学校详情</h2>
    <p>学校ID: <%= schoolId %></p>
    <!-- 更多学校详情信息... -->
    <a href="main">返回主页面</a>
</div>
</body>
</html>