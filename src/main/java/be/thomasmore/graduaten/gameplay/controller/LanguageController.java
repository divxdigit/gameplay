package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.Language;
import be.thomasmore.graduaten.gameplay.service.LanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
public class LanguageController {


    // LANGUAGES
    //-----------------
    @Autowired
    LanguageService languageService;

    private String loadLanguage(ModelMap model, Language language){

        List<Language> languages = languageService.getLanguages();
        model.addAttribute("languages", languages);
        model.addAttribute("language",language);
        return "/languages/list";
    }

    @RequestMapping("/languages/list")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String dataGenre(ModelMap model) {

        return loadLanguage(model,new Language());
    }

    @PostMapping(value = "/languages/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String EditOrderProduct(@Valid @ModelAttribute("language") Language language, BindingResult result, ModelMap model) {

        if (result.hasErrors()) { return loadLanguage(model,language); }
        model.addAttribute("successAdd",languageService.addLanguage(language)?true:false);
        return loadLanguage(model,new Language());
    }
}

