package be.thomasmore.graduaten.gameplay.controller;

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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Controller
public class PublisherController {

    // PUBLISHERS
    //-----------------
    @Autowired
    PublisherService publisherService;

    @RequestMapping("/publishers/list")
    public String dataGenre(Model model) {
        List<Publisher> publishers = publisherService.getPublishers();
        model.addAttribute("publishers", publishers);
        model.addAttribute("publisher", new Publisher());
        return "/publishers/list";
    }

    @PostMapping(value = "/publishers/add")
    public String EditOrderProduct(@Valid @ModelAttribute("publisher") Publisher publisher, BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            List<Publisher> publishers = publisherService.getPublishers();
            model.addAttribute("publishers", publishers);
            model.addAttribute("publisher", publisher);
            return "/publishers/list";
        }

        if (publisherService.addPublisher(publisher) == true) {

            model.addAttribute("successAdd", true);
        }
        else{

            model.addAttribute("successAdd", false);
        }

        List<Publisher> publishers = publisherService.getPublishers();
        model.addAttribute("publishers", publishers);
        model.addAttribute("publisher", new Publisher());
        return "/publishers/list";
    }

}

