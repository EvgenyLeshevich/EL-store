package com.elstr.repository;

import com.elstr.entities.product.ProductProperties;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductPropertiesRepository extends JpaRepository<ProductProperties, Long> {

}
