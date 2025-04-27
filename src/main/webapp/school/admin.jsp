<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.User" %>
<html>
<head>
    <title>管理员页面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .action-buttons {
            display: flex;
            gap: 5px;
        }
        .action-buttons button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        .action-buttons button.edit {
            background-color: #28a745;
            color: #fff;
        }
        .action-buttons button.delete {
            background-color: #dc3545;
            color: #fff;
        }
        .add-user-form {
            margin-top: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .add-user-form input[type="text"], .add-user-form input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        .add-user-form input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
    <script>
        function editUser(id) {
            var newName = prompt("请输入新的姓名:");
            if (newName) {
                window.location.href = "editUser?id=" + id + "&name=" + newName;
            }
        }

        function deleteUser(id) {
            if (confirm("确定要删除该用户吗？")) {
                window.location.href = "deleteUser?id=" + id;
            }
        }
    </script>
</head>
<body>
    <h1>用户管理</h1>
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
                List<User> users = (List<User>) request.getAttribute("users");
                for (User user : users) {
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getName() %></td>
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
        <form action="addUser" method="post">
            <input type="text" name="name" placeholder="姓名" required>
            <input type="text" name="phone" placeholder="电话号码" required>
            <input type="password" name="password" placeholder="密码" required>
            <input type="submit" value="添加用户">
        </form>
    </div>
</body>
</html>