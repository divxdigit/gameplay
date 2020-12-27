package be.thomasmore.graduaten.gameplay.controller;


import be.thomasmore.graduaten.gameplay.entity.Product;
import be.thomasmore.graduaten.gameplay.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//afbeeldingen


@Controller
public class MainController {

    @Autowired
    ProductService productService;

    // BASE
    //-----------------
    @RequestMapping("/")
    public String index(ModelMap model) {

        List<Product> promoProducts = new ArrayList<>();

        promoProducts.add(productService.getProductById((long)1));
        promoProducts.add(productService.getProductById((long)2));
        promoProducts.add(productService.getProductById((long)3));

        model.addAttribute("promoProducts",promoProducts);

        return "index";
    }

    @RequestMapping("/index")
    public String index2(ModelMap model) {
        return index(model);
    }

    @RequestMapping("/contact")
    public String contact() {
        return "contact";
    }

    //https://stackoverflow.com/questions/3705282/spring-mvc-binding-a-date-field
    //put this in your Controller
    //(if you have a superclass for your controllers
    //and want to use the same date format throughout the app, put it there)
    @InitBinder
    private void dateBinder(WebDataBinder binder) {
        //The date format to parse or output your dates
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //Create a new CustomDateEditor
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        //Register it as custom editor for the Date type
        binder.registerCustomEditor(Date.class, editor);
    }
}

