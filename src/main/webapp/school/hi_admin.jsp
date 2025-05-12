<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.hibernate.dao.UserDAO" %>
<%@ page import="com.example.hibernate.model.HiUser" %>
<%@ page import="java.util.List" %>

<%
    UserDAO userDAO = new UserDAO();
    List<HiUser> users = userDAO.getUsers();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员页面-Hibernate</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f8f8f8;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .action-buttons button {
            padding: 5px 10px;
            margin-right: 5px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .edit {
            background-color: #4CAF50;
            color: white;
        }
        .delete {
            background-color: #f44336;
            color: white;
        }
        .add-user-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .add-user-form h2 {
            margin-top: 0;
        }
        .add-user-form input[type="text"],
        .add-user-form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 3px;
        }
        .add-user-form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .add-user-form input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function editUser(id) {
            var newName = prompt("请输入新的姓名:");
            if (newName) {
                window.location.href = "hiAdmin?action=edit&id=" + id + "&name=" + newName;
            }
        }

        function deleteUser(id) {
            if (confirm("确定要删除该用户吗？")) {
                window.location.href = "hiAdmin?action=delete&id=" + id;
            }
        }
    </script>
</head>
<body>
    <h1>用户管理-Hibernate</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>姓名</th>
                <th>电话号码</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (HiUser user : users) {
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getUsername() %></td>
                <td><%= user.getPhone() %></td>
                <td>
                    <div class="action-buttons">
                        <button class="edit" onclick="editUser(<%= user.getId() %>)">编辑</button>
                        <button class="delete" onclick="deleteUser(<%= user.getId() %>)">删除</button>
                    </div>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <div class="add-user-form">
        <h2>添加新用户</h2>
        <form action="hiAdmin?action=add" method="post" accept-charset="UTF-8">
            <input type="text" name="name" placeholder="姓名" required>
            <input type="text" name="phone" placeholder="电话号码" required>
            <input type="password" name="password" placeholder="密码" required>
            <input type="submit" value="添加用户">
        </form>
    </div>
</body>
</html>