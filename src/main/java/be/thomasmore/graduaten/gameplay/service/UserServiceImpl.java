package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.User;
import be.thomasmore.graduaten.gameplay.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserRepository userRepository;

    public List<User> findUsersLastname() {
        return userRepository.findByLastname("Jef");
    }
    public List<User> findUsersIsActive() {
        return userRepository.findByActive(true);
    }
    public List<User> findUsersFirstLastname() {
        return userRepository.findByFirstnameAndLastname("Jef","Peeters");
    }
}