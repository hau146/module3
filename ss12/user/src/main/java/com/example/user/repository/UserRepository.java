package com.example.user.repository;

import com.example.user.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository{
    private static final String INSERT_USER = "insert into users(name, email, country) values (?,?,?);";
    private static final String SELECT_USER = "call get_user;";
    private static final String UPDATE_USER = "call edit_user(?,?,?,?);";
    private static final String DELETE_USER = "call delete_user(?)";
    private static final String SORT_UP = "select * from users where delete_users = 0 order by country asc;";
    private static final String SORT_DOWN = "select * from users where delete_users = 0 order by country desc;";
//    private static final String SEARCH_COUNTRY = "select * from users where country like ?%;";

    @Override
    public List<User> showList() {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_USER);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public void save(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(int id, User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_USER);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2,user.getEmail());
            callableStatement.setString(3,user.getCountry());
            callableStatement.setInt(4,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_USER);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public User finById(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_USER);
            while (resultSet.next()){
                if (resultSet.getInt("id") == id){
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    user = new User(id,name,email,country);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public List<User> searchByCountry(String countrySearch) {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_USER);
            while (resultSet.next()){
                if (resultSet.getString("country").contains(countrySearch)){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    userList.add(new User(id,name,email,country));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public List<User> sortUp() {
        Connection connection = BaseRepository.getConnection();
        List<User> sortUpList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SORT_UP);
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                sortUpList.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return sortUpList;
    }

    @Override
    public List<User> sortDown() {
        Connection connection = BaseRepository.getConnection();
        List<User> sortDownList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SORT_DOWN);
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                sortDownList.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return sortDownList;
    }
}
