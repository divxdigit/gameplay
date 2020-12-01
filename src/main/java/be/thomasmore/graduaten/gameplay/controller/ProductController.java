package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.config.FileUploadUtil;
import be.thomasmore.graduaten.gameplay.entity.*;
import be.thomasmore.graduaten.gameplay.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;


//afbeeldingen
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {

    // PRODUCTS
    //-----------------
    @Autowired
    ProductService productService;
    @Autowired
    GenreService genreService;
    @Autowired
    UserService userService;
    @Autowired
    LanguageService languageService;
    @Autowired
    AgeCategoryService ageCategoryService;
    @Autowired
    PublisherService publisherService;

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
    @RequestMapping(value = "/products/search", params = {"id"})
    public String productSearchId(Model model, HttpSession session, @RequestParam("id") Long id) {

        if (id != 0) {
            model.addAttribute("productRecord", productService.getProductById(id));
            return "/products/detail";
        }
        return "index";
    }

    @RequestMapping(value = "/products/search", params = {"searchString"})
    public String productSearch(Model model, HttpSession session, @RequestParam("searchString") String searchString) {

        if (searchString != null) {
            model.addAttribute("products", productService.getProductByNameContainsIgnoreCase(searchString));
            model.addAttribute("genres", genreService.getGenres());
            return "/products/lst";

        }
        return "index";
    }

    @RequestMapping(value = "/products/search", params = {"genreId"})
    public String genreSearch(Model model, HttpSession session, @RequestParam("genreId") Long genreId) {
        if (genreId > 0) {

            model.addAttribute("products", productService.getProductByGenreId(genreId));
            model.addAttribute("genres", genreService.getGenres());

            return "/products/lst";
        }
        return "index";
    }

    @RequestMapping(value = "/products/buy", params = {"id"})
    public String productBuyId(Model model, HttpSession session, @RequestParam("id") Long id) {

        User user = new User();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);
        }

        if (id != 0) {
            model.addAttribute("productRecord", productService.getProductById(id));
            model.addAttribute("userRecord", user);
            return "/products/buy";
        }
        return "index";
    }

    @RequestMapping(value = "/products/rent", params = {"id"})
    public String productRentId(Model model, HttpSession session, @RequestParam("id") Long id) {

        User user = new User();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);
        }

        if (id != 0) {
            model.addAttribute("productRecord", productService.getProductById(id));
            model.addAttribute("userRecord", user);
            return "/products/rent";
        }

        return "index";
    }

    @RequestMapping("/products/create")
    public String productCreate(Model model) {
        List<Product> products = productService.getProducts();
        List<Genre> genres = genreService.getGenres();
        List<Language> languages = languageService.getLanguage();
        List<AgeCategory> ageCategories = ageCategoryService.getAgeCategories();
        List<Publisher> publishers = publisherService.getPublishers();
        model.addAttribute("products", products);
        model.addAttribute("genres", genres);
        model.addAttribute("languages", languages);
        model.addAttribute("ageCategories", ageCategories);
        model.addAttribute("publishers", publishers);
        int x = 0;
        return "/products/create";
    }

    @RequestMapping(value = "/products/edit", params = {"id"})
    public String productEdit(Model model, HttpSession session, @RequestParam("id") Long id) {

        if (id != 0) {
            List<Genre> genres = genreService.getGenres();
            List<Language> languages = languageService.getLanguage();
            List<AgeCategory> ageCategories = ageCategoryService.getAgeCategories();
            List<Publisher> publishers = publisherService.getPublishers();
            model.addAttribute("productRecord", productService.getProductById(id));
            model.addAttribute("genres", genres);
            model.addAttribute("languages", languages);
            model.addAttribute("ageCategories", ageCategories);
            model.addAttribute("publishers", publishers);
            return "/products/edit";
        }
        return "index";
    }



    private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    private Date date;



    @PostMapping("/products/do-create")
    public String addProduct(Model model, HttpServletRequest request, @RequestParam("image") MultipartFile multipartFile) throws IOException {
    //public String addProduct(Model model, HttpServletRequest request) {
        Product product = new Product();
        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setGenre(genreService.getGenreById(Long.parseLong(request.getParameter("genreId"))));
        product.setAgeCategory(ageCategoryService.getAgeCategoryById(Long.parseLong(request.getParameter("ageCategoryId"))));
        product.setPublisher(publisherService.getPublisherById(Long.parseLong(request.getParameter("publisherId"))));
        product.setLanguage(languageService.getLanguageById(Long.parseLong(request.getParameter("languageId"))));
        product.setPlayersMinimum(Integer.parseInt(request.getParameter("playersMinimum")));
        product.setPlayersMaximum(Integer.parseInt(request.getParameter("playersMaximum")));
        product.setRentStock(Integer.parseInt(request.getParameter("rentStock")));
        product.setRentPrice(Double.parseDouble(request.getParameter("rentPrice")));
        product.setBuyStock(Integer.parseInt(request.getParameter("buyStock")));
        product.setBuyPrice(Double.parseDouble(request.getParameter("buyPrice")));
        //product.setPicture(request.getParameter("picture"));

        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        product.setPicture("/images/GameImages/" + fileName);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dateLaunch = LocalDate.parse(request.getParameter("dateLaunch"), formatter);
        product.setDateLaunch(dateLaunch);

        productService.addProduct(product);

        String uploadDir = "target/classes/static/images/GameImages";
        FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);

        List<Product> products = productService.getProducts();
        List<Genre> genres = genreService.getGenres();
        model.addAttribute("products", products);
        model.addAttribute("genres", genres);
        return "/products/lst";
    }
    @PostMapping("/products/do-update")
    public String editProduct(Model model, HttpServletRequest request, @RequestParam("productid") Long productid) throws IOException {
        //public String addProduct(Model model, HttpServletRequest request) {
        Product product = productService.getProductById(productid);
        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setGenre(genreService.getGenreById(Long.parseLong(request.getParameter("genreId"))));
        product.setAgeCategory(ageCategoryService.getAgeCategoryById(Long.parseLong(request.getParameter("ageCategoryId"))));
        product.setPublisher(publisherService.getPublisherById(Long.parseLong(request.getParameter("publisherId"))));
        product.setLanguage(languageService.getLanguageById(Long.parseLong(request.getParameter("languageId"))));
        product.setPlayersMinimum(Integer.parseInt(request.getParameter("playersMinimum")));
        product.setPlayersMaximum(Integer.parseInt(request.getParameter("playersMaximum")));
        product.setRentStock(Integer.parseInt(request.getParameter("rentStock")));
        product.setRentPrice(Double.parseDouble(request.getParameter("rentPrice")));
        product.setBuyStock(Integer.parseInt(request.getParameter("buyStock")));
        product.setBuyPrice(Double.parseDouble(request.getParameter("buyPrice")));
        //product.setPicture(request.getParameter("picture"));

        /*String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());*/
        /*product.setPicture("/images/GameImages/" + fileName);*/

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dateLaunch = LocalDate.parse(request.getParameter("dateLaunch"), formatter);
        product.setDateLaunch(dateLaunch);

        productService.addProduct(product);
        //productService.updateProduct(product);

        /*String uploadDir = "target/classes/static/images/GameImages";
        FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);*/

        List<Product> products = productService.getProducts();
        List<Genre> genres = genreService.getGenres();
        model.addAttribute("products", products);
        model.addAttribute("genres", genres);
        return "/products/lst";
    }
}



