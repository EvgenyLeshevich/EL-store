package com.elstr.entities.product;

import com.elstr.entities.product.Product;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "product_properties")
public class ProductProperties {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "property_name")
    private String propertyName;
    @Column(name = "property_value")
    private String propertyValue;
    @Column(name = "property_price")
    private BigDecimal propertyPrice;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}
