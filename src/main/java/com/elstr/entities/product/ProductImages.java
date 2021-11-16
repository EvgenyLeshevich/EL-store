package com.elstr.entities.product;

import javax.persistence.*;

@Entity
@Table(name = "product_images")
public class ProductImages {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "image")
    private String image;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}
