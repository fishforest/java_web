package com.example;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置响应内容类型为 HTML
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // 获取表单数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 处理登录逻辑
//        if ("admin".equals(username) && "123456".equals(password)) {
//            out.println("<html><body>");
//            out.println("<h2>Login Successful!</h2>");
//            out.println("<p>Welcome, " + username + "!</p>");
//            out.println("</body></html>");
//        } else {
//            out.println("<html><body>");
//            out.println("<h2>Login Failed!</h2>");
//            out.println("<p>Invalid username or password.</p>");
//            out.println("</body></html>");
//        }

        request.getRequestDispatcher("show_user_info.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html");
//        PrintWriter out = resp.getWriter();
//        out.println("<html><body>");
//        out.println("<h2>Login Failed!</h2>");
//        out.println("<p>Invalid username or password.</p>");
//        out.println("</body></html>");
        req.getRequestDispatcher("show_user_info.jsp").forward(req, resp);

    }
}
