package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Order;
import be.thomasmore.graduaten.gameplay.entity.User;

import java.util.Date;
import java.util.List;

public interface OrderService {
    List<Order> getOrders();
    Order getOrderById(Long id);

    List<Order> getOrdersByUser(User user);
    Order getOrderByUserByStatus(User user, Integer state);
    List<Order> getOrdersByDateCreated(Date dateCreated);
    List<Order> getOrdersByDateCollect(Date dateCollect);


    List<Order> getOrdersCreatedBetweenDate(Date dateStart, Date dateEnd);
    List<Order> getOrdersCollectedBetweenDate(Date dateStart, Date dateEnd);

    // CRUD
    Boolean addOrder(Order order);
    Boolean updateOrder(Order order);
    Boolean deleteOrderByID(Long orderID);

}
