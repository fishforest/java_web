package com.example;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class WelcomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取 RequestDispatcher 对象，用于转发请求到 welcome.jsp
        RequestDispatcher dispatcher = req.getRequestDispatcher("welcome.jsp");

        // 转发请求
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置响应内容类型为 HTML
        resp.setContentType("text/html");

        // 提取 PrintWriter 对象
        PrintWriter out = resp.getWriter();

        // 输出 HTML 内容
        out.println("<html>");
        out.println("<head><title>Welcome</title></head>");
        out.println("<body>");
        out.println("<h1>Welcome to Java Web I'm from post</h1>");
        out.println("</body>");
        out.println("</html>");
    }
}
