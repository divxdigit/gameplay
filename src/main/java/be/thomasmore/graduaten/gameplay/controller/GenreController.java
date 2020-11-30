package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.*;
import be.thomasmore.graduaten.gameplay.service.*;
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
public class GenreController {

    // GENRES
    //-----------------
    @Autowired
    GenreService genreService;

    @RequestMapping("/genres/list")
    public String dataGenre(Model model) {
        List<Genre> genres = genreService.getGenres();
        model.addAttribute("genres", genres);
        model.addAttribute("genre", new Genre());
        return "/genres/list";
    }

    @PostMapping(value = "/genres/add")
    public String EditOrderProduct(@Valid @ModelAttribute("genre") Genre genre, BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            List<Genre> genres = genreService.getGenres();
            model.addAttribute("genres", genres);
            model.addAttribute("genre", genre);
            return "/genres/list";
        }

        if (genreService.addGenre(genre) == true) {

            model.addAttribute("successAdd", true);
        }
        else{

            model.addAttribute("successAdd", false);
        }

        List<Genre> genres = genreService.getGenres();
        model.addAttribute("genres", genres);
        model.addAttribute("genre", new Genre());
        return "/genres/list";
    }
}

