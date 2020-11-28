package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Order;
import be.thomasmore.graduaten.gameplay.entity.OrderProduct;
import be.thomasmore.graduaten.gameplay.entity.Product;

import java.util.List;
import java.util.Optional;

public interface OrderProductService {
    List<OrderProduct> getOrderProducts();
    Optional<OrderProduct> getOrderProductsById(Long id);

    List<OrderProduct> getOrderProductsByOrder(Order order);
    List<OrderProduct> getOrderProductsByProduct(Product product);
    List<OrderProduct> getOrderProductsByOrderType(Integer ordertypeid);

    // CRUD
    Boolean addOrderProduct(OrderProduct orderProduct);

}
