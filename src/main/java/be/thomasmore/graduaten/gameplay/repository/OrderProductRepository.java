package be.thomasmore.graduaten.gameplay.repository;


import be.thomasmore.graduaten.gameplay.entity.Order;
import be.thomasmore.graduaten.gameplay.entity.OrderProduct;
import be.thomasmore.graduaten.gameplay.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderProductRepository extends JpaRepository<OrderProduct, Long> {
    List<OrderProduct> findAll();
    Optional<OrderProduct> findById(Long id);

    List<OrderProduct> findByOrder(Order order);
    List<OrderProduct> findByProduct(Product product);
    List<OrderProduct> findByRentDurationWeeks(Integer weeks);
    List<OrderProduct> findByDiscountPrice (Double price);
    List<OrderProduct> findByOrderType (Integer ordertype);

}
