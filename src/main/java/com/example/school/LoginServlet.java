package com.example.school;

import com.example.util.DatabaseUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT password FROM users WHERE phone = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, phone);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        String storedPassword = rs.getString("password");
                        if (storedPassword.equals(password)) {
                            // 密码匹配，登录成功
                            HttpSession session = request.getSession();
                            session.setAttribute("user", phone);
                            response.sendRedirect("main");
                        } else {
                            // 密码不匹配，返回错误信息
                            request.setAttribute("error", "密码错误");
                            request.getRequestDispatcher("/school/login.jsp").forward(request, response);
                        }
                    } else {
                        // 用户不存在，返回错误信息
                        request.setAttribute("error", "用户不存在");
                        request.getRequestDispatcher("/school/login.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 数据库连接异常，返回错误信息
            request.setAttribute("error", "系统错误，请稍后重试");
            request.getRequestDispatcher("/school/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/school/login.jsp").forward(req, resp);
    }
}