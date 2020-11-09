package be.thomasmore.graduaten.gameplay.controller;



import be.thomasmore.graduaten.gameplay.entity.Genre;
import be.thomasmore.graduaten.gameplay.entity.Product;
import be.thomasmore.graduaten.gameplay.entity.Publisher;
import be.thomasmore.graduaten.gameplay.service.GenreService;
import be.thomasmore.graduaten.gameplay.service.PublisherService;
import be.thomasmore.graduaten.gameplay.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    PublisherService publisherService;

    @Autowired
    GenreService genreService;
    @Autowired
    ProductService productService;

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/products")
    public String productList(Model model) {
        List<Product> products = productService.getProducts();
        model.addAttribute("products", products);
        return "products";
    }
    @RequestMapping(value= "/search")
    public String productSearch(Model model, HttpSession session, @RequestParam("searchString") String searchString) {

        if(searchString != null){
            model.addAttribute("products", productService.getProductByNameContains(searchString));
            return "products";
        }
        return "index";

    }

    @RequestMapping("/publishers")
    public String dataMultiple(Model model) {
        List<Publisher> publishers = publisherService.getPublishers();
        model.addAttribute("publishers", publishers);
        return "publishers";
    }

    @RequestMapping("/contact")
    public String contact() {
        return "contact";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }




    @RequestMapping("/genres")
    public String dataGenre(Model model) {
        List<Genre> genres = genreService.getGenres();
        model.addAttribute("genres", genres);
        return "genres";
    }

    /* Werkt niet */
    @PostMapping("/genres")
    public String postGenre(Model model, HttpServletRequest request) {
        String name = request.getParameter("name");

        model.addAttribute("genre", new Genre(name));
        return "genres";
    }


    @RequestMapping("/admin")
    public String admin() {
        return "admin";
    }
}

