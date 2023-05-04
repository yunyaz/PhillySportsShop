package com.teksystems.controller;

import com.teksystems.database.dao.ProductDAO;
import com.teksystems.database.entity.Product;
import com.teksystems.formbeans.ProductFormBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {

    public static final List<String> SPORTS_TEAMS = Arrays.asList("Eagles", "Phillies", "76ers", "Flyers", "Union");
    public static final List<String> CATEGORY = Arrays.asList("Jerseys", "T-shirts", "Sweatshirts", "Hats", "Accessories", "Collectibles");

    @Autowired
    private ProductDAO productDao;


    @GetMapping("/searchProduct")
    public ModelAndView searchProduct(@RequestParam(required = false) String searchProduct) {
        ModelAndView response = new ModelAndView("admin/searchProduct");
        log.debug("In product controller - search product with searchParam = " + searchProduct);

        List<Product> products = productDao.findByProductNameContainingIgnoreCase(searchProduct);

        response.addObject("productList", products);
        response.addObject("searchParam", searchProduct);

        return response;
    }

    @GetMapping("/detail/{id}")
    public ModelAndView productDetail(@PathVariable Integer id) {
        ModelAndView response = new ModelAndView("admin/productDetail");
        log.debug("In product controller - product detail");

        Product product = productDao.findById(id);
        response.addObject("product", product);

        return response;
    }

    @GetMapping("/edit/{id}")
    public ModelAndView editProduct(@PathVariable Integer id) {
        ModelAndView response = new ModelAndView("admin/addProduct");
        log.debug("In product controller - edit product");

        Product product = productDao.findById(id);
        ProductFormBean form = new ProductFormBean();

        form.setId(product.getId());

        form.setProductName(product.getProductName());
        form.setPrice(product.getPrice());
        form.setQuantityInStock(product.getQuantityInStock());
        form.setSportsTeam(product.getSportsTeam());
        form.setCategory(product.getCategory());
        form.setDescription(product.getDescription());
        form.setImgUrl(product.getImgUrl());

        response.addObject("form", form);

        response.addObject("sportsTeams", SPORTS_TEAMS);
        response.addObject("categoryList", CATEGORY);

        return response;
    }

    @GetMapping("/addProduct")
    public ModelAndView addProduct() {
        ModelAndView response = new ModelAndView("admin/addProduct");
        log.debug("In product controller - add product");

        response.addObject("sportsTeams", SPORTS_TEAMS);
        response.addObject("categoryList", CATEGORY);

        return response;
    }

    @GetMapping("/addProductSubmit")
    public ModelAndView addProductSubmit(ProductFormBean form) {
        ModelAndView response = new ModelAndView("admin/addProduct");
        log.debug("In product controller - add product submit");

        Product product = new Product();

        if (form.getId() != null && form.getId() > 0) {
            product = productDao.findById(form.getId());
        }

        product.setProductName(form.getProductName());
        product.setPrice(form.getPrice());
        product.setQuantityInStock(form.getQuantityInStock());
        product.setSportsTeam(form.getSportsTeam());
        product.setCategory(form.getCategory());
        product.setDescription(form.getDescription());
        product.setImgUrl(form.getImgUrl());

        // save to database
        productDao.save(product);

        // add to model to be used in html
        response.addObject("form", form);
        response.addObject("product", product);

        response.addObject("sportsTeams", SPORTS_TEAMS);
        response.addObject("categoryList", CATEGORY);
        response.addObject("success", true);

        return response;
    }
}
