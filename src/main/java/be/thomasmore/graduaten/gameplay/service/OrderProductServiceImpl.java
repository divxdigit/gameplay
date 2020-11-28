package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Order;
import be.thomasmore.graduaten.gameplay.entity.OrderProduct;
import be.thomasmore.graduaten.gameplay.entity.Product;
import be.thomasmore.graduaten.gameplay.repository.OrderProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderProductServiceImpl implements OrderProductService{
    @Autowired
    OrderProductRepository orderProductRepository;


    @Override
    public List<OrderProduct> getOrderProducts() {
        return orderProductRepository.findAll();
    }

    @Override
    public Optional<OrderProduct> getOrderProductsById(Long id) {
        return orderProductRepository.findById(id);
    }

    @Override
    public List<OrderProduct> getOrderProductsByOrder(Order order) {
        return null;
    }

    @Override
    public List<OrderProduct> getOrderProductsByProduct(Product product) {
        return orderProductRepository.findByProduct(product);
    }


    @Override
    public List<OrderProduct> getOrderProductsByOrderType(Integer ordertypeid) {
        return orderProductRepository.findByOrderType(ordertypeid);
    }

    @Override
    public Boolean addOrderProduct(OrderProduct orderProduct) {
        orderProductRepository.save(orderProduct);
        return true;
    }
}




