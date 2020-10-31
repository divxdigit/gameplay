package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.AgeCategory;
import be.thomasmore.graduaten.gameplay.entity.Language;

import java.util.List;

public interface LanguageService {
    List<Language> getLanguage();
    List<Language> getLanguageByName(String name);
    Language getLanguageById(Long id);
    Language addLanguage(Language language);
    //Language updateLanguage(Language language);
    //Language deleteLanguage(Language language);
}
