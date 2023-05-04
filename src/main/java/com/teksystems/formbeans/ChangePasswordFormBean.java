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
public class ChangePasswordFormBean {

    @NotEmpty(message = "Current password is required.")
    private String currentPassword;

    @NotEmpty(message = "New password is required.")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$])[A-Za-z\\d!@#$]{8,}$", message = "Invalid password format")
    private String newPassword;

    @NotEmpty(message = "Confirming new password is required.")
    private String confirmNewPassword;
}
