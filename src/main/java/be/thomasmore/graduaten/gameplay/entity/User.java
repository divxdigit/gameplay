package be.thomasmore.graduaten.gameplay.entity;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;

@Entity
@Table(name = "Users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message="Veld mag niet leeg zijn.")
    @Email(message ="Email moet geldig zijn.")
    private String email;

    @NotBlank(message ="Wachtwoord is een verplicht veld.")
    @Size(min=5, message ="Wachtwoord moet min. 5 karakters hebben.")
    private String password;

    private boolean active;  // flag: user is not active after # amount false password input
    private boolean deleted; // this is a soft delete of a user. This is needed for history queries
    private Integer wrongpasswordcounter;

    @NotBlank(message="Achternaam mag niet leeg zijn.")
    private String lastname;

    @NotBlank(message="Voornaam mag niet leeg zijn.")
    private String firstname;

    @NotNull(message="Geboortedatum mag niet leeg zijn.")
    @Past(message="Uw geboortedatum kan geen toekomstige datum zijn.")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthdate;

    @NotBlank(message="Straat mag niet leeg zijn.")
    private String street;

    @NotBlank(message="Huisnummer mag niet leeg zijn.")
    private String number;

    @NotNull(message="Postcode mag niet leeg zijn.")
    @Range(min=1000,max=9999,message="Postcode betreft een waarde tussen 1000-9999 in België.")
    private Integer postalcode;

    @NotBlank(message="Gemeente mag niet leeg zijn.")
    private String city;

    @ManyToOne
    private UserType userType;

    //constructors

    public User() {
    }

    public User(String email, String password, boolean active, boolean deleted, Integer wrongpasswordcounter, String lastname, String firstname,LocalDate birthdate, String street, String number, Integer postalcode, String city, UserType userType) {
        this.email = email;
        this.password = password;
        this.active = active;
        this.deleted = deleted;
        this.wrongpasswordcounter = wrongpasswordcounter;
        this.lastname = lastname;
        this.firstname = firstname;
        this.birthdate = birthdate;
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

    public LocalDate getBirthdate() {
        return birthdate;
    }
    public void setBirthdate(LocalDate birthdate) {
        this.birthdate = birthdate;
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
