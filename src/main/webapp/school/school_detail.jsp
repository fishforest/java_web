<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学校详情</title>
</head>
<body>
<%
    String schoolId = request.getParameter("id");
%>
<h2>学校详情</h2>
<p>学校ID: <%= schoolId %></p>
<!-- 更多学校详情信息... -->
<a href="main">返回主页面</a>
</body>
</html>