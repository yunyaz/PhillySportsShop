package com.teksystems.controller;

import com.teksystems.database.dao.OrderDAO;
import com.teksystems.database.dao.OrderProductDAO;
import com.teksystems.database.dao.ProductDAO;
import com.teksystems.database.dao.UserDAO;
import com.teksystems.database.entity.Order;
import com.teksystems.database.entity.OrderProduct;
import com.teksystems.database.entity.Product;
import com.teksystems.database.entity.User;
import com.teksystems.formbeans.CheckoutFormBean;
import com.teksystems.formbeans.OrderFormBean;
import com.teksystems.security.AuthenticatedUserService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderDAO orderDao;

    @Autowired
    private OrderProductDAO orderProductDao;

    @Autowired
    private ProductDAO productDao;

    @Autowired
    private UserDAO userDao;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    private static final List<Integer> QUANTITY = Arrays.asList(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

    private static final List<String> STATE = Arrays.asList("AL", "AK", "AZ", "AR", "AS", "CA", "CO", "CT", "DE", "DC",
            "FL", "GA", "GU", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO",
            "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD",
            "TN", "TX", "UT", "VT", "VA", "VI", "WA", "WV", "WI", "WY");

    @GetMapping("/cart")
    public ModelAndView cart() {
        ModelAndView response = new ModelAndView("order/cart");
        log.debug("In order controller - cart");

        User user = authenticatedUserService.loadCurrentUser();

        Order order = new Order();

        if (orderDao.findOrderInCart(user.getId()) != null) {
            order = orderDao.findOrderInCart(user.getId());
        }

        response.addObject("order", order);

        Double orderTotal = orderDao.getOrderTotal(order.getId());
        response.addObject("orderTotal", orderTotal);

        Integer totalItems = orderDao.getTotalItems(order.getId());
        response.addObject("totalItems", totalItems);

        response.addObject("quantityList", QUANTITY);

        return response;
    }

    @PostMapping("/addToCart")
    public String addToCart(OrderFormBean form) {
        log.debug("In order controller - add to cart");

        User user = authenticatedUserService.loadCurrentUser();

        Order order = new Order();

        if (orderDao.findOrderInCart(user.getId()) != null) {
            order = orderDao.findOrderInCart(user.getId());
        } else {
            order.setStatus("cart");
            order.setUser(user);
        }

        Product product = productDao.findById(form.getProductId());

        OrderProduct orderProduct = new OrderProduct();
        if (orderProductDao.findByOrderIdAndProductIdAndSize(order.getId(), form.getProductId(), form.getSize()) != null) {
            orderProduct = orderProductDao.findByOrderIdAndProductIdAndSize(order.getId(), form.getProductId(), form.getSize());
            orderProduct.setQuantity(orderProduct.getQuantity() + form.getQuantity());
        } else {
            if (form.getSize() == null) {
                orderProduct.setSize("One Size");
            } else {
                orderProduct.setSize(form.getSize());
            }
            orderProduct.setQuantity(form.getQuantity());
            orderProduct.setProduct(product);
            orderProduct.setOrder(order);
        }

        orderProductDao.save(orderProduct);
        orderDao.save(order);

        return "redirect:/order/cart";
    }

    @PostMapping("/updateCart")
    public String updateCart(OrderFormBean form) {
        log.debug("In order controller - update cart");

        OrderProduct orderProduct = orderProductDao.findByOrderIdAndProductIdAndSize(form.getOrderId(), form.getProductId(), form.getSize());

        if (form.getQuantity() == 0) {
//            orderProductDao.deleteByOrderIdAndProductId(orderProduct.getOrderId(), orderProduct.getProductId());
            orderProductDao.deleteById(orderProduct.getId());
        } else {
            orderProduct.setQuantity(form.getQuantity());
            orderProductDao.save(orderProduct);
        }
        return "redirect:/order/cart";
    }

    @GetMapping("/checkout")
    public ModelAndView checkout() {
        ModelAndView response = new ModelAndView("order/checkout");
        log.debug("In order controller - checkout");

        User user = authenticatedUserService.loadCurrentUser();
        CheckoutFormBean form = new CheckoutFormBean();

        if (user.getAddressLine1() != null) {
            form.setFirstName(user.getFirstName());
            form.setLastName(user.getLastName());
            form.setAddressLine1(user.getAddressLine1());
            form.setAddressLine2(user.getAddressLine2());
            form.setCity(user.getCity());
            form.setState(user.getState());
            form.setZipcode(user.getZipcode());
        }

        response.addObject("form", form);

        Order order = orderDao.findOrderInCart(user.getId());
        response.addObject("order", order);

        Double orderTotal = orderDao.getOrderTotal(order.getId());
        response.addObject("orderTotal", orderTotal);

        Integer totalItems = orderDao.getTotalItems(order.getId());
        response.addObject("totalItems", totalItems);

        response.addObject("states", STATE);
        return response;
    }

    @PostMapping("/checkoutSubmit")
    public ModelAndView checkoutSubmit(@Valid CheckoutFormBean form, BindingResult bindingResult) {
        ModelAndView response = new ModelAndView("order/checkout");
        log.debug("In order controller - checkout submit");

        User user = authenticatedUserService.loadCurrentUser();

        response.addObject("form", form);

        Order order = orderDao.findOrderInCart(user.getId());
        response.addObject("order", order);

        Double orderTotal = orderDao.getOrderTotal(order.getId());
        response.addObject("orderTotal", orderTotal);

        Integer totalItems = orderDao.getTotalItems(order.getId());
        response.addObject("totalItems", totalItems);

        response.addObject("states", STATE);

        if (bindingResult.hasErrors() ) {
            for (FieldError error : bindingResult.getFieldErrors()) {
                log.debug("Validation Error on field : " + error.getField() + " with message : " + error.getDefaultMessage());
            }
            response.addObject("bindingResult", bindingResult);
            return response;
        }

        order.setOrderDate(new Date());
        order.setStatus("complete");
        order.setAddressLine1(form.getAddressLine1());
        order.setAddressLine2(form.getAddressLine2());
        order.setCity(form.getCity());
        order.setState(form.getState());
        order.setZipcode(form.getZipcode());

        orderDao.save(order);

        List<OrderProduct> orderProducts = order.getOrderProductList();
        for (OrderProduct op : orderProducts) {
            Product product = op.getProduct();
            product.setQuantityInStock(product.getQuantityInStock() - op.getQuantity());
            productDao.save(product);
        }

        if(form.getSaveAddress() != null) {
            user.setAddressLine1(form.getAddressLine1());
            user.setAddressLine2(form.getAddressLine2());
            user.setCity(form.getCity());
            user.setState(form.getState());
            user.setZipcode(form.getZipcode());
        }

        userDao.save(user);

        response.addObject("success", true);

        return response;
    }
}
