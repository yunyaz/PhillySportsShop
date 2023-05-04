package com.teksystems.database.dao;

import com.teksystems.database.entity.Order;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class OrderDAOTest {

    @Autowired
    private OrderDAO orderDao;

    @Test
    public void findOrderInCartTest() {
        // given
        Order given = new Order();
        given.setUserId(15);
        given.setStatus("cart");

        // when
        Order actual = orderDao.findOrderInCart(15);

        // then
        Assertions.assertEquals(given.getUserId(), actual.getUserId());
        Assertions.assertEquals(given.getStatus(), actual.getStatus());
    }
}
