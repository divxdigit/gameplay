package be.thomasmore.graduaten.gameplay.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Usertypes")
public class UserType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;


    public UserType() {
    }
    public UserType(String name, String description) {
        this.name = name;
      //  this.users = users;
        this.description = description;
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
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return name;
    }
}
