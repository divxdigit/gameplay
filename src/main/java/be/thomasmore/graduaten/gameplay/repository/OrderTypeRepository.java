package be.thomasmore.graduaten.gameplay.repository;

import be.thomasmore.graduaten.gameplay.entity.OrderType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderTypeRepository extends JpaRepository<OrderType, Long> {
    List<OrderType> findByName(String name);
}
