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

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
public class UserController {

    // USERS
    //-----------------

    @Autowired
    UserService userService;

    @Autowired
    UserTypeService userTypeService;

/*    @RequestMapping("/users")
    public String dataUser(Model model) {
        List<User> users = userService.getUsers();
        List<UserType> usertypes = userTypeService.getUserTypes();
        model.addAttribute("users", users);
        model.addAttribute("userTypes", usertypes);
        return "users/users";
    }*/

    @RequestMapping("/users/edit")
    public String dataUser(Model model) {
        List<User> users = userService.getUsers();
        List<UserType> usertypes = userTypeService.getUserTypes();
        User selectedUser = new User();
        model.addAttribute("users", users);
        model.addAttribute("userTypes", usertypes);
        model.addAttribute("selectedUser", selectedUser);
        return "users/edit";
    }

    @RequestMapping(value = "/users/edit", params = {"id"})
    public String UsersEditId(ModelMap model, HttpSession session, @RequestParam("id") Long id) {

        User selectedUser = new User();

        if (id != 0) {
            selectedUser = userService.getUserById(id);
        }

        List<User> users = userService.getUsers();
        model.addAttribute("users", users);
        model.addAttribute("selectedUser", selectedUser);

        return "/users/edit";
    }

    @PostMapping(value = "/users/edit/submit", params = "Save")
    public String EditUser(@Valid @ModelAttribute("selectedUser") User selectedUser, BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            List<User> users = userService.getUsers();
            model.addAttribute("users", users);
            model.addAttribute("successSave", null);
            model.addAttribute("selectedUser", selectedUser);
            return "/users/edit";
        }

        selectedUser.setType(userTypeService.getUserTypeById(selectedUser.getType().getId()));

        if (userService.updateUser(selectedUser) == true) {

            model.addAttribute("successSave", "true");
            model.addAttribute("selectedUser", new User());

        }
        else{

            model.addAttribute("successSave", "false");
            model.addAttribute("selectedUser", selectedUser);
        }

        List<User> users = userService.getUsers();
        model.addAttribute("users", users);

        return "/users/edit";
    }

    @PostMapping(value = "/users/edit/submit", params = "Cancel")
    public String CancelEditUser(ModelMap model) {

        return dataUser((Model) model);
    }

}

