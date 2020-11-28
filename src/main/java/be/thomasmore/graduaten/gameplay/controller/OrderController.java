package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.*;
import be.thomasmore.graduaten.gameplay.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class OrderController {

    // ORDERS
    //-----------------
    @Autowired
    OrderService orderService;
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;

    @Autowired
    OrderProductService orderProductService;

    @RequestMapping("/orders/edit")
    public String dataOrder(Model model) {
        List<Order> orders = orderService.getOrders();
        model.addAttribute("orders", orders);
        return "orders/edit";
    }


    @RequestMapping("/orders/add")
    public String addOrder(Model model) {
        //input
        User user = userService.getUserById(Long.valueOf(3));
        Integer product1 = 1;
        Integer product2 = 2;
        Integer weeks= 2;

        //check order for user with status 0
        Order order = new Order();
        if (orderService.getOrderByUserByStatus(user, 0) == null){

            order.setStatus(0);
            order.setUser(user);

            if(! orderService.addOrder(order)) {
                //foutmelding geven
            };
        }

        order = orderService.getOrderByUserByStatus(user, 0);


        //Add product to wishlist
        OrderProduct orderProduct = new OrderProduct();
        OrderProduct orderProduct2 = new OrderProduct();


        //buy product
        orderProduct.setOrder(order);
        orderProduct.setOrderType(1);
        //buy stock?
        orderProduct.setProduct(productService.getProductById((long)product1));
        orderProduct.setPrice(productService.getProductById((long)product1).getBuyPrice());

        //rent product
        orderProduct2.setOrder(order);
        orderProduct2.setOrderType(2);
        orderProduct2.setProduct(productService.getProductById((long)product2));
        orderProduct2.setRentDurationWeeks(weeks);
        orderProduct2.setPrice(productService.getProductById((long)product2).getRentPrice() * weeks);

        orderProductService.addOrderProduct(orderProduct);
        orderProductService.addOrderProduct(orderProduct2);


        Set<OrderProduct> orderProductList = new HashSet<OrderProduct>() ;
        orderProductList.add(orderProduct);
        orderProductList.add(orderProduct2);
/*


        order.setOrderProducts(orderProductList);
        order.setUser(userService.getUserById((long)1));
        orderService.addOrder(order);
*/

        List<Order> orders = orderService.getOrders();
        model.addAttribute("orders", orders);
        return "orders/edit";
    }
}

