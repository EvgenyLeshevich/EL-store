package com.elstr.exmpl;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;

@Entity
@Table(name = "PRODUCT_PROPERTIES", schema = "EL_STORE", catalog = "EL_STORE")
public class ProductProperties {
    private Long id;
    private Long productId;
    private String propertyName;
    private String propertyValue;
    private BigDecimal propertyPrice;
    private Product productByProductId;

    @Id
    @Column(name = "ID", nullable = false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "PRODUCT_ID", nullable = false)
    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    @Basic
    @Column(name = "PROPERTY_NAME", nullable = false, length = 255)
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    @Basic
    @Column(name = "PROPERTY_VALUE", nullable = false, length = 255)
    public String getPropertyValue() {
        return propertyValue;
    }

    public void setPropertyValue(String propertyValue) {
        this.propertyValue = propertyValue;
    }

    @Basic
    @Column(name = "PROPERTY_PRICE", nullable = false, precision = 2)
    public BigDecimal getPropertyPrice() {
        return propertyPrice;
    }

    public void setPropertyPrice(BigDecimal propertyPrice) {
        this.propertyPrice = propertyPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductProperties that = (ProductProperties) o;
        return Objects.equals(id, that.id) && Objects.equals(productId, that.productId) && Objects.equals(propertyName, that.propertyName) && Objects.equals(propertyValue, that.propertyValue) && Objects.equals(propertyPrice, that.propertyPrice);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, productId, propertyName, propertyValue, propertyPrice);
    }

    @ManyToOne
    @JoinColumn(name = "PRODUCT_ID", referencedColumnName = "ID", nullable = false)
    public Product getProductByProductId() {
        return productByProductId;
    }

    public void setProductByProductId(Product productByProductId) {
        this.productByProductId = productByProductId;
    }
}
