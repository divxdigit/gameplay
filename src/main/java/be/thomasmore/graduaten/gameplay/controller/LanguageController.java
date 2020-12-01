package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.Language;
import be.thomasmore.graduaten.gameplay.service.LanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class LanguageController {


    // LANGUAGES
    //-----------------
    @Autowired
    LanguageService languageService;

    @RequestMapping("/languages/list")
    public String dataGenre(Model model) {
        List<Language> languages = languageService.getLanguages();
        model.addAttribute("languages", languages);
        model.addAttribute("language", new Language());
        return "/languages/list";
    }

    @PostMapping(value = "/languages/add")
    public String EditOrderProduct(@Valid @ModelAttribute("language") Language language, BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            List<Language> languages = languageService.getLanguages();
            model.addAttribute("languages", languages);
            model.addAttribute("language", language);
            return "/languages/list";
        }

        if (languageService.addLanguage(language) == true) {

            model.addAttribute("successAdd", true);
        }
        else{

            model.addAttribute("successAdd", false);
        }

        List<Language> languages = languageService.getLanguages();
        model.addAttribute("languages", languages);
        model.addAttribute("language", new Language());
        return "/languages/list";
    }
}

