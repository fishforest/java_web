package com.example.school;

import com.example.util.DatabaseUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password"); // 将 captcha 改为 password

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            
            // 检查users表是否存在，如果不存在则创建
            String checkTableSql = "CREATE TABLE IF NOT EXISTS users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255) UNIQUE, phone VARCHAR(255), password VARCHAR(255))"; // 将 captcha 改为 password
            pstmt = conn.prepareStatement(checkTableSql);
            pstmt.executeUpdate();

            // 检查用户是否已经注册
            String checkUserSql = "SELECT * FROM users WHERE name = ?";
            pstmt = conn.prepareStatement(checkUserSql);
            pstmt.setString(1, name);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 用户已注册，返回提示信息
                request.setAttribute("message", "该用户已注册");
                request.getRequestDispatcher("/school/register_result.jsp").forward(request, response);
            } else {
                // 用户未注册，将用户信息写入数据库
                String insertUserSql = "INSERT INTO users (name, phone, password) VALUES (?, ?, ?)"; // 将 captcha 改为 password
                pstmt = conn.prepareStatement(insertUserSql);
                pstmt.setString(1, name);
                pstmt.setString(2, phone);
                pstmt.setString(3, password); // 将 captcha 改为 password
                pstmt.executeUpdate();

                request.setAttribute("message", "恭喜注册成功");
                request.getRequestDispatcher("/school/register_result.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, pstmt, conn);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/school/register.jsp").forward(request, response);
    }
}