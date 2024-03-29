package com.elstr.controllers;

import com.elstr.dto.UserDto;
import com.elstr.entities.user.User;
import com.elstr.exceptions.UserAlreadyExistException;
import com.elstr.exceptions.UserPasswordException;
import com.elstr.mappers.UserMapper;
import com.elstr.services.CountryService;
import com.elstr.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Controller
public class UsersController {

    @Autowired
    private UserService userService;

    @Autowired
    private CountryService countryService;

    @GetMapping("/users")
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());
        return "admin/users";
    }

    @GetMapping("/profile")
    public String profile(@AuthenticationPrincipal User user,
                          Model model) {
        UserDto userDto = UserMapper.INSTANCE.toDto(user);
        model.addAttribute("user", userDto);
        model.addAttribute("countries", countryService.findAll());
        return "user/profile";
    }

    @PostMapping("/profile")
    public String editProfileGeneralInfo(@AuthenticationPrincipal User userSession,
                                         @ModelAttribute("user") @Valid UserDto userDto,
                                         BindingResult userErrors,
                                         Model model) {
        try {
            model.addAttribute("countries", countryService.findAll());
            if (userErrors.hasErrors()) {
                return "user/profile";
            }
            userService.updateProfileGeneralInfo(userSession, userDto);

            return "user/userUpdateSuccessful";
        } catch (UserAlreadyExistException e) {
            System.out.println(e.getMessage());
            return "redirect:/profile";
        } catch (Exception e) {
            return "redirect:/profile";
        }
    }

    @GetMapping("/profile/security")
    public String profileSecurity() {
        return "user/profileSecurity";
    }

    @PostMapping("/profile/security")
    public String editProfilePassword(@AuthenticationPrincipal User userSession,
                                      @RequestParam("oldPassword") String oldPassword,
                                      @RequestParam("newPassword") String newPassword,
                                      Model model) {

        try {
            userService.updateProfilePassword(userSession, oldPassword, newPassword);
            model.addAttribute("updateSuccessful", "Обновление прошло успешно");
            return "user/userUpdateSuccessful";
        } catch (UserPasswordException e) {
            if (e.getMessage().equalsIgnoreCase("Введенный пароль не совпадает с вашим!")) {
                model.addAttribute("errorPasswordMismatch", e.getMessage());
            }
            if (e.getMessage().equalsIgnoreCase("Данное поле не может быть пустым!")) {
                model.addAttribute("nullNewPassword", e.getMessage());
            }
            return "user/profileSecurity";
        } catch (Exception e) {
            return "redirect:/profile/security";
        }
    }
}
