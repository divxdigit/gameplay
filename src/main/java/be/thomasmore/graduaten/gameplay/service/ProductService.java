package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Product;

import java.util.List;

public interface ProductService {
    List<Product> getProducts();
    List<Product> getProductByName(String name);
    List<Product> getProductByNameContainsIgnoreCase(String name);
    List<Product> getProductByGenreId(Long genre);

    Product getProductById(Long id);
    Product addProduct(Product product);
}
