package com.example.product.repository;

import com.example.product.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> showList();
    void save(Product product);
    List<Product> findByName(String nameSearch);
    void update(int id, Product product);
    void delete(int id);
    Product finById(int id);
}
