package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Order;
import be.thomasmore.graduaten.gameplay.entity.OrderProduct;
import be.thomasmore.graduaten.gameplay.entity.Product;
import be.thomasmore.graduaten.gameplay.entity.User;

import java.util.List;
import java.util.Optional;

public interface OrderProductService {
    List<OrderProduct> getOrderProducts();
    OrderProduct getOrderProductById(Long id);

    List<OrderProduct> getOrderProductsByOrder(Order order);
    List<OrderProduct> getOrderProductsByProduct(Product product);
    List<OrderProduct> getOrderProductsByOrderType(Integer ordertypeid);

    // CRUD
    Boolean addOrderProduct(OrderProduct orderProduct);
    Boolean deleteOrderProductsByOrder(Order order);
    Boolean updateOrderProduct(OrderProduct orderProduct);
    Boolean deleteOrderProductByID(Long orderProductID);
}
