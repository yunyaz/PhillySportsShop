package com.teksystems.formbeans;

import com.teksystems.validation.EmailUnique;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

@Getter
@Setter
@ToString
public class ChangeEmailFormBean {

    @NotEmpty(message = "New email address is required.")
    @Length(max = 30, message = "Email can not be longer than 20 characters.")
    @Pattern(regexp = "^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$", message = "Invalid email format")
    @EmailUnique(message = "Email already exists in database")
    private String email;

    @NotEmpty(message = "Confirming new email address is required.")
    private String confirmEmail;

    @NotEmpty(message = "Password is required.")
    private String password;
}
