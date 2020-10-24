package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.User;

import java.util.List;

public interface UserService {
    public List<User> findUsersLastname();
    public List<User> findUsersIsActive();
    public List<User> findUsersFirstLastname();
}
