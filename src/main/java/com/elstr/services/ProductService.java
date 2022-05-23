package com.elstr.services;

import com.elstr.entities.product.Product;
import com.elstr.repository.FilterProductRepository;
import com.elstr.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.*;

import static java.util.stream.Collectors.toList;

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
                .collect(toList());
        return productRepository.findAllByNumberOfPurchasesIn(collect);
    }

    public Page<Product> filteringProducts(Map<String, String[]> collect, PageRequest pageRequest) {

        return productRepository.filteringProducts(collect, pageRequest);
    }
}

