package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.AgeCategory;
import be.thomasmore.graduaten.gameplay.entity.Genre;
import be.thomasmore.graduaten.gameplay.service.AgeCategoryService;
import be.thomasmore.graduaten.gameplay.service.LanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
public class AgeCategoryController {

    // AGE CATEGORY
    //-----------------
    @Autowired
    AgeCategoryService ageCategoryService;

    @RequestMapping("/agecategory/lst")
    public String dataAgeCategory(Model model) {
        List<AgeCategory> agecategories = ageCategoryService.getAgeCategories();
        model.addAttribute("ageCategories", agecategories);
        model.addAttribute("ageCategory", new AgeCategory());
        return "/agecategory/lst";
    }

    @PostMapping(value = "/agecategory/add")
    public String EditAgeCategory(@Valid @ModelAttribute("ageCategories") AgeCategory ageCategory, BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            List<AgeCategory> ageCategories = ageCategoryService.getAgeCategories();
            model.addAttribute("ageCategories", ageCategories);
            model.addAttribute("ageCategory", new AgeCategory());
            return "/agecategory/lst";
        }

        if (ageCategoryService.addAgeCategory(ageCategory) == true) {

            model.addAttribute("successAdd", true);
        }
        else{

            model.addAttribute("successAdd", false);
        }

        List<AgeCategory> ageCategories = ageCategoryService.getAgeCategories();
        model.addAttribute("ageCategories", ageCategories);

        model.addAttribute("ageCategory", new AgeCategory());
        return "/agecategory/lst";
    }
}

