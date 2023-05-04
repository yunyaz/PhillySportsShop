package com.teksystems.database.dao;

import com.teksystems.database.entity.Product;
import com.teksystems.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Long> {

    @Query("from Product p")
    List<Product> getAllProducts();

    @Query("select p from Product p where p.id = :id")
    Product findById(Integer id);

    @Query(value = "select * from products where lower(product_name) LIKE lower(concat('%', :search, '%'))", nativeQuery = true)
    List<Product> findByPartialSearch(String search);

    List<Product> findByProductNameContainingIgnoreCase(String search);

    @Query("select p from Product p where lower(p.sportsTeam) = lower(:teamName)")
    List<Product> findBySportsTeam(String teamName);

    @Query("select p from Product p where lower(p.sportsTeam) = lower(:teamName) and lower(p.category) = lower(:category)")
    List<Product> findBySportsTeamAndCategory(String teamName, String category);
}
