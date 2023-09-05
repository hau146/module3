package com.example.user.repository;

import com.example.user.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> showList();
    void save(User user);
    void update(int id, User user);
    void delete(int id);
    User finById(int id);
    List<User> searchByCountry(String countrySearch);
    List<User> sortUp();
    List<User> sortDown();
    void insertUpdateUseTransaction();
    void addUserTransaction(User user, List<Integer> permission);
}
