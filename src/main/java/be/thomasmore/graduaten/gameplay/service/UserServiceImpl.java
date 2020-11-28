package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.User;
import be.thomasmore.graduaten.gameplay.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserTypeService userTypeService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    UserRepository userRepository;

    @Override
    public List<User> getUsers() { return userRepository.findAll();}

    @Override
    public User getUserById(Long id) {
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            return user.get();
        }
        else {
            return null;
        }
    }


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
    public Boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    @Override
    public Boolean addUser(User user) {

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setType(userTypeService.getUserTypeById((long)1));
        user.setId(userRepository.findTopByOrderByIdDesc().getId() +1);
        user.setActive(true);
        user.setDeleted(false);
        user.setWrongPasswordcounter(0);
        User insert = userRepository.save(user);

        return userRepository.existsById(user.getId());  }
}
