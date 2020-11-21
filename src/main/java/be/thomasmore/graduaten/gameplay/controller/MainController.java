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
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {

    // BASE
    //-----------------
    @RequestMapping("/")
    public String index() {
        return "index";
    }

    // REGISTRATION
    //-----------------
    @RequestMapping("/users/registration")
    public String registration() {
        return "/users/registration";
    }

    // PRODUCTS
    //-----------------
    @Autowired
    ProductService productService;

    @RequestMapping("/products/lst")
    public String productList(Model model) {
        List<Product> products = productService.getProducts();
        List<Genre> genres = genreService.getGenres();
        model.addAttribute("products", products);
        model.addAttribute("genres", genres);
        return "/products/lst";
    }

    // Method with multiple different parameters:
    // You can have multiple controller methods use the same URI so long as you provide Spring enough additional information on which one it should use.
    // https://stackoverflow.com/questions/34587254/accessing-multiple-controllers-with-same-request-mapping/34590355
    @RequestMapping(value= "/products/search", params = {"id"})
    public String productSearchId(Model model, HttpSession session, @RequestParam("id") Long id) {

        if(id != 0){
            model.addAttribute("productRecord", productService.getProductById(id));
            return "/products/detail";
        }
        return "index";
    }

    @RequestMapping(value= "/products/search", params = {"searchString"})
    public String productSearch(Model model, HttpSession session, @RequestParam("searchString") String searchString) {

        if(searchString != null){
            model.addAttribute("products", productService.getProductByNameContainsIgnoreCase(searchString));
            model.addAttribute("genres", genreService.getGenres());
            return "/products/lst";

        }
        return "index";
    }

    @RequestMapping(value= "/products/search", params = {"genreId"})
    public String genreSearch(Model model, HttpSession session, @RequestParam("genreId") Long genreId) {
        if(genreId >0 ){

            model.addAttribute("products", productService.getProductByGenreId(genreId));
            model.addAttribute("genres", genreService.getGenres());

            return "/products/lst";
        }
        return "index";
    }


    // PUBLISHERS
    //-----------------
    @Autowired
    PublisherService publisherService;

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

    // GENRES
    //-----------------
    @Autowired
    GenreService genreService;

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

    // ADMIN
    //-----------------
    @RequestMapping("/admin")
    public String admin() {
        return "admin";
    }
}

