package com.teksystems.database.dao;

import com.teksystems.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserDAO extends JpaRepository<User, Long> {

    @Query("from User u")
    List<User> getAllUsers();

    @Query("select u from User u where u.id = :id")
    User findById(Integer id);

    @Query("select u from User u where lower(u.email) = lower(:email)")
    User findByEmail(String email);
}
