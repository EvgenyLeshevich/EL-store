package com.elstr.controllers;

import com.elstr.dto.CaptchaResponseDto;
import com.elstr.entities.address.Address;
import com.elstr.entities.address.City;
import com.elstr.entities.address.Country;
import com.elstr.entities.user.User;
import com.elstr.services.CityService;
import com.elstr.services.CountryService;
import com.elstr.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;

@Controller
public class RegistrationController {
    private final static String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private UserService userService;

    @Autowired
    private CountryService countryService;

    @Autowired
    private CityService cityService;

    @Value("${recaptcha.secret}")
    private String secret;

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/signup")
    public String registration(@ModelAttribute("address") Address address,
                               @ModelAttribute("country") Country country,
                               @ModelAttribute("city") City city,
                               @ModelAttribute("user") User user,
                               Model model) {
        model.addAttribute("countries", countryService.findAll());
        return "signUp";
    }

    @PostMapping("/signup")
    public String addUser(@RequestParam("g-recaptcha-response") String captchaResponse,
                          @ModelAttribute("country") @Valid Country country,
                          BindingResult countryErrors,
                          @ModelAttribute("city") @Valid City city,
                          BindingResult cityErrors,
                          @ModelAttribute("address") @Valid Address address,
                          BindingResult addressErrors,
                          @ModelAttribute("user") @Valid User user,
                          BindingResult userErrors,
                          Model model) {
        model.addAttribute("countries", countryService.findAll());
        String url = String.format(CAPTCHA_URL, secret, captchaResponse);
        CaptchaResponseDto response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

        if (user.getPassword() != null && !user.getPassword().equals(user.getPasswordConfirmation())) {
            model.addAttribute("passwordTwoError", "Passwords are different!");
            return "signUp";
        }
        if (countryErrors.hasErrors() || cityErrors.hasErrors() || addressErrors.hasErrors() || userErrors.hasErrors() /*|| !response.isSuccess()*/) {
            model.addAttribute("captchaError", "Fill captcha");
            return "signUp";
        } else {
            switch (userService.addUser(address, user, country, city)) {
                case "errorUsername":
                    model.addAttribute("message", "Пользователь с таким логином уже существует!");
                    return "signUp";
                case "errorEmail":
                    model.addAttribute("message", "Пользователь с такой почтой уже существует!");
                    return "signUp";
                case "errorUsernameAndEmail":
                    model.addAttribute("message", "Пользователь с таким логином и почтой уже существует!");
                    return "signUp";
                case "additionSuccessful":
                    model.addAttribute("checkEmail", "Регистрация прошла успешно!");
                    break;
            }
            return "signUp";
        }
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Activation code is not found");
        }
        return "login";
    }
}
