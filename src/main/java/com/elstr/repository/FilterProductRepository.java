package com.elstr.repository;

import com.elstr.entities.product.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.Map;

public interface FilterProductRepository {

    Page<Product> filteringProducts(Map<String, String[]> collect, PageRequest pageRequest);
}
