package com.elstr.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class MainController {
    @GetMapping("/")
    public String home(HttpSession httpSession,
                       HttpServletResponse response,
                       @CookieValue(value = "data", required = false) String dataCookie) {
        if (dataCookie==null){
            Cookie cookie = new Cookie("data", httpSession.getId());
            cookie.setPath("/");
            cookie.setMaxAge(86400 * 365);

            response.addCookie(cookie);
            response.setContentType("text/plain");
        }
        return "home";
    }
}
