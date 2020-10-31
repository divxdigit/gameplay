package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Genre;
import be.thomasmore.graduaten.gameplay.entity.Language;
import be.thomasmore.graduaten.gameplay.repository.AgeCategoryRepository;
import be.thomasmore.graduaten.gameplay.repository.GenreRepository;
import be.thomasmore.graduaten.gameplay.repository.LanguageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LanguageServiceImpl implements LanguageService{
    @Autowired
    LanguageRepository languageRepository;

    @Override
    public List<Language> getLanguage() {
        return languageRepository.findAll();
    }

    @Override
    public List<Language> getLanguageByName(String name) {
        return languageRepository.findByName(name);
    }

    @Override
    public Language getLanguageById(Long id) {
        return languageRepository.getOne(id);
    }

    @Override
    public Language addLanguage(Language language) {
        return languageRepository.save(language);
    }
}
