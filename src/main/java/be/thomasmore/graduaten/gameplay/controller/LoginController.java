package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.Publisher;
import be.thomasmore.graduaten.gameplay.service.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class LoginController {

    //AUTHENTICATION
    @RequestMapping("/login")
    public String login() {
        return "/login";
    }

    @RequestMapping(value="/login", params = "error")
    public String loginError(ModelMap model, @RequestParam("error") String error) {

        model.addAttribute("login_error",error);
        return "/login";
    }

    // ADMIN
    //-----------------
    @RequestMapping("/admin")
    public String admin() {
        return "admin";
    }

}

