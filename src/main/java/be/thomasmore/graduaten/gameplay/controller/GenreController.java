package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.*;
import be.thomasmore.graduaten.gameplay.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
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

    private String loadGenre(ModelMap model, Genre genre){

        List<Genre> genres = genreService.getGenres();
        model.addAttribute("genres", genres);
        model.addAttribute("genre", genre);
        return "/genres/list";
    }

    @RequestMapping("/genres/list")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String dataGenre(ModelMap model) {

        return loadGenre(model,new Genre());
    }

    @PostMapping(value = "/genres/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String EditOrderProduct(@Valid @ModelAttribute("genre") Genre genre, BindingResult result, ModelMap model) {

        // als resultaat van input view fouten bevat, dan view terug tonen met weergave fouten
        if (result.hasErrors()) { return loadGenre(model,genre); }
        // als opslagen genre gelukt (true) dan successAdd true, anders false
        model.addAttribute("succesAdd",genreService.addGenre(genre)?true:false);
        return loadGenre(model,new Genre());
    }
}

