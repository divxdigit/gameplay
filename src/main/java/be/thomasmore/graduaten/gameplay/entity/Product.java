package be.thomasmore.graduaten.gameplay.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;

    private String Description;
    private String Genre;
    private Integer AgeCategory;
    private Integer PlayersMinimum;
    private Integer PlayersMaximum;
    private Integer Rating;
    private Integer RentStock;
    private Integer BuyStock;
    private Integer Publisher;
    private String Picture;
    private Double RentPrice;
    private Double BuyPrice;
    private Integer Language;
    private Date DateLaunch;
    private Boolean IsActive;

    public Product() {
    }

    public Product(Long id, String name, String description, String genre, Integer ageCategory, Integer playersMinimum, Integer playersMaximum, Integer rating, Integer rentStock, Integer buyStock, Integer publisher, String picture, Double rentPrice, Double buyPrice, Integer language, Date dateLaunch, Boolean isActive) {
        this.id = id;
        this.name = name;
        Description = description;
        Genre = genre;
        AgeCategory = ageCategory;
        PlayersMinimum = playersMinimum;
        PlayersMaximum = playersMaximum;
        Rating = rating;
        RentStock = rentStock;
        BuyStock = buyStock;
        Publisher = publisher;
        Picture = picture;
        RentPrice = rentPrice;
        BuyPrice = buyPrice;
        Language = language;
        DateLaunch = dateLaunch;
        IsActive = isActive;
    }

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
        return Description;
    }
    public void setDescription(String description) {
        Description = description;
    }

    public String getGenre() {
        return Genre;
    }
    public void setGenre(String genre) {
        Genre = genre;
    }

    public Integer getAgeCategory() {
        return AgeCategory;
    }
    public void setAgeCategory(Integer ageCategory) {
        AgeCategory = ageCategory;
    }

    public Integer getPlayersMinimum() {
        return PlayersMinimum;
    }
    public void setPlayersMinimum(Integer playersMinimum) {
        PlayersMinimum = playersMinimum;
    }

    public Integer getPlayersMaximum() {
        return PlayersMaximum;
    }
    public void setPlayersMaximum(Integer playersMaximum) {
        PlayersMaximum = playersMaximum;
    }

    public Integer getRating() {
        return Rating;
    }
    public void setRating(Integer rating) {
        Rating = rating;
    }

    public Integer getRentStock() {
        return RentStock;
    }
    public void setRentStock(Integer rentStock) {
        RentStock = rentStock;
    }

    public Integer getBuyStock() {
        return BuyStock;
    }
    public void setBuyStock(Integer buyStock) {
        BuyStock = buyStock;
    }

    public Integer getPublisher() {
        return Publisher;
    }
    public void setPublisher(Integer publisher) {
        Publisher = publisher;
    }

    public String getPicture() {
        return Picture;
    }
    public void setPicture(String picture) {
        Picture = picture;
    }

    public Double getRentPrice() {
        return RentPrice;
    }
    public void setRentPrice(Double rentPrice) {
        RentPrice = rentPrice;
    }

    public Double getBuyPrice() {
        return BuyPrice;
    }
    public void setBuyPrice(Double buyPrice) {
        BuyPrice = buyPrice;
    }

    public Integer getLanguage() {
        return Language;
    }
    public void setLanguage(Integer language) {
        Language = language;
    }

    public Date getDateLaunch() {
        return DateLaunch;
    }
    public void setDateLaunch(Date dateLaunch) {
        DateLaunch = dateLaunch;
    }

    public Boolean getActive() {
        return IsActive;
    }
    public void setActive(Boolean active) {
        IsActive = active;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
