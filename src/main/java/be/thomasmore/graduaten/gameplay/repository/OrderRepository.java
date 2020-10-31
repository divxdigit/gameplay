package be.thomasmore.graduaten.gameplay.repository;

import be.thomasmore.graduaten.gameplay.entity.Order;
import be.thomasmore.graduaten.gameplay.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findById(Integer id);

    List<Order> findByDateCollect(Date date);
    List<Order> findByDateCollectBetween(Date dateStart, Date dateEnd);

    List<Order> findByDateCreated(Date date);
    List<Order> findByDateCreatedBetween(Date dateStart, Date dateEnd);

    List<Order> findByUser(User user);

}
