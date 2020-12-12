package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.User;

import java.util.List;

public interface UserService {

    List<User> getUsers();
    User getUserById(Long id);

    List<User> getUsersByLastname(String lastname);
    List<User> getUsersByFirstname(String firstname);
    User getUserByEmail(String email);

    List<User> getUsersIsActive(Boolean bool);
    List<User> getUsersByFirstnameLastname(String firstname, String lastname);

    Boolean existsByEmail(String email);
    Boolean addUser(User user);
    Boolean updateUser(User user);


}
