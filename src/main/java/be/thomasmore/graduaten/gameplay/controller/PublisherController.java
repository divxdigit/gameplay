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

}

