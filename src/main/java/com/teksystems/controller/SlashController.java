package com.teksystems.controller;

import com.teksystems.database.dao.OrderProductDAO;
import com.teksystems.database.dao.ProductDAO;
import com.teksystems.database.entity.OrderProduct;
import com.teksystems.database.entity.Product;
import com.teksystems.database.entity.Review;
import com.teksystems.database.entity.User;
import com.teksystems.security.AuthenticatedUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

import static com.teksystems.controller.AdminController.CATEGORY;

@Slf4j
@Controller
public class SlashController {

    @Autowired
    private ProductDAO productDao;

    @Autowired
    private OrderProductDAO orderProductDao;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    private static final List<String> JERSEY_SIZE = Arrays.asList("S", "M", "L", "XL", "2XL");

    private static final List<Integer> QUANTITY = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

    @GetMapping({"/index", "/", "/index.html"})
    public ModelAndView index() {
        ModelAndView response = new ModelAndView("index");

        List<Product> products = productDao.getAllProducts();

        Collections.shuffle(products);

        response.addObject("productList", products.subList(0, 20));

        return response;
    }

    @GetMapping("/search")
    public ModelAndView searchProduct(@RequestParam(required = false) String search) {
        ModelAndView response = new ModelAndView("search");
        log.debug("In slash controller - search product with searchParam = " + search);

        String[] searchWords = search.split(" ");

        Set<Product> resultSet = new HashSet<>(productDao.getAllProducts());

        for (String word : searchWords) {
            Set<Product> productSet = new HashSet<>(productDao.findByProductNameContainingIgnoreCase(word));
            resultSet.retainAll(productSet);
        }

        response.addObject("productList", resultSet);
        response.addObject("searchParam", search);

        return response;
    }

    @GetMapping("/team/{teamName}/detail/{id}")
    public ModelAndView productDetail(@PathVariable String teamName, @PathVariable Integer id) {
        ModelAndView response = new ModelAndView("productDetail");
        log.debug("In slash controller - product detail with id = " + id);

        Product product = productDao.findById(id);
        response.addObject("product", product);
        response.addObject("jerseySize", JERSEY_SIZE);
        response.addObject("quantityList", QUANTITY);
        response.addObject("teamName", teamName);
        response.addObject("categoryList", CATEGORY);

        if (authenticatedUserService.isAuthenticated()) {
            User user = authenticatedUserService.loadCurrentUser();
            log.debug("userid " + user.getId());
            if (orderProductDao.findByUserIdAndProductIdInCompleteOrder(user.getId(), product.getId()).size() != 0) {
                List<Integer> orderId = orderProductDao.findByUserIdAndProductIdInCompleteOrder(user.getId(), product.getId());
                log.debug("orderid " + orderId.toString());
                response.addObject("ordered", true);
            }
        }

        List<Review> reviewList = product.getReviews();
        Collections.reverse(reviewList);

//        Double sumRating = 0.0;
//        for (Review review: reviewList) {
//            sumRating += review.getRating();
//        }
//        Integer avgRating = (int)Math.round(sumRating / reviewList.size());

        if (reviewList.size() != 0) {
            Integer avgRating = (int)Math.round(reviewList.stream().mapToDouble(r -> r.getRating()).average().getAsDouble());
            response.addObject("avgRating", avgRating);
        }

        response.addObject("reviews", reviewList);

        return response;
    }

    @GetMapping("/team/{teamName}")
    public ModelAndView team(@PathVariable String teamName) {
        ModelAndView response = new ModelAndView("teamProducts");
        log.debug("In slash controller - team = " + teamName);

        List<Product> products = productDao.findBySportsTeam(teamName);
//        Collections.shuffle(products);

        response.addObject("productList", products);
        response.addObject("teamName", teamName);
        response.addObject("categoryList", CATEGORY);

        return response;
    }

    @GetMapping("/team/{teamName}/{category}")
    public ModelAndView category(@PathVariable String teamName, @PathVariable String category) {
        ModelAndView response = new ModelAndView("teamProducts");
        log.debug("In slash controller - team = " + teamName + " category = " + category);

        List<Product> products = productDao.findBySportsTeamAndCategory(teamName, category);
        response.addObject("productList", products);
        response.addObject("teamName", teamName);
        response.addObject("categoryList", CATEGORY);

        return response;
    }
}
