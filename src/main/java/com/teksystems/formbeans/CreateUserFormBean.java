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
public class CreateUserFormBean {

    @NotEmpty(message = "Email address is required.")
    @Length(max = 30, message = "Email can not be longer than 20 characters.")
    @Pattern(regexp = "^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$", message = "Invalid email format")
    @EmailUnique(message = "Email already exists in database")
    private String email;


    @NotEmpty(message = "First name is required.")
    @Length(max = 40, message = "First name can not be longer than 40 characters.")
    private String firstName;

    @NotEmpty(message = "Last name is required.")
    private String lastName;
    @NotEmpty(message = "Password is required.")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$])[A-Za-z\\d!@#$]{8,}$", message = "Invalid password format")
    private String password;

    @NotEmpty(message = "Confirming password is required.")
    private String confirmPassword;

    private Boolean subscription;
}
