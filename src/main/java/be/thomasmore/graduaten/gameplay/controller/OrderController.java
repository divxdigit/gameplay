package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.*;
import be.thomasmore.graduaten.gameplay.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

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
    public String dataOrder(ModelMap model) {
        List<Order> orders = orderService.getOrders();
        Order selectedOrder = new Order();

        model.addAttribute("orders", orders);
        model.addAttribute("selectedOrder", selectedOrder);

        return "orders/edit";
    }

    @RequestMapping(value = "/orders/edit", params = {"id"})
    public String OrdersEditId(ModelMap model, HttpSession session, @RequestParam("id") Long id) {

        Order selectedOrder = new Order();

        if (id != 0) {
            selectedOrder = orderService.getOrderById(id);
        }

        List<Order> orders = orderService.getOrders();
        model.addAttribute("orders", orders);
        model.addAttribute("selectedOrder", selectedOrder);

        return "/orders/edit";
    }

    @PostMapping(value = "/orders/edit/submit", params = "Save")
    public String EditOrder(@Valid @ModelAttribute("selectedOrder") Order selectedOrder, BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            List<Order> orders = orderService.getOrders();
            model.addAttribute("orders", orders);
            model.addAttribute("successSave", null);
            model.addAttribute("selectedOrder", selectedOrder);
            return "/orders/edit";
        }

        selectedOrder.setUser(userService.getUserById(selectedOrder.getUser().getId()));

        if (orderService.updateOrder(selectedOrder) == true) {

            model.addAttribute("successSave", "true");
            model.addAttribute("selectedOrder", new Order());

        }
        else{

            model.addAttribute("successSave", "false");
            model.addAttribute("selectedOrder", selectedOrder);
        }

        List<Order> orders = orderService.getOrders();
        model.addAttribute("orders", orders);

        return "/orders/edit";
    }

    @PostMapping(value = "/orders/edit/submit", params = "Cancel")
    public String CancelEditOrder(ModelMap model) {

        return dataOrder(model);
    }

    @RequestMapping(value = "/orders/delete", params = {"id"})
    public String DeleteOrderById(ModelMap model, HttpSession session, @RequestParam("id") Long id) {

        if (orderService.deleteOrderByID(id) == true) {

            model.addAttribute("successDelete", true);
            // do something

        }
        else{
            model.addAttribute("successDelete", false);
            // do something
        }

        return dataOrder(model);
    }

    @PostMapping("/products/do-orderproduct")
    public String addOrderProduct(Model model, HttpServletRequest request) {
        User user = userService.getUserById(Long.valueOf(request.getParameter("userid")));
        Product product = productService.getProductById(Long.valueOf(request.getParameter("productid")));

        Integer typeid= Integer.valueOf(request.getParameter("typeid"));


        Order order = new Order();
        //check if an order for user exists with order_status 0 : wishlist
        if (orderService.getOrderByUserByStatus(user, 0) == null){
            //User heeft geen winkelmandje open. Basisinfo opgeven op het order
            order.setStatus(0);
            order.setUser(user);
            order.setDateCreated(LocalDate.now());
            order.setDateCollect(LocalDate.now());
            if(! orderService.addOrder(order)) {
                //foutmelding geven
            };
        }
        order = orderService.getOrderByUserByStatus(user, 0);


        //check if orderProduct already exists in the order
        //Create orderproduct object
        OrderProduct orderProduct = new OrderProduct();
        for (OrderProduct op: order.getOrderProducts()) {
            if(op.getProduct().equals(product)) {
//                orderProduct.setOrder(order);
                orderProduct=op;
                orderProduct.setAmount(orderProduct.getAmount()+1);

            }
            else {

                orderProduct.setOrder(order);
                orderProduct.setOrderType(typeid);
                orderProduct.setProduct(product);

                //default values
                orderProduct.setAmount(1);
                orderProduct.setDiscountPrice(0.00);
                orderProduct.setReturned(false);
            }
        }

        if (typeid == 1) {  //buy product
            orderProduct.setPrice(product.getBuyPrice());
        } else {            //rent product
            Integer weeks= Integer.valueOf(request.getParameter("weeks"));
            orderProduct.setPrice(product.getRentPrice()* weeks);
            orderProduct.setRentDurationWeeks(weeks);
        }

        // Add orderproduct to wishlist (order)
        orderProductService.addOrderProduct(orderProduct);

        Set<OrderProduct> orderProductList = new HashSet<OrderProduct>() ;
        orderProductList.add(orderProduct);

        // Generate list for return view

        List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);

        OrderProduct selectedOrderProduct = new OrderProduct();

        model.addAttribute("orderProducts", orderProducts);
        model.addAttribute("selectedOrderProduct", selectedOrderProduct);
        model.addAttribute("viewTitle","Winkelmandje");


        return "/orderproducts/basket";
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

    public String dataOrderProductsByOrderIDByCancel(ModelMap model, Long orderID) {

        Order order = orderService.getOrderById(orderID);
        List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);

        OrderProduct selectedOrderProduct = new OrderProduct();

        model.addAttribute("orderProducts", orderProducts);
        model.addAttribute("selectedOrderProduct", selectedOrderProduct);
        model.addAttribute("viewTitle","Orderproductenlijst");
        return "orderproducts/edit";
    }

/*    public String translateOrderProductTypes (Integer productType){
        switch(productType){
            case 1: return "Huren";
            case 2: return "Kopen";
            case 3: return "Pre-Order";
        }
    }*/
    @RequestMapping(value = "/orderproducts/basket")
    public String dataOrderProductsByUserCard(ModelMap model, HttpSession session) {
        //get logged-in user
        User user = new User();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);

            //get order from user where state is 0 (winkelmand)
            Order order = orderService.getOrderByUserByStatus(user,0);
            List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);

            OrderProduct selectedOrderProduct = new OrderProduct();

            model.addAttribute("orderProducts", orderProducts);
            model.addAttribute("selectedOrderProduct", selectedOrderProduct);
            model.addAttribute("viewTitle","Winkelmandje");

            return "orderproducts/basket";
        }
        return "index";
    }

    @RequestMapping(value = "/orderproducts/basket" , params= {"orderProductID","inputnumber"})
    public String dataOrderProductsByOrderID(ModelMap model, HttpSession session,
                                             @RequestParam("orderProductID") Long orderProductID,
                                             @RequestParam("inputnumber") Integer inputnumber) {
        //get logged-in user
        User user = new User();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);

            //get order from user where state is 0 (winkelmand)
            Order order = orderService.getOrderByUserByStatus(user,0);

            //Edit number depending product type
            OrderProduct orderProduct = orderProductService.getOrderProductById(orderProductID);
            switch(orderProduct.getOrderType()) {
                case 2:
                    // rent
                    orderProduct.setRentDurationWeeks(inputnumber);
                    break;
                case 1:
                case 3:
                    // preorder
                    // buy
                    orderProduct.setAmount(inputnumber);
                    break;
                default:
                    break;
            }
            // save changes in db
            orderProductService.updateOrderProduct(orderProduct);

            // Get input for view
            List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);

            OrderProduct selectedOrderProduct = new OrderProduct();

            model.addAttribute("orderProducts", orderProducts);
            model.addAttribute("selectedOrderProduct", selectedOrderProduct);
            model.addAttribute("viewTitle","Winkelmandje");

            return "orderproducts/basket";
        }
        return "index";
    }

    @RequestMapping(value = "/orderproducts/edit" , params= {"orderID"})
    public String dataOrderProductsByOrderID(ModelMap model, HttpSession session, @RequestParam("orderID") Long orderID) {

        Order order = orderService.getOrderById(orderID);
        List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);

        OrderProduct selectedOrderProduct = new OrderProduct();

        model.addAttribute("orderProducts", orderProducts);
        model.addAttribute("selectedOrderProduct", selectedOrderProduct);
        model.addAttribute("viewTitle","Orderproductenlijst");
        return "orderproducts/edit";
    }

    @RequestMapping(value = "/orderproducts/edit/orderID/{orderID}/id/{id}", method = GET)
    public String OrderProductsEditId(ModelMap model, HttpSession session, @PathVariable long orderID, @PathVariable long id) {

        OrderProduct selectedOrderProduct = new OrderProduct();
        List<OrderProduct> orderProducts = new ArrayList<>();

        if (id != 0) {
            selectedOrderProduct = orderProductService.getOrderProductById(id);
            orderProducts = orderProductService.getOrderProductsByOrder(selectedOrderProduct.getOrder());
            model.addAttribute("orderProducts", orderProducts);
            model.addAttribute("selectedOrderProduct", selectedOrderProduct);
            model.addAttribute("viewTitle","Orderproductenlijst");
            return "orderproducts/edit";
        }

        if(orderID != 0){
            return dataOrderProductsByOrderID(model,session,orderID);
        }

        return dataOrder(model);
    }

    @PostMapping(value = "/orderproducts/edit/submit", params = "Save")
    public String EditOrderProduct(@Valid @ModelAttribute("selectedOrderProduct") OrderProduct selectedOrderProduct, BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(orderService.getOrderById(selectedOrderProduct.getOrder().getId()));
            model.addAttribute("orderProducts", orderProducts);
            model.addAttribute("successSave", null);
            model.addAttribute("selectedOrderProduct", selectedOrderProduct);
            model.addAttribute("viewTitle","Orderproductenlijst");
            return "/orderproducts/edit";
        }

        if (orderProductService.updateOrderProduct(selectedOrderProduct) == true) {

            model.addAttribute("successSave", true);
            model.addAttribute("selectedOrderProduct", new OrderProduct());

        }
        else{

            model.addAttribute("successSave", false);
            model.addAttribute("selectedOrderProduct", selectedOrderProduct);
        }

        List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(selectedOrderProduct.getOrder());
        model.addAttribute("orderProducts", orderProducts);
        model.addAttribute("viewTitle","Orderproductenlijst");
        return "orderproducts/edit";
    }

    @PostMapping(value = "/orderproducts/edit/submit", params = "Cancel")
    public String CancelEditOrderProduct(@ModelAttribute("selectedOrderProduct") OrderProduct selectedOrderProduct, BindingResult result, ModelMap model) {

        return dataOrderProductsByOrderIDByCancel(model,selectedOrderProduct.getOrder().getId());
    }

    @RequestMapping(value = "/orderproducts/delete", params = {"id"})
    public String DeleteOrderProductById(ModelMap model, HttpSession session, @RequestParam("id") Long id) {

        Long orderID = orderProductService.getOrderProductById(id).getOrder().getId();

        if (orderProductService.deleteOrderProductByID(id) == true) {

            model.addAttribute("successDelete", true);
            // do something

        }
        else{
            model.addAttribute("successDelete", false);
            // do something
        }

        return dataOrderProductsByOrderIDByCancel(model,orderID);
    }

}

