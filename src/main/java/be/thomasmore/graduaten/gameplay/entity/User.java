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
    private boolean deleted; // this is a soft delete of a user. This is needed for history queries
    private Integer wrongpasswordcounter;

    private String lastname;
    private String firstname;
    private String street;
    private String number;
    private Integer postalcode;
    private String city;

    @ManyToOne
    private UserType userType;

    //constructors

    public User() {
    }

    public User(String email, String password, boolean active, boolean deleted, Integer wrongpasswordcounter, String lastname, String firstname, String street, String number, Integer postalcode, String city, UserType userType) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.active = active;
        this.deleted = deleted;
        this.wrongpasswordcounter = wrongpasswordcounter;
        this.lastname = lastname;
        this.firstname = firstname;
        this.street = street;
        this.number = number;
        this.postalcode = postalcode;
        this.city = city;
        this.userType = userType;
    }
    //Get & Set


    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public UserType getType() {
        return userType;
    }
    public void setType(UserType type) {
        this.userType = type;
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

    public boolean Deleted() {
        return deleted;
    }
    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public Integer getWrongPasswordcounter() {
        return wrongpasswordcounter;
    }
    public void setWrongPasswordcounter(Integer wrongPasswordcounter) {
        this.wrongpasswordcounter = wrongPasswordcounter;
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

    public String getNumber() {
        return number;
    }
    public void setNumber(String number) {
        this.number = number;
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
        wrongpasswordcounter++;
    }
    public void ResetFalsePwdInput(){
        wrongpasswordcounter=0;
    }
}
