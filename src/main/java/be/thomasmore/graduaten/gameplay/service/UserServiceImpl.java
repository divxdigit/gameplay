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

    @Override
    public List<User> getUsers() { return userRepository.findAll();}

    @Override
    public User getUserById(Long id) { return userRepository.getOne(id);}

    @Override
    public List<User> getUsersByLastname(String name) { return userRepository.findByLastname(name);  }

    @Override
    public List<User> getUsersByFirstname(String name) { return userRepository.findByFirstname(name);  }

    @Override
    public User getUserByEmail(String email) { return userRepository.findByEmail(email);  }

    @Override
    public List<User> getUsersIsActive(Boolean bool) {
        return userRepository.findByActive(bool);
    }

    @Override
    public List<User> getUsersByFirstnameLastname(String firstname, String lastname) { return userRepository.findByFirstnameAndLastname(firstname, lastname);}

    @Override
    public User addUser(User user) { return userRepository.save(user);  }
}
