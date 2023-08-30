package com.example.product.repository;

import com.example.product.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private static final String SELECT = "SELECT * FROM product where delete_product = 0";
    private static final String INSERT = "insert into product(name, price, `describe`, `producer`) values (?,?,?,?)";
    private static final String UPDATE = "update product set name = ?,price = ?,`describe` = ?,`producer` = ? where id = ?";
    private static final String DELETE = "update product set delete_product = ? where id = ?";
    @Override
    public List<Product> showList() {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                String describe = resultSet.getString("describe");
                String producer = resultSet.getString("producer");
                productList.add(new Product(id,name,price,describe,producer));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public void save(Product product) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2,product.getPrice());
            preparedStatement.setString(3, product.getDescribe());
            preparedStatement.setString(4, product.getProducer());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Product> findByName(String nameSearch) {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()){
                if (resultSet.getString("name").contains(nameSearch)){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    int price = resultSet.getInt("price");
                    String describe = resultSet.getString("describe");
                    String producer = resultSet.getString("producer");
                    productList.add(new Product(id,name,price,describe,producer));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public void update(int id, Product product) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setInt(2,product.getPrice());
            preparedStatement.setString(3,product.getDescribe());
            preparedStatement.setString(4, product.getProducer());
            preparedStatement.setInt(5,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,1);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product finById(int id) {
        Product product = null;
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()){
                if (resultSet.getInt("id") == id){
                    String name = resultSet.getString("name");
                    int price = resultSet.getInt("price");
                    String describe = resultSet.getString("describe");
                    String producer = resultSet.getString("producer");
                    product = new Product(id, name, price,describe,producer);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
}
