package com.teksystems.formbeans;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class ProductFormBean {

    private Integer id;

    private String productName;

    private Double price;

    private Integer quantityInStock;

    private String sportsTeam;

    private String category;

    private String description;

    private String imgUrl;
}
