package com.teksystems.interceptor;

import com.teksystems.database.dao.OrderDAO;
import com.teksystems.database.entity.Order;
import com.teksystems.database.entity.User;
import com.teksystems.security.AuthenticatedUserService;
import io.micrometer.common.lang.Nullable;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Component
public class CartQuantityInterceptor implements HandlerInterceptor {

    @Autowired
    private OrderDAO orderDao;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           @Nullable ModelAndView modelAndView) throws Exception {

        if (modelAndView != null && authenticatedUserService.isAuthenticated()) {
            Integer totalItems = 0;

            User user = authenticatedUserService.loadCurrentUser();

            Order order = new Order();

            if (orderDao.findOrderInCart(user.getId()) != null) {
                order = orderDao.findOrderInCart(user.getId());
                totalItems = orderDao.getTotalItems(order.getId());
            }
            modelAndView.addObject("totalItems", totalItems);
        }
    }
}
