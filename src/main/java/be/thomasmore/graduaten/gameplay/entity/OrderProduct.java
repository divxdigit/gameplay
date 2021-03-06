package be.thomasmore.graduaten.gameplay.entity;

import javax.persistence.*;


@Table(name = "Order_Products")
@Entity
public class OrderProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name ="order_id")
    private Order order;

    @ManyToOne
    @JoinColumn(name ="product_id")
    private Product product;

    private Integer rentDurationWeeks;
    private Integer orderType;
    private Double price;
    private Double discountPrice;
    private Boolean returned;
    private Integer amount;


    //constructors
    public OrderProduct() {
    }

    public OrderProduct(Long id, Order order, Product product, Integer rentDurationWeeks, Integer orderType, Double price, Double discountPrice, Boolean returned, Integer amount) {
        this.id = id;
        this.order = order;
        this.product = product;
        this.rentDurationWeeks = rentDurationWeeks;
        this.orderType = orderType;
        this.price = price;
        this.discountPrice = discountPrice;
        this.returned = returned;
        this.amount = amount;
    }

    //getters and setters
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

    public Order getOrder() {
        return order;
    }
    public void setOrder(Order order) {
        this.order = order;
    }

    public Integer getRentDurationWeeks() {
        return rentDurationWeeks;
    }
    public void setRentDurationWeeks(Integer rentDurationWeeks) {
        this.rentDurationWeeks = rentDurationWeeks;
    }

    public Integer getOrderType() {
        return orderType;
    }
    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }

    public Double getPrice() {
        return price;
    }
    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getDiscountPrice() {
        return discountPrice;
    }
    public void setDiscountPrice(Double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public Boolean getReturned() { return returned; }
    public void setReturned(Boolean returned) { this.returned = returned; }

    public Integer getAmount() { return amount; }
    public void setAmount(Integer amount) { this.amount = amount; }

    //methods

    //overrides

    @Override
    public String toString() {
        return "OrderProduct{" +
                "id=" + id +
                ", order=" + order +
                ", product=" + product +
                ", rentDurationWeeks=" + rentDurationWeeks +
                ", orderType=" + orderType +
                ", price=" + price +
                ", discountPrice=" + discountPrice +
                ", returned=" + returned +
                ", amount=" + amount +
                '}';
    }

}
