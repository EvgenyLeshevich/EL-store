package com.elstr.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PagesInDevelopmentController {

    @GetMapping("/page-in-development")
    public String pageInDevelopment() {
        return "pageInDevelopment";
    }
}
