package com.elstr.entities;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class OrdersProductsEntityPK implements Serializable {
    private Long ordersId;
    private Long productId;

    @Column(name = "ORDERS_ID")
    @Id
    public Long getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(Long ordersId) {
        this.ordersId = ordersId;
    }

    @Column(name = "PRODUCT_ID")
    @Id
    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrdersProductsEntityPK that = (OrdersProductsEntityPK) o;
        return Objects.equals(ordersId, that.ordersId) && Objects.equals(productId, that.productId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ordersId, productId);
    }
}
