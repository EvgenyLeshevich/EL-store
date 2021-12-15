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
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/users/{id}")
    public String userEdit(@PathVariable("id") Long id, Model model) {
        if (userService.findById(id).isPresent()) {
            model.addAttribute("user", userService.findById(id));
            return "admin/userEdit";
        } else {
            model.addAttribute("error", "Пользователь с таким id не найден!");
            return "errorPage";
        }
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
            System.out.println(e.getMessage()); // Сделать логирование!!!
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

        try{
            userService.updateProfilePassword(userSession, oldPassword, newPassword);
            model.addAttribute("updateSuccessful", "Обновление прошло успешно");
            return "user/userUpdateSuccessful";
        } catch (UserPasswordException e){
            if (e.getMessage().equalsIgnoreCase("Введенный пароль не совпадает с вашим!")){
                model.addAttribute("errorPasswordMismatch", e.getMessage());
            }
            if (e.getMessage().equalsIgnoreCase("Данное поле не может быть пустым!")){
                model.addAttribute("nullNewPassword", e.getMessage());
            }
            return "user/profileSecurity";
        } catch (Exception e){
            return "redirect:/profile/security";
        }
    }

    /*@PostMapping("/profile/security")
    public String editProfilePassword(@AuthenticationPrincipal User userSession,
                                      @RequestParam("oldPassword") String oldPassword,
                                      @RequestParam("newPassword") String newPassword,
                                      Model model) {

        String result = null;
        switch (userService.updateProfilePassword(userSession, oldPassword, newPassword)){
            case "updatePasswordSuccessful":
                result = "user/userUpdateSuccessful";
                break;
            case "errorPasswordMismatch":
                model.addAttribute("errorPasswordMismatch", "Введенный пароль не совпадает с вашим!");
                result = "user/profileSecurity";
                break;
            case "errorNullNewPassword":
                model.addAttribute("nullNewPassword", "Данное поле не может быть пустым!");
                result = "user/profileSecurity";
                break;
        }
        return result;
    }*/

    /*@PostMapping("/profile")
    public String editProfile(@AuthenticationPrincipal User userSession,
                              @RequestParam("oldPassword") String oldPassword,
                              @RequestParam("newPassword") String newPassword,
                              @ModelAttribute("country") @Valid Country country,
                              BindingResult countryErrors,
                              @ModelAttribute("city") @Valid City city,
                              BindingResult cityErrors,
                              @ModelAttribute("address") @Valid Address address,
                              BindingResult addressErrors,
                              @ModelAttribute("user") @Valid User user,
                              BindingResult userErrors,
                              Model model) {




        switch (userService.updateProfile(userSession, oldPassword, newPassword, country, city, address, user)) {
            case "errorPasswordMismatch":
                model.addAttribute("errorPasswordMismatch", "Введенный пароль не совпадает с вашим!");
                return "user/profile";
            case "nullNewPassword":
                model.addAttribute("nullNewPassword", "Данное поле не может быть пустым!");
                return "user/profile";
            case "updateSuccessful":
                model.addAttribute("updateSuccessful", "Обновление прошло успешно");
                break;
        }
        return "user/userUpdateSuccessful";
    }*/


}
