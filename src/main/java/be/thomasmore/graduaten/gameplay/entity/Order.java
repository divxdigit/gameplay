package be.thomasmore.graduaten.gameplay.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
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

    @NotNull(message = "Veld moet verplicht ingevuld worden met formaat yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dateCreated;

    @NotNull(message = "Veld moet verplicht ingevuld worden met formaat yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dateCollect;

    private int status;
    private String deliveryStreet;
    private String deliveryNumber;
    private int deliveryPostalcode;
    private String deliveryCity;

    ///constructors

    public Order() {
    }

    public Order(Long id, Set<OrderProduct> orderProducts, User user, @NotNull(message = "Veld moet verplicht ingevuld worden met formaat yyyy-MM-dd") LocalDate dateCreated, @NotNull(message = "Veld moet verplicht ingevuld worden met formaat yyyy-MM-dd") LocalDate dateCollect, int status, String deliveryStreet, String deliveryNumber, int deliveryPostalcode, String deliveryCity) {
        this.id = id;
        this.orderProducts = orderProducts;
        this.user = user;
        this.dateCreated = dateCreated;
        this.dateCollect = dateCollect;
        this.status = status;
        this.deliveryStreet = deliveryStreet;
        this.deliveryNumber = deliveryNumber;
        this.deliveryPostalcode = deliveryPostalcode;
        this.deliveryCity = deliveryCity;
    }

    // get/set


    public String getDeliveryStreet() {
        return deliveryStreet;
    }

    public void setDeliveryStreet(String deliveryStreet) {
        this.deliveryStreet = deliveryStreet;
    }

    public String getDeliveryNumber() {
        return deliveryNumber;
    }

    public void setDeliveryNumber(String deliveryNumber) {
        this.deliveryNumber = deliveryNumber;
    }

    public int getDeliveryPostalcode() {
        return deliveryPostalcode;
    }

    public void setDeliveryPostalcode(int deliveryPostalcode) {
        this.deliveryPostalcode = deliveryPostalcode;
    }

    public String getDeliveryCity() {
        return deliveryCity;
    }

    public void setDeliveryCity(String deliveryCity) {
        this.deliveryCity = deliveryCity;
    }

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

    public int getStatus() { return status;  }

    public void setStatus(int status) { this.status = status; }

    public LocalDate getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(LocalDate dateCreated) {
        this.dateCreated = dateCreated;
    }

    public LocalDate getDateCollect() {
        return dateCollect;
    }

    public void setDateCollect(LocalDate dateCollect) {
        this.dateCollect = dateCollect;
    }

    public Set<OrderProduct> getOrderProducts() { return orderProducts; }

    public void setOrderProducts(Set<OrderProduct> orderProducts) { this.orderProducts = orderProducts; }

}

