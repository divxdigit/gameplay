package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.AgeCategory;
import be.thomasmore.graduaten.gameplay.entity.Publisher;
import be.thomasmore.graduaten.gameplay.repository.AgeCategoryRepository;
import be.thomasmore.graduaten.gameplay.repository.PublisherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AgeCategoryServiceImpl implements AgeCategoryService {
    @Autowired
    AgeCategoryRepository ageCategoryRepository;

    @Override
    public List<AgeCategory> getAgeCategories() {
        return ageCategoryRepository.findAll() ;
    }

    @Override
    public AgeCategory addAgeCategory(AgeCategory ageCategory) {
        return ageCategoryRepository.save(ageCategory);
    }

    @Override
    public List<AgeCategory> getAgeCategoryByName(String name) {
        return ageCategoryRepository.findByName(name);
    }

    @Override
    public AgeCategory getAgeCategoryById(Long id) {
        return ageCategoryRepository.getOne(id);
    }
}