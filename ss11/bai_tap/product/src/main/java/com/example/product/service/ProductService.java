package com.example.product.service;

import com.example.product.model.Product;
import com.example.product.repository.IProductRepository;
import com.example.product.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> showList() {
        return productRepository.showList();
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public void update(int id,Product product) {
        productRepository.update(id,product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public Product finById(int id) {
        return productRepository.finById(id);
    }

    @Override
    public List<Product> findByName(String nameSrearch) {
        return productRepository.findByName(nameSrearch);
    }
}
