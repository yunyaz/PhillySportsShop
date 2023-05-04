package com.teksystems.database.entity;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Table(name = "order_product")
public class OrderProduct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "order_id", insertable=false, updatable=false)
    private Integer orderId;

    @Column(name = "product_id", insertable=false, updatable=false)
    private Integer productId;

    @Column(name = "size")
    private String size;

    @Column(name = "quantity")
    private Integer quantity;

    @ToString.Exclude
    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.ALL)
    @JoinColumn(name = "order_id")
    private Order order;

    @ToString.Exclude
    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Product product;


}
