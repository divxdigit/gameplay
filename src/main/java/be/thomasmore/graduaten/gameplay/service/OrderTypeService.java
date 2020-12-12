package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.OrderType;

import java.util.List;

public interface OrderTypeService {
    List<OrderType> getOrderTypes();
    List<OrderType> getOrderTypeByName(String name);
    OrderType getOrderTypeById(Long id);
    OrderType addOrderType(OrderType language);
}