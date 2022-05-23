package com.elstr.repository;

import com.elstr.dto.PropertiesValueDto;
import com.elstr.entities.product.ProductProperties;
import com.elstr.entities.product.Property;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductPropertiesRepository extends JpaRepository<ProductProperties, Long> {

    @Query(value = "SELECT DISTINCT p.property_value as propertyValue, pr.property_name as propertyName FROM product_properties p JOIN property pr ON p.property_id = pr.id ORDER BY propertyName", nativeQuery = true)
    List<PropertiesValueDto> findAllPropertiesValue();
}
