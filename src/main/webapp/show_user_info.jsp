     <%@ page contentType="text/html;charset=UTF-8" language="java" %>
     <html>
     <head>
         <title>Parameter Example</title>
     </head>
     <body>
         <h2>Parameter Example</h2>
         <%
             request.setCharacterEncoding("UTF-8");
             String method = request.getMethod();
             if ("GET".equals(method)) {
                 String name = request.getParameter("name");
                 String age = request.getParameter("age");
         %>
                 <p>Name: <%= name %></p>
                 <p>Age: <%= age %></p>
         <%
             } else if ("POST".equals(method)) {
                 String username = request.getParameter("username");
                 String password = request.getParameter("password");
         %>
                 <p>Username: <%= username %></p>
                 <p>Password: <%= password %></p>
         <%
             }
         %>
     </body>
     </html>
     