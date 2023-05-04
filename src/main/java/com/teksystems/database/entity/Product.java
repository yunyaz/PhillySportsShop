package com.teksystems.database.entity;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "product_name")
    private String productName;

    @Column(name = "price", columnDefinition = "DECIMAL(10, 2)")
    private Double price;

    @Column(name = "quantity_in_stock")
    private Integer quantityInStock;

    @Column(name = "sports_team")
    private String sportsTeam;

    @Column(name = "category")
    private String category;

    @Column(name = "description")
    private String description;

    @Column(name = "img_url")
    private String imgUrl;

    @ToString.Exclude
    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<OrderProduct> orderProductList = new ArrayList<>();

    @ToString.Exclude
    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Review> reviews = new ArrayList<>();
}
