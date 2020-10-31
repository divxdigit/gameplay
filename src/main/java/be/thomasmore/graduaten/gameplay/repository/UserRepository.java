package be.thomasmore.graduaten.gameplay.repository;

import be.thomasmore.graduaten.gameplay.entity.AgeCategory;
import be.thomasmore.graduaten.gameplay.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findById(Integer id);
    List<User> findByFirstnameAndLastname (String firstname, String lastname);
    List<User> findByLastname(String lastname);
    List<User> findByFirstname(String lastname);
    List<User> findByActive(Boolean bool);
    User findByEmail(String email);

}
