package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.*;
import be.thomasmore.graduaten.gameplay.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
public class RegistrationController {

    // REGISTRATION
    //-----------------

    @Autowired
    UserService userService;

    @RequestMapping("/users/registration")
    public String registration(ModelMap model) {
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("success", true);
        return "/users/registration";
    }

    @PostMapping("/users/registration/submit")
    public String addUser(@Valid @ModelAttribute("user") User user, BindingResult result, ModelMap model) {

        model.addAttribute("emailMessage", null);
        model.addAttribute("success", true);

        if (result.hasErrors()) {
            return "/users/registration";
        }

        if (userService.existsByEmail(user.getEmail()) == true) {

            model.addAttribute("emailMessage", "Het emailadres dat je hebt opgegeven bestaat al.");
            return "/users/registration";
        }

        if (userService.addUser(user) == true) {

            model.addAttribute("registrationSuccess",true);
            return "/login";
        }
        ;

        model.addAttribute("success", false);
        return "/users/registration";
    }

}

