package com.elstr.services;

import com.elstr.repository.ProductPropertiesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

    @Autowired
    private ProductPropertiesRepository productPropertiesRepository;

    public void test() {

    }
}
