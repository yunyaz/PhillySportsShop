package com.teksystems.database.dao;

import com.teksystems.database.entity.User;
import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.aggregator.ArgumentsAccessor;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserDAOTest {

    @Autowired
    private UserDAO userDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Test
    public void findByEmailTest() {
        User u = userDao.findByEmail("yunya.zhang@gmail.com");

        Assertions.assertEquals(u.getFirstName(), "Yunya");
        Assertions.assertEquals(u.getLastName(), "Zhang");
    }


    @Test
    @Order(1)
    public void createUserTest() {
        // given
        User given = new User();
        given.setFirstName("Rachel");
        given.setLastName("Greene");
        given.setEmail("rachel.greene@gmail.com");
        given.setPassword(passwordEncoder.encode("Rachel@2"));

        // when
        userDao.save(given);
        User actual = userDao.findByEmail("rachel.greene@gmail.com");

        // then
        Assertions.assertEquals(given.getFirstName(), actual.getFirstName());
        Assertions.assertEquals(given.getLastName(), actual.getLastName());
        Assertions.assertTrue(passwordEncoder.matches("Rachel@2", actual.getPassword()));
    }

    @Test
    @Order(2)
    public void updateUserTest() {
        // given
        User given = userDao.findByEmail("rachel.greene@gmail.com");
        given.setFirstName("Monica");
        given.setLastName("Geller");

        // when
        userDao.save(given);
        User actual = userDao.findByEmail("rachel.greene@gmail.com");

        // then
        Assertions.assertEquals(given.getFirstName(), actual.getFirstName());
        Assertions.assertEquals(given.getLastName(), actual.getLastName());
    }

    @Test
    @Order(3)
    public void deleteUserTest() {
        // given
        User given = userDao.findByEmail("rachel.greene@gmail.com");

        // when
        userDao.delete(given);
        User actual = userDao.findByEmail("rachel.greene@gmail.com");

        // then
        Assertions.assertEquals(actual, null);
    }

    @ParameterizedTest
    @CsvSource({
            "18, Raymond, Reddington, raymond.reddington@gmail.com, Raymond@2"
    })
    public void findByIdParameterizedTest(ArgumentsAccessor arguments) {
        // given
        User given = new User();
        given.setId(arguments.getInteger(0));
        given.setFirstName(arguments.getString(1));
        given.setLastName(arguments.getString(2));
        given.setEmail(arguments.getString(3));
        given.setPassword(passwordEncoder.encode(arguments.getString(4)));

        // when
        User actual = userDao.findById(arguments.getInteger(0));

        // then
        Assertions.assertEquals(given.getFirstName(), actual.getFirstName());
        Assertions.assertEquals(given.getLastName(), actual.getLastName());
        Assertions.assertEquals(given.getEmail(), actual.getEmail());
        Assertions.assertTrue(passwordEncoder.matches(arguments.getString(4), actual.getPassword()));
    }


}
