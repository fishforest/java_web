package com.example.hibernate.servlet;

import com.example.hibernate.dao.UserDAO;
import com.example.hibernate.model.HiUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/hiAdmin")
public class HiAdminServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listUsers(req, resp);
                break;
            case "edit":
                editUser(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            default:
                listUsers(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            addUser(req, resp);
        } else if ("edit".equals(action)) {
            updateUser(req, resp);
        }
    }

    private void listUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long startTime = System.currentTimeMillis();
        List<HiUser> users = userDAO.getUsers();
        System.out.println("listUsers time: " + (System.currentTimeMillis() - startTime));
        req.setAttribute("users", users);
        req.getRequestDispatcher("/school/hi_admin.jsp").forward(req, resp);
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("name");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        HiUser user = new HiUser();
        user.setUsername(username);
        user.setPhone(phone);
        user.setPassword(password);

        userDAO.saveUser(user);
        resp.sendRedirect("hiAdmin");
    }

    private void editUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        HiUser user = userDAO.getUserById(id);
        user.setUsername(req.getParameter("name"));
        userDAO.updateUser(user);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/school/hi_admin.jsp").forward(req, resp);
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        String username = req.getParameter("name");
        String phone = req.getParameter("phone");

//        HiUser user = userDAO.getUserById(id);
//        user.setUsername(username);
//        user.setPhone(phone);
//
//        userDAO.updateUser(user);
        resp.sendRedirect("hiAdmin");
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        userDAO.deleteUser(userDAO.getUserById(id));
        resp.sendRedirect("hiAdmin");
    }
}