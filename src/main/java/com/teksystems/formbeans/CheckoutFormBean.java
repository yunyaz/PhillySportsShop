package com.teksystems.formbeans;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

@Getter
@Setter
@ToString
public class CheckoutFormBean {

    @NotEmpty(message = "First name is required.")
    @Length(max = 40, message = "First name can not be longer than 40 characters.")
    private String firstName;

    @NotEmpty(message = "Last name is required.")
    private String lastName;

    @NotEmpty(message = "Address is required")
    @Length(max = 100, message = "Address can not be longer than 100 characters in one line. Otherwise, please use two lines")
    private String addressLine1;

    private String addressLine2;

    @NotEmpty(message = "City is required")
    private String city;

    @NotEmpty(message = "State is required")
    private String state;

    @NotEmpty(message = "Zipcode is required")
    @Pattern(regexp = "^[0-9]{5}(?:-[0-9]{4})?$", message = "Invalid email format")
    private String zipcode;

    private Boolean saveAddress;

    @NotEmpty(message = "Credit card number is required")
    @Pattern(regexp = "^[0-9]{16}|[0-9]{15}$", message = "Invalid credit card")
    private String creditCardNumber;

    @NotEmpty(message = "Expiration date is required")
    @Pattern(regexp = "^(0[1-9]|1[0-2])(2[3-8])$", message = "Invalid expiration date")
    private String expirationDate;

    @NotEmpty(message = "Security code is required")
    @Pattern(regexp = "^[0-9]{3}|[0-9]{4}$", message = "Invalid security code")
    private String securityCode;

    @NotEmpty(message = "Credit card name is required")
    private String creditCardName;
}
