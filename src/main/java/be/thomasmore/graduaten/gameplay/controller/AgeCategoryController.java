package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.AgeCategory;
import be.thomasmore.graduaten.gameplay.service.AgeCategoryService;
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

    private String loadCategory(ModelMap model, AgeCategory ageCategory){

        List<AgeCategory> agecategories = ageCategoryService.getAgeCategories();
        model.addAttribute("ageCategories", agecategories);
        model.addAttribute("ageCategory", ageCategory);
        return "/agecategory/lst";
    }

    @RequestMapping("/agecategory/lst")
    public String dataAgeCategory(ModelMap model) {

        return loadCategory(model,new AgeCategory());
    }

    @PostMapping(value = "/agecategory/add")
    public String editAgeCategory(@Valid @ModelAttribute("ageCategory") AgeCategory ageCategory, BindingResult result, ModelMap model) {

        if (result.hasErrors()) { return loadCategory(model,ageCategory); }
        // als opslagen category gelukt (true) dan successAdd true, anders false
        model.addAttribute("successAdd",ageCategoryService.addAgeCategory(ageCategory)?true:false);
        return loadCategory(model,new AgeCategory());

    }
}

