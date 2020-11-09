package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Product;

import java.util.List;

public interface ProductService {
    List<Product> getProducts();
    List<Product> getProductByName(String name);
    List<Product> getProductByNameContains(String name);

    Product getAgeCategoryById(Long id);
    Product addProduct(Product product);
}
