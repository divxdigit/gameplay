package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Language;
import be.thomasmore.graduaten.gameplay.entity.Order;
import be.thomasmore.graduaten.gameplay.entity.UserType;

import java.util.List;

public interface UserTypeService {
    List<UserType> getUserTypes();
    List<UserType> getUserTypeByName(String name);
    UserType getUserTypeById(Long id);
    UserType addUserType(UserType language);

}