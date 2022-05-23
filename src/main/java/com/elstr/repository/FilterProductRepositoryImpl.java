package com.elstr.repository;

import com.elstr.entities.product.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class FilterProductRepositoryImpl implements FilterProductRepository{

    @Autowired
    private EntityManager entityManager;

    @Override
    public Page<Product> filteringProducts(Map<String, String[]> collect, PageRequest pageRequest) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Product> cq = cb.createQuery(Product.class);

        Root<Product> product = cq.from(Product.class);
        List<Predicate> predicates = new ArrayList<>();

        if (collect.containsKey("flash_memory")) {
            List<String> values = Arrays.asList(collect.get("flash_memory"));
            predicates.add(cb.and(product.join("productProperties").get("propertyValue").in(values)));
        }
        if (collect.containsKey("operating_system")) {
            List<String> values = Arrays.asList(collect.get("operating_system"));
            predicates.add(cb.and(product.join("productProperties").get("propertyValue").in(values)));
        }
        if (collect.containsKey("screen_technology")) {
            List<String> values = Arrays.asList(collect.get("screen_technology"));
            predicates.add(cb.and(product.join("productProperties").get("propertyValue").in(values)));
        }
        if (collect.containsKey("processor")) {
            List<String> values = Arrays.asList(collect.get("processor"));
            predicates.add(cb.and(product.join("productProperties").get("propertyValue").in(values)));
        }

        cq.where(predicates.toArray(new Predicate[0]));

        List<Product> resultList = entityManager.createQuery(cq).getResultList();
        final int start = (int) pageRequest.getOffset();
        final int end = Math.min((start + pageRequest.getPageSize()), resultList.size());
        final Page<Product> page = new PageImpl<>(resultList.subList(start, end), pageRequest, resultList.size());

        return page;
    }
}
