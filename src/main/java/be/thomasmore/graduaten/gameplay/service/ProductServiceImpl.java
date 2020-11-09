package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Product;
import be.thomasmore.graduaten.gameplay.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductRepository productRepository;

    @Override
    public List<Product> getProducts() {
        return productRepository.findAll();
    }

    @Override
    public Product addProduct(Product product) {
        return productRepository.save(product);
    }

    @Override
    public List<Product> getProductByName(String name) {
        return productRepository.findByName(name);
    }

    @Override
    public List<Product> getProductByNameContains(String name) {
        return productRepository.findByNameContains(name);
    }

    @Override
    public Product getAgeCategoryById(Long id) {
        return productRepository.getOne(id);
    }
}