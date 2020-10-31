package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.UserType;
import be.thomasmore.graduaten.gameplay.repository.UserTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserTypeServiceImpl implements UserTypeService{
    @Autowired
    UserTypeRepository userTypeRepository;

    @Override
    public List<UserType> getUserTypes() { return userTypeRepository.findAll();}

    @Override
    public UserType getUserTypeById(Long id) { return userTypeRepository.getOne(id);}

    @Override
    public List<UserType> getUserTypeByName(String name) { return userTypeRepository.findByName(name);  }

    @Override
    public UserType addUserType(UserType userType) { return userTypeRepository.save(userType);  }

}