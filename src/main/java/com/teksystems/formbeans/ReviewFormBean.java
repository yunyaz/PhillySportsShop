package com.teksystems.formbeans;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewFormBean {

    private Integer userId;

    private Integer productId;

    private String rating;

    private String comment;
}
