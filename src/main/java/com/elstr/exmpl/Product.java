package com.elstr.exmpl;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Product {
    private Long id;
    private Long categoryId;
    private Long productTypeId;
    private Long brandId;
    private String name;
    private BigDecimal price;
    private Long count;
    private Object description;
    private Collection<OrdersProducts> ordersProductsById;
    private Category categoryByCategoryId;
    private ProductType productTypeByProductTypeId;
    private Brand brandByBrandId;
    private Collection<ProductImages> productImagesById;
    private Collection<ProductProperties> productPropertiesById;

    @Id
    @Column(name = "ID", nullable = false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "CATEGORY_ID", nullable = false)
    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    @Basic
    @Column(name = "PRODUCT_TYPE_ID", nullable = false)
    public Long getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(Long productTypeId) {
        this.productTypeId = productTypeId;
    }

    @Basic
    @Column(name = "BRAND_ID", nullable = false)
    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    @Basic
    @Column(name = "NAME", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "PRICE", nullable = false, precision = 2)
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Basic
    @Column(name = "COUNT", nullable = false)
    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    @Basic
    @Column(name = "DESCRIPTION", nullable = true, length = -1)
    public Object getDescription() {
        return description;
    }

    public void setDescription(Object description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return Objects.equals(id, product.id) && Objects.equals(categoryId, product.categoryId) && Objects.equals(productTypeId, product.productTypeId) && Objects.equals(brandId, product.brandId) && Objects.equals(name, product.name) && Objects.equals(price, product.price) && Objects.equals(count, product.count) && Objects.equals(description, product.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, categoryId, productTypeId, brandId, name, price, count, description);
    }

    @OneToMany(mappedBy = "productByProductId")
    public Collection<OrdersProducts> getOrdersProductsById() {
        return ordersProductsById;
    }

    public void setOrdersProductsById(Collection<OrdersProducts> ordersProductsById) {
        this.ordersProductsById = ordersProductsById;
    }

    @ManyToOne
    @JoinColumn(name = "CATEGORY_ID", referencedColumnName = "ID", nullable = false)
    public Category getCategoryByCategoryId() {
        return categoryByCategoryId;
    }

    public void setCategoryByCategoryId(Category categoryByCategoryId) {
        this.categoryByCategoryId = categoryByCategoryId;
    }

    @ManyToOne
    @JoinColumn(name = "PRODUCT_TYPE_ID", referencedColumnName = "ID", nullable = false)
    public ProductType getProductTypeByProductTypeId() {
        return productTypeByProductTypeId;
    }

    public void setProductTypeByProductTypeId(ProductType productTypeByProductTypeId) {
        this.productTypeByProductTypeId = productTypeByProductTypeId;
    }

    @ManyToOne
    @JoinColumn(name = "BRAND_ID", referencedColumnName = "ID", nullable = false)
    public Brand getBrandByBrandId() {
        return brandByBrandId;
    }

    public void setBrandByBrandId(Brand brandByBrandId) {
        this.brandByBrandId = brandByBrandId;
    }

    @OneToMany(mappedBy = "productByProductId")
    public Collection<ProductImages> getProductImagesById() {
        return productImagesById;
    }

    public void setProductImagesById(Collection<ProductImages> productImagesById) {
        this.productImagesById = productImagesById;
    }

    @OneToMany(mappedBy = "productByProductId")
    public Collection<ProductProperties> getProductPropertiesById() {
        return productPropertiesById;
    }

    public void setProductPropertiesById(Collection<ProductProperties> productPropertiesById) {
        this.productPropertiesById = productPropertiesById;
    }
}
