package com.elstr.entities.order;

import com.elstr.entities.order.Orders;
import com.elstr.entities.product.Product;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;

@Entity
@Table(name = "orders_products")
public class OrdersProducts {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "count")
    private Long count;
    @Column(name = "order_sum")
    private BigDecimal orderSum;

    @ManyToOne
    @JoinColumn(name = "orders_id")
    private Orders orders;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}
