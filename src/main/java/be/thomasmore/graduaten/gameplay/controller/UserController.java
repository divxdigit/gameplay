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
public class UserController {

    // USERS
    //-----------------

    @Autowired
    UserService userService;

    @Autowired
    UserTypeService userTypeService;

    @RequestMapping("/users")
    public String dataUser(Model model) {
        List<User> users = userService.getUsers();
        List<UserType> usertypes = userTypeService.getUserTypes();
        model.addAttribute("users", users);
        model.addAttribute("userTypes", usertypes);
        return "users/users";
    }

}

