package com.elstr.services.admin;

import com.elstr.entities.product.Product;
import com.elstr.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class AdminService {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> getProducts(int page, int size, String sortBy) {
        PageRequest pageRequest = PageRequest.of(page, size, Sort.by(sortBy));
        List<Product> products = new ArrayList<>();
        Page<Product> allBy = productRepository.findAllBy(pageRequest);
        allBy.forEach(products::add);
        return products;
    }

    @Transactional
    public void updateProducts(Long id, Product product) {
        productRepository.findById(id)
                .map(entity -> {
                            entity.setPrice(product.getPrice());
                            entity.setCount(product.getCount());
                            return true;
                        }
                ).orElse(false);
    }
}
