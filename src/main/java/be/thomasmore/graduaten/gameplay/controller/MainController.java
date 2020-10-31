package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.Publisher;
import be.thomasmore.graduaten.gameplay.service.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    PublisherService publisherService;

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/publishers")
    public String dataMultiple(Model model) {
        List<Publisher> publishers = publisherService.getPublishers();
        model.addAttribute("publishers", publishers);
        return "publishers";
    }
}
