<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WelcomeJSP</title>
</head>
<body>
<h1>Welcome to Java Web In JSP</h1>

<%
    // 从请求中提取 name 和 email 参数
    String name = request.getParameter("name");
    String email = request.getParameter("email");
%>

<!-- 显示 name 和 email -->
<p>Name: <%= name != null ? name : "No name provided" %></p>
<p>Email: <%= email != null ? email : "No email provided" %></p>

</body>
</html>
