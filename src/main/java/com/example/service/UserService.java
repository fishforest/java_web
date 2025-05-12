package com.example.service;

import com.example.model.User;
import com.example.dao.UserDao;

import java.util.List;

public class UserService {
    private UserDao userDao = new UserDao();

    public List<User> getAllUsers() {
        long startTime = System.currentTimeMillis();
        List<User> list = userDao.getAllUsers();
        long endTime = System.currentTimeMillis();
        System.out.println("getAllUsers：" + (endTime - startTime) + "ms");
        return list;
    }

    public void addUser(User user) {
        userDao.addUser(user);
    }

    public void updateUser(int id, String name) {
        userDao.updateUser(id, name);
    }

    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }
}