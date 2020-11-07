package be.thomasmore.graduaten.gameplay.entity;

import javax.persistence.*;

@Entity
@Table(name = "Users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String email;
    private String password;
    private boolean active;  // flag: user is not active after # amount false password input
    private boolean isDeleted; // this is a soft delete of a user. This is needed for history queries
    private Integer wrongPasswordcounter;

    private String lastname;
    private String firstname;
    private String street;
    private Integer number;
    private Integer bus;
    private Integer postalcode;
    private String city;

    @ManyToOne
    private UserType type;

    //constructors


    //Get & Set


    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public UserType getType() {
        return type;
    }
    public void setType(UserType type) {
        this.type = type;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
    return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public boolean isDeleted() {
        return isDeleted;
    }
    public void setDeleted(boolean deleted) {
        isDeleted = deleted;
    }

    public Integer getWrongPasswordcounter() {
        return wrongPasswordcounter;
    }
    public void setWrongPasswordcounter(Integer wrongPasswordcounter) {
        this.wrongPasswordcounter = wrongPasswordcounter;
    }

    public String getLastname() {
        return lastname;
    }
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }

    public Integer getNumber() {
        return number;
    }
    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getBus() {
        return bus;
    }
    public void setBus(Integer bus) {
        this.bus = bus;
    }

    public Integer getPostalcode() {
        return postalcode;
    }
    public void setPostalcode(Integer postalcode) {
        this.postalcode = postalcode;
    }

    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }

    // methods
    public void CountFalsePwdInput(){
        wrongPasswordcounter++;
    }
    public void ResetFalsePwdInput(){
        wrongPasswordcounter=0;
    }
}
