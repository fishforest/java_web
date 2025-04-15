package com.example.school;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String captcha = request.getParameter("captcha");
        // 这里添加登录逻辑
        HttpSession session = request.getSession();
        session.setAttribute("user", phone);
        response.sendRedirect("main");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
//        resp.sendRedirect(getServletContext().getContextPath() + "/school/login.jsp");
        req.getRequestDispatcher("/school/login.jsp").forward(req, resp);
    }
}