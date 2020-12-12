package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Order;
import be.thomasmore.graduaten.gameplay.entity.Publisher;
import be.thomasmore.graduaten.gameplay.entity.User;
import be.thomasmore.graduaten.gameplay.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderProductService orderProductService;

        @Override
    public List<Order> getOrders() {
        return orderRepository.findAll();
    }

    @Override
    public Boolean addOrder(Order order) {
        orderRepository.save(order);
        return true;
    }

    @Override
    public Boolean updateOrder(Order order) {
        orderRepository.save(order);
        return true;
    }

    @Override
    public Boolean deleteOrderByID(Long orderID) {

        Optional<Order> searchOrder = orderRepository.findById(orderID);
        if (searchOrder.isPresent()) {
            Order order = searchOrder.get();
            orderProductService.deleteOrderProductsByOrder(order);
            orderRepository.delete(order);
            return true;
        }
        else {
            return false;
        }
    }

    @Override
    public Order getOrderById(Long id) {
        Optional<Order> order = orderRepository.findById(id);
        if (order.isPresent()) {
            return order.get();
        }
        else {
            return null;
        }
    }

    @Override
    public List<Order> getOrdersByUser(User user) {
        return orderRepository.findByUser(user);
    }

    @Override
    public Order getOrderByUserByStatus(User user, Integer status) {
        return orderRepository.findByUserAndStatus(user, status);
    }


    @Override
    public List<Order> getOrdersByDateCreated(Date datecreated) {
        return orderRepository.findByDateCreated(datecreated);
    }

    @Override
    public List<Order> getOrdersByDateCollect(Date datecollect) {
        return orderRepository.findByDateCollect(datecollect);
    }

    @Override
    public List<Order> getOrdersCreatedBetweenDate(Date dateStart, Date dateEnd) {
        return orderRepository.findByDateCreatedBetween(dateStart,dateEnd);
    }

    @Override
    public List<Order> getOrdersCollectedBetweenDate(Date dateStart, Date dateEnd) {
        return orderRepository.findByDateCollectBetween(dateStart,dateEnd);
    }
}




