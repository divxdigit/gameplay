package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.Genre;
import be.thomasmore.graduaten.gameplay.service.AgeCategoryService;
import be.thomasmore.graduaten.gameplay.service.GenreService;
import be.thomasmore.graduaten.gameplay.service.LanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class LanguageController {


    // LANGUAGES
    //-----------------
    @Autowired
    LanguageService languageService;

}

