package be.thomasmore.graduaten.gameplay.repository;

import be.thomasmore.graduaten.gameplay.entity.Genre;
import be.thomasmore.graduaten.gameplay.entity.Publisher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PublisherRepository extends JpaRepository<Publisher, Long> {
    List<Publisher> findByName(String name);
    Publisher findById(Integer id);
}