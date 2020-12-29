package be.thomasmore.graduaten.gameplay.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}

