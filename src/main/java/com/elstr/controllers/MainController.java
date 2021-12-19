package com.elstr.controllers;

import com.elstr.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public String home(HttpSession httpSession,
                       HttpServletResponse response,
                       @CookieValue(value = "data", required = false) String dataCookie,
                       Model model) {
        if (dataCookie==null){
            Cookie cookie = new Cookie("data", httpSession.getId());
            cookie.setPath("/");
            cookie.setMaxAge(86400 * 365);

            response.addCookie(cookie);
            response.setContentType("text/plain");
        }

        model.addAttribute("popularProducts", productService.findPopularProduct());

        return "home";
    }
}
