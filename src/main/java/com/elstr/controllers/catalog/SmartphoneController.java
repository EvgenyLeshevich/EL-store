package com.elstr.controllers.catalog;

import com.elstr.entities.product.Product;
import com.elstr.entities.product.Property;
import com.elstr.entities.user.User;
import com.elstr.repository.OrdersProductsRepository;
import com.elstr.repository.ProductRepository;
import com.elstr.repository.PropertyRepository;
import com.elstr.services.BasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/catalog")
public class SmartphoneController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrdersProductsRepository ordersProductsRepository;

    @Autowired
    private BasketService basketService;

    @Autowired
    private PropertyRepository propertyRepository;

    @GetMapping("/mobile/{page}")
    public String showMobiles(Model model,
                              @AuthenticationPrincipal User activeUser,
                              @CookieValue(value = "data", required = false) String dataCookie,
                              @PathVariable(value = "page", required = false) Integer page,
                              @RequestParam(value = "dir", required = false, defaultValue = "asc") String sortDirection,
                              @RequestParam(value = "sort", required = false, defaultValue = "id") String sortBy,
                              @RequestParam(value = "name", required = false, defaultValue = "") Optional<String> name,
                              @RequestParam(value = "maxCount", defaultValue = "0") Long count,
                              @RequestParam(value = "propertyValue", required = false) List<String> propertiesFilter){
        if(activeUser!=null && !dataCookie.isEmpty()){
            model.addAttribute("listOrderProducts", ordersProductsRepository.findOrdersProductsByDataCookieAndStatusAndActiveUserId(dataCookie, "inBasket", activeUser.getId()));
        } else {
            model.addAttribute("listOrderProducts", ordersProductsRepository.findOrdersProductsByDataCookieAndStatusAndActiveUserId(dataCookie, "inBasket", null));
        }

        Sort sort = null;
        if(sortDirection.equalsIgnoreCase("asc")){
            sort = Sort.by(Sort.Direction.ASC, sortBy);
        } else if(sortDirection.equalsIgnoreCase("desc")){
            sort = Sort.by(Sort.Direction.DESC, sortBy);
        }

        try{
            Page<Product> products = productRepository.findAllByProductProperties_PropertyValueIn(propertiesFilter, PageRequest.of(page,2,sort));
            model.addAttribute("products", products);
        } catch (Exception exception){
            Page<Product> productPage =
                    productRepository.findByNameStartingWithIgnoreCaseAndCountGreaterThanOrBrand_NameStartingWithIgnoreCaseAndCountGreaterThan(
                            name.orElse("_"), count, name.orElse("_"), count, PageRequest.of(page,4,sort));
            model.addAttribute("products", productPage);
        }

        List<Property> properties = propertyRepository.findAll();
        model.addAttribute("properties", properties);

        return "catalog/products";
    }

    @PostMapping("/to_basket")
    public String toBasket(@RequestParam("id") Long productId,
                           @AuthenticationPrincipal User activeUser,
                           @CookieValue(value = "data", required = false) String dataCookie){

        basketService.productToBasket(productId, activeUser, dataCookie);
        return "redirect:/catalog/mobile";
    }

}