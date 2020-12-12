package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.OrderType;
import be.thomasmore.graduaten.gameplay.repository.OrderTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderTypeServiceImpl implements OrderTypeService{
    @Autowired
    OrderTypeRepository orderTypeRepository;

    @Override
    public List<OrderType> getOrderTypes() { return orderTypeRepository.findAll();}

    @Override
    public OrderType getOrderTypeById(Long id) { return orderTypeRepository.getOne(id);}

    @Override
    public List<OrderType> getOrderTypeByName(String name) { return orderTypeRepository.findByName(name);  }

    @Override
    public OrderType addOrderType(OrderType orderType) { return orderTypeRepository.save(orderType);  }

}