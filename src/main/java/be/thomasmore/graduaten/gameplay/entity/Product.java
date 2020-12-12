package be.thomasmore.graduaten.gameplay.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "Products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @OneToMany(mappedBy = "product")
    Set<OrderProduct> orderProducts;

    private String name;

    private String description;
    @ManyToOne
    private Genre genre;

    @Override
    public boolean equals(Object o) {
////        if (this == o) return true;
//        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return id.equals(product.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @ManyToOne
    private AgeCategory ageCategory;
    private Integer playersMinimum;
    private Integer playersMaximum;
    private Integer rating;
    private Integer rentStock;
    private Integer buyStock;
    @ManyToOne
    private Publisher publisher;
    private String picture;
    private Double rentPrice;
    private Double buyPrice;
    @ManyToOne
    private Language language;
    private LocalDate dateLaunch;
    private Boolean active;

    ///constructors

    public Product() {
    }

    public Product(String name, String description, Genre genre, AgeCategory ageCategory, Integer playersMinimum, Integer playersMaximum, Integer rating, Integer rentStock, Integer buyStock, Publisher publisher, String picture, Double rentPrice, Double buyPrice, Language language, LocalDate dateLaunch, Boolean active) {
        /*this.id = id;*/
    /*public Product(Long id, Set<OrderProduct> orderProducts, String name, String description, Genre genre, AgeCategory ageCategory, Integer playersMinimum, Integer playersMaximum, Integer rating, Integer rentStock, Integer buyStock, Publisher publisher, String picture, Double rentPrice, Double buyPrice, Language language, Date dateLaunch, Boolean active) {*/
        this.id = id;
        this.orderProducts = orderProducts;
        this.name = name;
        this.description = description;
        this.genre = genre;
        this.ageCategory = ageCategory;
        this.playersMinimum = playersMinimum;
        this.playersMaximum = playersMaximum;
        this.rating = rating;
        this.rentStock = rentStock;
        this.buyStock = buyStock;
        this.publisher = publisher;
        this.picture = picture;
        this.rentPrice = rentPrice;
        this.buyPrice = buyPrice;
        this.language = language;
        this.dateLaunch = dateLaunch;
        this.active = active;
    }

// get/set

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    @ManyToOne
    public Genre getGenre() {
        return genre;
    }
    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    @ManyToOne
    public AgeCategory getAgeCategory() {
        return ageCategory;
    }
    public void setAgeCategory(AgeCategory ageCategory) {
        this.ageCategory = ageCategory;
    }

    public Integer getPlayersMinimum() {
        return playersMinimum;
    }
    public void setPlayersMinimum(Integer playersMinimum) {
        this.playersMinimum = playersMinimum;
    }

    public Integer getPlayersMaximum() {
        return playersMaximum;
    }
    public void setPlayersMaximum(Integer playersMaximum) {
        this.playersMaximum = playersMaximum;
    }

    public Integer getRating() {
        return rating;
    }
    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Integer getRentStock() {
        return rentStock;
    }
    public void setRentStock(Integer rentStock) {
        this.rentStock = rentStock;
    }

    public Integer getBuyStock() {
        return buyStock;
    }
    public void setBuyStock(Integer buyStock) {
        this.buyStock = buyStock;
    }

    public Publisher getPublisher() {
        return publisher;
    }
    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }

    public String getPicture() {
        return picture;
    }
    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Double getRentPrice() {
        return rentPrice;
    }
    public void setRentPrice(Double rentPrice) {
        this.rentPrice = rentPrice;
    }

    public Double getBuyPrice() {
        return buyPrice;
    }
    public void setBuyPrice(Double buyPrice) {
        this.buyPrice = buyPrice;
    }

    public Language getLanguage() {
        return language;
    }
    public void setLanguage(Language language) {
        this.language = language;
    }

    public LocalDate getDateLaunch() {
        return dateLaunch;
    }
    public void setDateLaunch(LocalDate dateLaunch) {
        this.dateLaunch = dateLaunch;
    }

    public Boolean getActive() {
        return active;
    }
    public void setActive(Boolean active) {
        this.active = active;
    }

    public Set<OrderProduct> getOrderProducts() { return orderProducts; }
    public void setOrderProducts(Set<OrderProduct> orderProducts) { this.orderProducts = orderProducts; }

    //methodes

    // overrrides

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", genre=" + genre +
                ", ageCategory=" + ageCategory +
                ", playersMinimum=" + playersMinimum +
                ", playersMaximum=" + playersMaximum +
                ", rating=" + rating +
                ", rentStock=" + rentStock +
                ", buyStock=" + buyStock +
                ", publisher=" + publisher +
                ", picture='" + picture + '\'' +
                ", rentPrice=" + rentPrice +
                ", buyPrice=" + buyPrice +
                ", language=" + language +
                ", dateLaunch=" + dateLaunch +
                ", active=" + active +
                '}';
    }
}
