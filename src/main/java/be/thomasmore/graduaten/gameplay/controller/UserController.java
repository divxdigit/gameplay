package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.*;
import be.thomasmore.graduaten.gameplay.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {

    // USERS
    //-----------------

    @Autowired
    UserService userService;

    @Autowired
    UserTypeService userTypeService;

    @RequestMapping("/users/edit")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String dataUser(ModelMap model) {
        List<User> users = userService.getUsers();
        List<UserType> usertypes = userTypeService.getUserTypes();
        User selectedUser = new User();
        model.addAttribute("users", users);
        model.addAttribute("userTypes", usertypes);
        model.addAttribute("selectedUser", selectedUser);
        return "users/edit";
    }

    @RequestMapping(value = "/users/edit", params = {"id"})
    @PreAuthorize("hasAuthority('ADMIN')")
    public String UsersEditId(ModelMap model, @RequestParam("id") Long id) {

        User selectedUser = new User();

        if (id != 0) {
            selectedUser = userService.getUserById(id);
        }

        List<User> users = userService.getUsers();
        List<UserType> usertypes = userTypeService.getUserTypes();
        model.addAttribute("users", users);
        model.addAttribute("selectedUser", selectedUser);
        model.addAttribute("userTypes", usertypes);

        return "/users/edit";
    }

    @PostMapping(value = "/users/edit/submit", params = "Save")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String EditUser(@Valid @ModelAttribute("selectedUser") User selectedUser, BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            List<User> users = userService.getUsers();
            List<UserType> usertypes = userTypeService.getUserTypes();
            model.addAttribute("users", users);
            model.addAttribute("successSave", null);
            model.addAttribute("selectedUser", selectedUser);
            model.addAttribute("userTypes", usertypes);
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

        List<UserType> usertypes = userTypeService.getUserTypes();
        List<User> users = userService.getUsers();
        model.addAttribute("users", users);
        model.addAttribute("userTypes", usertypes);

        return "/users/edit";
    }

    @PostMapping(value = "/users/edit/submit", params = "Cancel")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String CancelEditUser(ModelMap model) {

        return dataUser(model);
    }

    @RequestMapping("/users/my-account")
    public String myAccount(ModelMap model) {
        User user;

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);
            model.addAttribute("myUser",user);
            return "/users/my-account";
        }

        return "/error/404";
    }

    @PostMapping(value = "/users/my-account/submit", params = "Save")
    public String editMyUser(@Valid @ModelAttribute("myUser") User myUser, BindingResult result,ModelMap model) {

        if (result.hasErrors()) {
            model.addAttribute("successSave", null);
            model.addAttribute("myUser", myUser);
            return "/users/my-account";
        }

        myUser.setType(userService.getUserById(myUser.getId()).getUserType());

        if(userService.updateUser(myUser)){
            model.addAttribute("successSave", true);
            User user = userService.getUserById(myUser.getId());
            model.addAttribute("myUser",user);
        }
        else{
            model.addAttribute("successSave", false);
            model.addAttribute("myUser", myUser);
        }

        return "/users/my-account";
    }

    @PostMapping(value = "/users/my-account/changepwd", params = "Save")
    public String changePwdMyUser(ModelMap model,@RequestParam("currentPwd") String currentPwd,@RequestParam("newPwd") String newPwd,@RequestParam("repeatPwd") String repeatPwd,@RequestParam("userID") Long userID) {

        User myUser = userService.getUserById(userID);

        if(userService.checkUserPwd(myUser,currentPwd)){

            if(newPwd.equals("")){
                model.addAttribute("successChangePwd", false);
                model.addAttribute("errorMessage", "Nieuw wachtwoord mag niet leeg zijn");
            }
            else{

                if(newPwd.equals(repeatPwd)){
                    myUser.setType(userService.getUserById(myUser.getId()).getUserType());
                    if(userService.changeUserPwd(myUser,newPwd)){
                        model.addAttribute("successChangePwd", true);
                        model.addAttribute("errorMessage", "");
                    }
                    else{
                        model.addAttribute("successChangePwd", false);
                        model.addAttribute("errorMessage", "Er is iets misgelopen met het updaten van de database.");
                    }
                }

                else{
                    model.addAttribute("successChangePwd", false);
                    model.addAttribute("errorMessage", "Je nieuwe wachtwoord en het te herhalen wachtwoord komt niet overeen");
                }
            }
        }
        else{
            model.addAttribute("successChangePwd", false);
            model.addAttribute("errorMessage", "Het ingegeven huidige wachtwoord komt niet overeen met je werkelijke wachtwoord");
        }

        myUser = userService.getUserById(myUser.getId());
        model.addAttribute("myUser",myUser);
        return "/users/my-account";
    }

}

