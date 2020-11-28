package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.service.AgeCategoryService;
import be.thomasmore.graduaten.gameplay.service.LanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class AgeCategoryController {

    // AGE CATEGORY
    //-----------------
    @Autowired
    AgeCategoryService ageCategoryService;

}

