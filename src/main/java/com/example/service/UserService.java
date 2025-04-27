package com.example.service;

import com.example.model.User;
import com.example.dao.UserDao;

import java.util.List;

public class UserService {
    private UserDao userDao = new UserDao();

    public List<User> getAllUsers() {
        return userDao.getAllUsers();
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