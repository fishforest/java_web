package com.example.school;

import com.example.hibernate.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*") // 拦截所有请求
public class AuthFilter implements Filter {

    static boolean hasInitHibernate = false;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        if (!hasInitHibernate) {
            hasInitHibernate = true;
            new UserDAO();
        }

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String path = httpRequest.getRequestURI();

        // 1. 白名单路径放行（避免循环重定向）
        if (path.endsWith("/login") || path.endsWith("admin") || path.endsWith("hiAdmin") || path.endsWith("/register")|| path.endsWith(".css") || path.endsWith(".js")) {
            chain.doFilter(request, response);
            return;
        }

        // 2. 检查登录态
        HttpSession session = httpRequest.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
        } else {
            chain.doFilter(request, response);
        }
    }
}
