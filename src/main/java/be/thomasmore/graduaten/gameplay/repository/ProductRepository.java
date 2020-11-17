package be.thomasmore.graduaten.gameplay.repository;

import be.thomasmore.graduaten.gameplay.entity.AgeCategory;
import be.thomasmore.graduaten.gameplay.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByName(String name);

    List<Product> findByNameContainsIgnoreCase(String name);

    List<Product> findByGenreId(Integer genre_id);


}
