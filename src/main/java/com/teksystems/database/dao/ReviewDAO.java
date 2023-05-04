package com.teksystems.database.dao;

import com.teksystems.database.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ReviewDAO extends JpaRepository<Review, Long> {

}
