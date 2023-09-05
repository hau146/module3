package com.example.user.repository;

import com.example.user.model.User;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String INSERT_USER = "insert into users(name, email, country) values (?,?,?);";
    private static final String SELECT_USER = "call get_user;";
    private static final String UPDATE_USER = "call edit_user(?,?,?,?);";
    private static final String DELETE_USER = "call delete_user(?)";
    private static final String SORT_UP = "select * from users where delete_users = 0 order by country asc;";
    private static final String SORT_DOWN = "select * from users where delete_users = 0 order by country desc;";
    private static final String SQL_TABLE_DROP = "DROP TABLE IF EXISTS EMPLOYEE";
    private static final String SQL_TABLE_CREATE = "create table Employee ( \n" +
            "            id int(3) NOT NULL AUTO_INCREMENT, \n" +
            "            name varchar(120) NOT NULL, \n" +
            "            salary int(220) NOT NULL, \n" +
            "            created_Date datetime, \n" +
            "            PRIMARY KEY (id) \n" +
            ");";
//    private static final String SEARCH_COUNTRY = "select * from users where country like ?%;";

    @Override
    public List<User> showList() {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_USER);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
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
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
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
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setInt(4, id);
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
            callableStatement.setInt(1, id);
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
            while (resultSet.next()) {
                if (resultSet.getInt("id") == id) {
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    user = new User(id, name, email, country);
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
            while (resultSet.next()) {
                if (resultSet.getString("country").contains(countrySearch)) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    userList.add(new User(id, name, email, country));
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
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                sortUpList.add(new User(id, name, email, country));
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
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                sortDownList.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return sortDownList;
    }

    @Override
    public void insertUpdateUseTransaction() {
        try (Connection conn = BaseRepository.getConnection();

             Statement statement = conn.createStatement();

             PreparedStatement preparedStatement = conn.prepareStatement(INSERT_USER);
             PreparedStatement psUpdate = conn.prepareStatement(UPDATE_USER)) {

            statement.execute(SQL_TABLE_DROP);
            statement.execute(SQL_TABLE_CREATE);

            conn.setAutoCommit(false);

            preparedStatement.setString(1, "Quynh");

            preparedStatement.setBigDecimal(2, new BigDecimal(10));

            preparedStatement.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            preparedStatement.execute();


            preparedStatement.setString(1, "Ngan");

            preparedStatement.setBigDecimal(2, new BigDecimal(20));

            preparedStatement.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            preparedStatement.execute();


//            psUpdate.setBigDecimal(2, new BigDecimal(999.99));


            psUpdate.setBigDecimal(1, new BigDecimal(999.99));

            psUpdate.setString(2, "Quynh");

            psUpdate.execute();


            conn.commit();

            conn.setAutoCommit(true);


        } catch (Exception e) {

            System.out.println(e.getMessage());

            e.printStackTrace();

        }
    }

    @Override
    public void addUserTransaction(User user, List<Integer> permission) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        PreparedStatement preparedStatementAssignment = null;
        try {
            connection = BaseRepository.getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(INSERT_USER, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int rowAffected = preparedStatement.executeUpdate();

            resultSet = preparedStatement.getGeneratedKeys();
            int userld = 0;
            if (resultSet.next()) {
                userld = resultSet.getInt(1);
            }

            if (rowAffected == 1) {
                String sqlPivot = "INSERT INTO user_permision(permision_id,user_id)"
                        + "values(?,?);";
                preparedStatementAssignment = connection.prepareStatement(sqlPivot);
                for (int permisionId : permission) {
                    preparedStatementAssignment.setInt(1, permisionId);
                    preparedStatementAssignment.setInt(2, userld);
                    preparedStatementAssignment.executeUpdate();
                }
                connection.commit();
            } else {
                connection.rollback();
            }

        } catch (SQLException ex) {
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (preparedStatementAssignment != null) {
                    preparedStatementAssignment.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }

    }
}
