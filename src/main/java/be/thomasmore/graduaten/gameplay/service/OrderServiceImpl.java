package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Order;
import be.thomasmore.graduaten.gameplay.entity.Publisher;
import be.thomasmore.graduaten.gameplay.entity.User;
import be.thomasmore.graduaten.gameplay.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    OrderRepository orderRepository;

        @Override
    public List<Order> getOrders() {
        return orderRepository.findAll();
    }

    @Override
    public Order addOrder(Order order) {
        return orderRepository.save(order);
    }

    @Override
    public Order getOrderById(Long id) {
        return orderRepository.getOne(id);
    }

    @Override
    public List<Order> getOrdersByUser(User user) {
        return orderRepository.findByUser(user);
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




