package be.thomasmore.graduaten.gameplay.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(mappedBy = "order")
    Set<OrderProduct> orderProducts;

    @ManyToOne
    private User user;

    private Date dateCreated;
    private Date dateCollect;

    private int status;

    ///constructors

    public Order() {
    }

    public Order(Long id, Set<OrderProduct> orderProducts, User user, Date dateCreated, Date dateCollect, int status) {
        this.id = id;
        this.orderProducts = orderProducts;
        this.user = user;
        this.dateCreated = dateCreated;
        this.dateCollect = dateCollect;
        this.status = status;
    }

// get/set

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getDateCollect() {
        return dateCollect;
    }

    public void setDateCollect(Date dateCollect) {
        this.dateCollect = dateCollect;
    }

    public int getStatus() { return status;  }

    public void setStatus(int status) { this.status = status; }

    public Set<OrderProduct> getOrderProducts() { return orderProducts; }

    public void setOrderProducts(Set<OrderProduct> orderProducts) { this.orderProducts = orderProducts; }
}

