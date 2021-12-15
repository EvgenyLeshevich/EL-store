package com.elstr.controllers;

import com.elstr.dto.UserDto;
import com.elstr.entities.user.User;
import com.elstr.repository.OrdersProductsRepository;
import com.elstr.repository.ProductRepository;
import com.elstr.services.BasketService;
import com.elstr.services.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/order")
/*@Validated*/
public class BasketController {

    @Autowired
    private BasketService basketService;

    @Autowired
    private OrdersProductsRepository ordersProductsRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CountryService countryService;

    @GetMapping
    public String basket(Model model,
                         @AuthenticationPrincipal User activeUser,
                         @ModelAttribute("user") UserDto user,
                         @CookieValue(value = "data", required = false) String dataCookie) {

        model.addAttribute("countries", countryService.findAll());
        if (activeUser != null) {
            model.addAttribute("products", ordersProductsRepository.findOrdersProductsByActiveUserIdAndStatus(activeUser.getId(), "inBasket"));
            if (ordersProductsRepository.findAllByActiveUserIdAndOrders_Id(activeUser.getId(), null).isEmpty()) {
                return "error/basketIsEmpty";
            }
        } else {
            model.addAttribute("products", ordersProductsRepository.findOrdersProductsByDataCookieAndStatusAndActiveUserId(dataCookie, "inBasket", null));
            if (ordersProductsRepository.findAllByActiveUserIdAndDataCookieAndOrders_Id(null, dataCookie, null).isEmpty()) {
                return "error/basketIsEmpty";
            }
        }

        return "basket/basket";
    }

    @PostMapping("/product-save")
    public String productSave(@ModelAttribute("user") @Valid UserDto user,
                              BindingResult bindingResult,
            /*@ModelAttribute("orders") Orders orders,*/
                              @RequestParam(value = "count", required = false) List<Long> count,
                              @RequestParam(value = "price", required = false) List<BigDecimal> price,
                              @AuthenticationPrincipal User activeUser,
                              @CookieValue(value = "data", required = false) String dataCookie,
            /*@RequestParam(value = "productCount", required = false) @NotEmpty(message = "Корзина пустая!") @NotNull (message = "not null") List<Long> productCount,*/
                              Model model) {

        model.addAttribute("countries", countryService.findAll());
        if (activeUser != null) {
            model.addAttribute("products", ordersProductsRepository.findOrdersProductsByActiveUserIdAndStatus(activeUser.getId(), "inBasket"));
        } else {
            model.addAttribute("products", ordersProductsRepository.findOrdersProductsByDataCookieAndStatusAndActiveUserId(dataCookie, "inBasket", null));
        }

        if (bindingResult.hasErrors()) {
            return "basket/basket";
        }
//        List<Product> productList = productRepository.findAllByCountLessThan(1L);
//        if(productList.stream().allMatch(product -> product.getCount()<1)){
//            productList.forEach(product -> ordersProductsRepository.deleteAllByProduct_Id(product.getId()));
//            model.addAttribute("errorText", "Некоторых товаров больше нет в наличии. Содержимое корзины изменилось");
//            return "error/errorProductInBasket";
//        }
//        for (Product product :
//                productList) {
//            if(product.getCount()<1){
//                System.out.println("нафиг зашёл");
//                ordersProductsRepository.deleteAllByProduct_Id(product.getId());
//                model.addAttribute("errorText", "Некоторых товаров больше нет в наличии. Содержимое корзины изменилось");
//                return "error/errorProductInBasket";
//            }
//        }
        try {
            basketService.saveOrder(user, dataCookie, activeUser, count, price);
        } catch (Exception ex) {
            basketService.deleteOrderWithProductCountZero(dataCookie);
            model.addAttribute("errorText", "Некоторых товаров больше нет в наличии. Содержимое корзины изменилось");
            return "error/errorProductInBasket";
        }

        return "basket/orderSuccessful";
    }

    /*@ExceptionHandler(ConstraintViolationException.class)
    public String handleConstraint(ConstraintViolationException ex,
                                   Model model) {
        if(ex.)
        System.out.println(ex.getLocalizedMessage());
        model.addAttribute("errorText" ,ex.getLocalizedMessage());
        return "error/errorProductInBasket";
    }*/

    @GetMapping("{id}")
    public String deleteProduct(@PathVariable Long id) {

        ordersProductsRepository.deleteById(id);

        return "redirect:/order";
    }
}
