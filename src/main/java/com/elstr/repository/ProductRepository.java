package com.elstr.repository;

import com.elstr.entities.product.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, PagingAndSortingRepository<Product, Long>, FilterProductRepository {

    List<Product> findAllByCountLessThan(Long count);

    /*@Query("select p from Product p where p.brand.name like %?1%")
    List<Product> findByBrand_Name(String name);*/

    List<Product> findAllByNumberOfPurchasesIn(List<Long> num);

    Page<Product> findAllByProductProperties_PropertyValueIn(List<String> properties, Pageable pageable);

    Page<Product> findByNameStartingWithIgnoreCaseAndCountGreaterThanOrBrand_NameStartingWithIgnoreCaseAndCountGreaterThan(String name, Long maxCount, String brandName, Long max, Pageable pageable);

    Page<Product> findAllBy(Pageable pageable);
}
