package com.elstr.controllers.catalog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CatalogController {

    @GetMapping("/catalog")
    public String showCatalog() {
        return "catalog/catalogPage";
    }
}
