package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.AgeCategory;
import be.thomasmore.graduaten.gameplay.entity.Publisher;

import java.util.List;

public interface AgeCategoryService {
    List<AgeCategory> getAgeCategory();
    List<AgeCategory> getAgeCategoryByName(String name);
    AgeCategory getAgeCategoryById(Long id);
    AgeCategory addAgeCategory(AgeCategory ageCategory);
}
