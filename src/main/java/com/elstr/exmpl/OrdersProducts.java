package com.elstr.exmpl;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;

@Entity
@Table(name = "ORDERS_PRODUCTS", schema = "EL_STORE", catalog = "EL_STORE")
@IdClass(OrdersProductsPK.class)
public class OrdersProducts {
    private Long ordersId;
    private Long productId;
    private Long count;
    private BigDecimal orderSum;
    private Orders ordersByOrdersId;
    private Product productByProductId;

    @Id
    @Column(name = "ORDERS_ID", nullable = false)
    public Long getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(Long ordersId) {
        this.ordersId = ordersId;
    }

    @Id
    @Column(name = "PRODUCT_ID", nullable = false)
    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
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
    @Column(name = "ORDER_SUM", nullable = false, precision = 2)
    public BigDecimal getOrderSum() {
        return orderSum;
    }

    public void setOrderSum(BigDecimal orderSum) {
        this.orderSum = orderSum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrdersProducts that = (OrdersProducts) o;
        return Objects.equals(ordersId, that.ordersId) && Objects.equals(productId, that.productId) && Objects.equals(count, that.count) && Objects.equals(orderSum, that.orderSum);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ordersId, productId, count, orderSum);
    }

    @ManyToOne
    @JoinColumn(name = "ORDERS_ID", referencedColumnName = "ID", nullable = false)
    public Orders getOrdersByOrdersId() {
        return ordersByOrdersId;
    }

    public void setOrdersByOrdersId(Orders ordersByOrdersId) {
        this.ordersByOrdersId = ordersByOrdersId;
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
