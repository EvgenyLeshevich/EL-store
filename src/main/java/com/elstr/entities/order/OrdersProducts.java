package com.elstr.entities.order;

import com.elstr.entities.product.Product;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
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
    @Column(name = "status")
    private String status;
    @Column(name = "data_cookie")
    private String dataCookie;
    @Column(name = "user_id")
    private Long activeUserId;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "orders_id")
    private Orders orders;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Override
    public String toString() {
        return
                product.toString() + " Количество: " + count +
                " Сумма =" + orderSum + "$ ";
    }
}
