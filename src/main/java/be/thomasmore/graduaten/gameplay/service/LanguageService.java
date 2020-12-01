package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Language;

import java.util.List;

public interface LanguageService {
    List<Language> getLanguages();
    List<Language> getLanguageByName(String name);
    Language getLanguageById(Long id);
    Boolean addLanguage(Language language);
    //Language updateLanguage(Language language);
    //Language deleteLanguage(Language language);
}
