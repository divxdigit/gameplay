package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Order;
import be.thomasmore.graduaten.gameplay.entity.User;

import java.util.Date;
import java.util.List;

public interface OrderService {
    List<Order> getOrders();
    Order getOrderById(Long id);

    List<Order> getOrdersByUser(User user);
    List<Order> getOrdersByDateCreated(Date datecreated);
    List<Order> getOrdersByDateCollect(Date datecollect);


    List<Order> getOrdersCreatedBetweenDate(Date dateStart, Date dateEnd);
    List<Order> getOrdersCollectedBetweenDate(Date dateStart, Date dateEnd);

    // CRUD
    Order addOrder(Order order);

}
