package com.example;

import com.example.entity.ResponseEntity;
import com.example.entity.User;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

public class MyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // 输出固定内容
        out.println("<html><body>");
        out.println("<h2>Hello from MyServlet!  333</h2>");

        // 输出协议信息
        out.printf("<p>Protocol: %s</p>%n", request.getProtocol());

        // 输出所有请求头
        out.println("<h3>Request Headers:</h3>");
        out.println("<ul>");
        java.util.Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String headerName = headerNames.nextElement();
            String headerValue = request.getHeader(headerName);
            out.printf("<li><strong>%s:</strong> %s</li>%n", headerName, headerValue);
        }
        out.println("</ul>");

        // 结束 HTML
        out.println("</body></html>");

        BufferedReader reader = request.getReader();
        StringBuilder body = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            body.append(line);
        }
        System.out.println("Request Body: " + body.toString());
        java.util.Map<String, String[]> parameterMap = request.getParameterMap();
        for (java.util.Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
            String paramName = entry.getKey();
            String[] paramValues = entry.getValue();
            System.out.println(paramName + ": " + String.join(", ", paramValues));
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // 输出固定内容
//        out.println("<html><body>");
//        out.println("<h2>Hello from MyServlet!  333</h2>");
//
//        // 输出协议信息
//        out.printf("<p>Protocol: %s</p>%n", request.getProtocol());

        // 输出所有请求头
//        out.println("<h3>Request Headers:</h3>");
//        out.println("<ul>");
//        java.util.Enumeration<String> headerNames = request.getHeaderNames();
//        while (headerNames.hasMoreElements()) {
//            String headerName = headerNames.nextElement();
//            String headerValue = request.getHeader(headerName);
//            out.printf("<li><strong>%s:</strong> %s</li>%n", headerName, headerValue);
//        }
//        out.println("</ul>");
//
//        // 输出 POST 请求体
//        out.println("<h3>Request Body:</h3>");
        BufferedReader reader = request.getReader();
        StringBuilder body = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            body.append(line);
        }
//        out.printf("<pre>%s</pre>%n", body.toString());

        // 输出 POST 表单参数
//        out.println("<h3>POST Parameters:</h3>");
//        out.println("<ul>");
//        java.util.Map<String, String[]> parameterMap = request.getParameterMap();
//        for (java.util.Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
//            String paramName = entry.getKey();
//            String[] paramValues = entry.getValue();
//            out.printf("<li><strong>%s:</strong> %s</li>%n", paramName, String.join(", ", paramValues));
//        }
//        out.println("</ul>");
//
//        // 结束 HTML
//        out.println("</body></html>");

        // 解析 JSON 请求体
        ObjectMapper objectMapper = new ObjectMapper();
        User user = objectMapper.readValue(body.toString(), User.class);

        // 打印请求体和参数到控制台
        System.out.println("Request Body: post " + body.toString());
//        for (java.util.Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
//            String paramName = entry.getKey();
//            String[] paramValues = entry.getValue();
//            System.out.println(paramName + ": " + String.join(", ", paramValues));
//        }

        // 构造响应数据
        user.setEmail("333@qq.com");
        ResponseEntity responseData = new ResponseEntity();
        responseData.setCode(0);
        responseData.setMessage("User data received successfully");
        responseData.setData(user);

        // 将响应数据转换为 JSON 字符串
        String jsonResponse = objectMapper.writeValueAsString(responseData);

        // 将 JSON 字符串写入响应
        out.print(jsonResponse);
        out.flush();
    }

}