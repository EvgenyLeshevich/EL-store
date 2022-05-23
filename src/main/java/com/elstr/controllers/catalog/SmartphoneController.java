package com.elstr.controllers.catalog;

import com.elstr.dto.PropertiesValueDto;
import com.elstr.entities.product.Product;
import com.elstr.entities.user.User;
import com.elstr.repository.OrdersProductsRepository;
import com.elstr.repository.ProductPropertiesRepository;
import com.elstr.repository.ProductRepository;
import com.elstr.repository.PropertyRepository;
import com.elstr.services.BasketService;
import com.elstr.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

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
    private ProductPropertiesRepository propertiesValueRepository;

    @Autowired
    private ProductService productService;

    @GetMapping("/mobile/{page}")
    public String showMobiles(Model model,
                              @AuthenticationPrincipal User activeUser,
                              @CookieValue(value = "data", required = false) String dataCookie,
                              @PathVariable(value = "page", required = false) Integer page,
                              @RequestParam(value = "dir", required = false, defaultValue = "asc") String sortDirection,
                              @RequestParam(value = "sort", required = false, defaultValue = "id") String sortBy,
                              @RequestParam(value = "name", required = false, defaultValue = "") Optional<String> name,
                              @RequestParam(value = "maxCount", defaultValue = "0") Long count,
                              HttpServletRequest httpServletRequest) {
        Map<String, String[]> collect = Collections
                .list(httpServletRequest.getParameterNames())
                .stream().collect(Collectors.toMap(parameterName -> parameterName, httpServletRequest::getParameterValues));

        if (activeUser != null && !dataCookie.isEmpty()) {
            model.addAttribute("listOrderProducts", ordersProductsRepository.findOrdersProductsByDataCookieAndStatusAndActiveUserId(dataCookie, "inBasket", activeUser.getId()));
        } else {
            model.addAttribute("listOrderProducts", ordersProductsRepository.findOrdersProductsByDataCookieAndStatusAndActiveUserId(dataCookie, "inBasket", null));
        }

        Sort sort = null;
        if (sortDirection.equalsIgnoreCase("asc")) {
            sort = Sort.by(Sort.Direction.ASC, sortBy);
        } else if (sortDirection.equalsIgnoreCase("desc")) {
            sort = Sort.by(Sort.Direction.DESC, sortBy);
        }

        if (collect.containsKey("sort") && collect.containsKey("dir") && collect.size() == 2) {
            Page<Product> productPage =
                    productRepository.findByNameStartingWithIgnoreCaseAndCountGreaterThanOrBrand_NameStartingWithIgnoreCaseAndCountGreaterThan(
                            name.orElse("_"), count, name.orElse("_"), count, PageRequest.of(page, 4, sort));
            model.addAttribute("products", productPage);
        } else {
            Page<Product> products = productService.filteringProducts(collect, PageRequest.of(page, 5, sort));
            model.addAttribute("products", products);
            if (products.getContent().size() == 0) {
                model.addAttribute("productsNotFound", "productsNotFound");
            }
        }

        List<PropertiesValueDto> propertiesValue = propertiesValueRepository.findAllPropertiesValue();
        model.addAttribute("propValues", propertiesValue);

        return "catalog/products";
    }

    @PostMapping("/to_basket")
    public String toBasket(@RequestParam("id") Long productId,
                           @AuthenticationPrincipal User activeUser,
                           @CookieValue(value = "data", required = false) String dataCookie) {

        basketService.productToBasket(productId, activeUser, dataCookie);
        return "redirect:/catalog/mobile";
    }

}