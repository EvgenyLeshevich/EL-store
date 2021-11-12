package com.elstr.exmpl;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "PRODUCT_IMAGES", schema = "EL_STORE", catalog = "EL_STORE")
public class ProductImages {
    private Long id;
    private Long productId;
    private String image;
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
    @Column(name = "IMAGE", nullable = true, length = 2048)
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductImages that = (ProductImages) o;
        return Objects.equals(id, that.id) && Objects.equals(productId, that.productId) && Objects.equals(image, that.image);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, productId, image);
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
