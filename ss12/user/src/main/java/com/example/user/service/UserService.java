package com.example.user.service;

import com.example.user.model.User;
import com.example.user.repository.IUserRepository;
import com.example.user.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService{
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> showList() {
        return userRepository.showList();
    }

    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public void update(int id, User user) {
        userRepository.update(id,user);
    }

    @Override
    public void delete(int id) {
        userRepository.delete(id);
    }

    @Override
    public User finById(int id) {
        return userRepository.finById(id);
    }

    @Override
    public List<User> searchByCountry(String country) {
        return userRepository.searchByCountry(country);
    }

    @Override
    public List<User> sortUp() {
        return userRepository.sortUp();
    }

    @Override
    public List<User> sortDown() {
        return userRepository.sortDown();
    }

    @Override
    public void insertUpdateUseTransaction() {
        userRepository.insertUpdateUseTransaction();
    }

    @Override
    public void addUserTransaction(User user, List<Integer> permission) {
        userRepository.addUserTransaction(user,permission);
    }
}
