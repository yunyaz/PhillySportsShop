package com.teksystems.database.dao;

import com.teksystems.database.entity.OrderProduct;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderProductDAO extends JpaRepository<OrderProduct, Long> {

    @Query(value = "select * from order_product as op where op.order_id = :orderId " +
            "and op.product_id = :productId and op.size = :size", nativeQuery = true)
    OrderProduct findByOrderIdAndProductIdAndSize(Integer orderId, Integer productId, String size);

    @Modifying
    @Transactional
    @Query(value = "delete from order_product as op where op.order_id =:orderId and op.product_id = :productId", nativeQuery = true)
    void deleteByOrderIdAndProductId(Integer orderId, Integer productId);

    @Modifying
    @Transactional
    @Query(value = "delete from order_product as op where op.id =:id", nativeQuery = true)
    void deleteById(Integer id);

    @Query(value = "select o.id from users as u, orders as o, order_product as op where u.id = o.user_id and o.id = op.order_id " +
            "and u.id = :userId and op.product_id = :productId and o.status = 'complete'", nativeQuery = true)
    List<Integer> findByUserIdAndProductIdInCompleteOrder(Integer userId, Integer productId);

}
