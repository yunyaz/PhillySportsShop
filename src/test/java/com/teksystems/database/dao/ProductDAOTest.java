package com.teksystems.database.dao;

import com.teksystems.database.entity.Product;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.aggregator.ArgumentsAccessor;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class ProductDAOTest {

    @Autowired
    private ProductDAO productDao;

    @ParameterizedTest
    @CsvSource({
            "18, Men's Philadelphia Union adidas Black One Planet Replica Jersey, 89.99, 111, Union, Jerseys"
    })
    public void findByIdTest(ArgumentsAccessor arguments) {
        // given
        Product given = new Product();
        given.setId(arguments.getInteger(0));
        given.setProductName(arguments.getString(1));
        given.setPrice(arguments.getDouble(2));
        given.setQuantityInStock(arguments.getInteger(3));
        given.setSportsTeam(arguments.getString(4));
        given.setCategory(arguments.getString(5));

        // when
        Product actual = productDao.findById(arguments.getInteger(0));

        // then
        Assertions.assertEquals(given.getProductName(), actual.getProductName());
        Assertions.assertEquals(given.getPrice(), actual.getPrice());
        Assertions.assertEquals(given.getQuantityInStock(), actual.getQuantityInStock());
        Assertions.assertEquals(given.getSportsTeam(), actual.getSportsTeam());
        Assertions.assertEquals(given.getCategory(), actual.getCategory());
    }
}
