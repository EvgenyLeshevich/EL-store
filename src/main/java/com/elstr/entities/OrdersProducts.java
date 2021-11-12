package com.elstr.entities;

import com.elstr.entities.order.Orders;
import com.elstr.entities.product.Product;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;

@Entity
@Table(name = "orders_products")
public class OrdersProducts {
    @Column(name = "count")
    private Long count;
    @Column(name = "order_sum")
    private Double orderSum;
}
