package be.thomasmore.graduaten.gameplay.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

@Entity
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


    @ManyToOne
    private Product product;
    @ManyToOne
    private User user;

    private LocalDate dateCreated= LocalDate.now(ZoneId.of("Europe/Paris"));
    private Date dateCollect;

    ///constructors


    public Order() {
    }

    public Order(Long id, Product product, User user, Date dateCollect) {
        this.id = id;
        this.product = product;
        this.user = user;
        this.dateCreated = dateCreated;
        this.dateCollect = dateCollect;
    }

    // get/set


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDate getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(LocalDate dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getDateCollect() {
        return dateCollect;
    }

    public void setDateCollect(Date dateCollect) {
        this.dateCollect = dateCollect;
    }
}

