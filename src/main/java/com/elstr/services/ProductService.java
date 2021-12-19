package com.elstr.services;

import com.elstr.entities.product.Product;
import com.elstr.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List findPopularProduct() {
        List<Product> productList = productRepository.findAll();
        List<Long> prod = new ArrayList<>();
        for (Product product :
                productList) {
            prod.add(product.getNumberOfPurchases());
        }
        List<Long> collect = prod.stream()
                .sorted(Comparator.reverseOrder())
                .limit(3)
                .collect(Collectors.toList());
        return productRepository.findAllByNumberOfPurchasesIn(collect);
    }
}
