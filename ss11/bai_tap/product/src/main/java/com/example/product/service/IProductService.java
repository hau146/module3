package com.example.product.service;

import com.example.product.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> showList();
    void save(Product product);
    void update(int id,Product product);
    void delete(int id);
    Product finById(int id);
    List<Product> findByName(String nameSearch);
}
