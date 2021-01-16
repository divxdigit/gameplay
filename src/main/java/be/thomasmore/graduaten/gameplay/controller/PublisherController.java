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
public class PublisherController {

    // PUBLISHERS
    //-----------------
    @Autowired
    PublisherService publisherService;

    private String loadPublisher(ModelMap model, Publisher publisher){

        List<Publisher> publishers = publisherService.getPublishers();
        model.addAttribute("publishers", publishers);
        model.addAttribute("publisher", publisher);
        return "/publishers/list";
    }

    @RequestMapping("/publishers/list")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String dataGenre(ModelMap model) {

        return loadPublisher(model,new Publisher());
    }

    @PostMapping(value = "/publishers/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String EditOrderProduct(@Valid @ModelAttribute("publisher") Publisher publisher, BindingResult result, ModelMap model) {

        if (result.hasErrors()) { return loadPublisher(model,publisher); }
        model.addAttribute("successAdd",publisherService.addPublisher(publisher)?true:false);
        return loadPublisher(model,new Publisher());

    }

}

