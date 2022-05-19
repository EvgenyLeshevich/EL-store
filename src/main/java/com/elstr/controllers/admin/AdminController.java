package com.elstr.controllers.admin;

import com.elstr.entities.product.Product;
import com.elstr.services.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/products")
    public String getProducts(Model model){
        model.addAttribute("products", adminService.getProducts(0, 10, "price"));
        return "admin/products";
    }

    @PostMapping("/products/{id}")
    public String updateProducts(@PathVariable("id") Long id,
                                 @ModelAttribute("product") Product product){
        adminService.updateProducts(id, product);
        return "redirect:/admin/products";
    }
}
