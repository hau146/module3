package com.example.user.service;

import com.example.user.model.User;

import java.util.List;

public interface IUserService {
    List<User> showList();
    void save(User user);
    void update(int id, User user);
    void delete(int id);
    User finById(int id);
    List<User> searchByCountry(String country);
    List<User> sortUp();
    List<User> sortDown();
    public void insertUpdateUseTransaction();
    void addUserTransaction(User user, List<Integer> permission);
}
