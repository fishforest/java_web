package com.example;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ServletForJSP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置响应内容类型为 HTML
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // 输出 HTML 表单
        out.println("<html>");
        out.println("<head><title>Login Form</title></head>");
        out.println("<body>");
        out.println("<h2>Login</h2>");
        out.println("<form action=\"" + request.getContextPath() + "/login\" method=\"post\">");
        out.println("  <label for=\"username\">Username:</label>");
        out.println("  <input type=\"text\" id=\"username\" name=\"username\" required><br><br>");
        out.println("  <label for=\"password\">Password:</label>");
        out.println("  <input type=\"password\" id=\"password\" name=\"password\" required><br><br>");
        out.println("  <input type=\"submit\" value=\"Login\">");
        out.println("</form>");
        out.println("</body>");
        out.println("</html>");
//        request.getRequestDispatcher("show_user_info.jsp").forward(request, response);
//        response.sendRedirect("show_user_info.jsp");
//        response.sendRedirect(request.getContextPath() + "/login");//        response.sendRedirect("success.jsp");
//        request.getRequestDispatcher("success.jsp").forward(request, response);
    }
}
