package com.teksystems.database.dao;

import com.teksystems.database.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderDAO extends JpaRepository<Order, Long>{

    @Query("select o from Order o where o.userId = :id and o.status = 'cart'")
    Order findOrderInCart(Integer id);

    @Query(value="select sum(op.quantity * p.price) as total from orders as o, order_product as op, products as p " +
            "where o.id = :id and op.order_id = :id and op.product_id = p.id group by o.id;", nativeQuery = true)
    Double getOrderTotal(Integer id);

    @Query(value="select sum(op.quantity) from orders as o, order_product as op " +
            "where o.id = :id and op.order_id = :id", nativeQuery = true)
    Integer getTotalItems(Integer id);
}
