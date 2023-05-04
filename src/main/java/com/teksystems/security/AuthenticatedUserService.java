package com.teksystems.security;

import com.teksystems.database.dao.UserDAO;
import com.teksystems.database.entity.User;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.security.Principal;

@Component
public class AuthenticatedUserService {

    @Autowired
    private UserDAO userDao;

    @Autowired
    private AuthenticationManager authenticationManager;

    public void changeLoggedInUsername(HttpSession session, String username, String unencryptedPassword) {
        // reset security principal to be the new user information
        Authentication request = new UsernamePasswordAuthenticationToken(username, unencryptedPassword);
        Authentication result = authenticationManager.authenticate(request);
        SecurityContext sc = SecurityContextHolder.getContext();
        sc.setAuthentication(result);

        session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, sc);
    }

    public User loadCurrentUser() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        User user = userDao.findByEmail(getCurrentUsername());
        return user;
    }

    public String getCurrentUsername() {
        SecurityContext context = SecurityContextHolder.getContext();
        if (context != null && context.getAuthentication() != null) {
//            Object o = context.getAuthentication().getPrincipal();
//            String i = context.getAuthentication().getName();
            final org.springframework.security.core.userdetails.User principal = (org.springframework.security.core.userdetails.User) context.getAuthentication().getPrincipal();
            return principal.getUsername();
        } else {
            return null;
        }
    }

    public boolean isAuthenticated() {
        SecurityContext context = SecurityContextHolder.getContext();
        if (context != null && context.getAuthentication() != null) {
            if(StringUtils.equals("anonymousUser", context.getAuthentication().getName())) {
                return false;
            }
        }
        return true;
    }

}
