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
        User user = new User();
        List<Order> orders = new ArrayList<>();
        Order selectedOrder = new Order();


        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);

            if(user.getUserType().getName().equals("ADMIN")){
                orders = orderService.getOrders();
            }
            else{
                orders = orderService.getOrdersByUser(user);
            }
        }

        model.addAttribute("orders", orders);
        model.addAttribute("selectedOrder", selectedOrder);

        return "orders/edit";
    }

    @RequestMapping(value = "/orders/edit", params = {"id"})
    public String OrdersEditId(ModelMap model, HttpSession session, @RequestParam("id") Long id) {

        User user = new User();
        List<Order> orders = new ArrayList<>();
        Order selectedOrder = new Order();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);

            if(user.getUserType().getName().equals("ADMIN")){
                orders = orderService.getOrders();
            }
            else{
                orders = orderService.getOrdersByUser(user);
            }
        }

        if (id != 0) {
            selectedOrder = orderService.getOrderById(id);
        }

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
    public String cancelEditOrder(ModelMap model) {

        return dataOrder(model);
    }

    @RequestMapping(value = "/orders/delete", params = {"id"})
    public String deleteOrderById(ModelMap model, HttpSession session, @RequestParam("id") Long id) {

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
        // Default values for productorder
        orderProduct.setAmount(1);
        orderProduct.setDiscountPrice(0.00);
        orderProduct.setReturned(false);
        orderProduct.setOrder(order);
        orderProduct.setProduct(product);
        orderProduct.setOrderType(typeid);

        // No orderproducts in the order
        if(order.getOrderProducts() == null) {
            Set<OrderProduct> orderlist = new HashSet<>();
            orderlist.add(orderProduct);
            order.setOrderProducts(orderlist);
            if (typeid == 1) {  //buy product
                orderProduct.setPrice(product.getBuyPrice());

            } else {            //rent product
                Integer weeks = Integer.valueOf(request.getParameter("weeks"));
                orderProduct.setPrice(product.getRentPrice() * weeks);
                orderProduct.setRentDurationWeeks(weeks);
            }
        }
        else {
            for (OrderProduct op : order.getOrderProducts()) {
                // if orderproduct with type already exists on orderproducts
                if (op.getProduct().equals(product) && op.getOrderType() == typeid) {

                    orderProduct = op;

                    if (typeid == 1) {  //buy product
                        orderProduct.setAmount(orderProduct.getAmount() + 1);
                        orderProduct.setPrice(product.getBuyPrice());

                    } else {            //rent product
                        Integer weeks= Integer.valueOf(request.getParameter("weeks"));
                        orderProduct.setPrice(product.getRentPrice()* weeks);
                        orderProduct.setRentDurationWeeks(weeks);
                    }
                } else {

                    if (typeid == 1) {  //buy product
                        orderProduct.setPrice(product.getBuyPrice());

                    } else {            //rent product
                        Integer weeks = Integer.valueOf(request.getParameter("weeks"));
                        orderProduct.setPrice(product.getRentPrice() * weeks);
                        orderProduct.setRentDurationWeeks(weeks);
                    }
                }

            }
        }

        // Add orderproduct to wishlist (order)
        if(!orderProductService.addOrderProduct(orderProduct))
        {
            return "/error/404";
            // TO-DO - deftige errorpage
        }

       /* Set<OrderProduct> orderProductList = new HashSet<OrderProduct>() ;
        orderProductList.add(orderProduct);*/

        // Generate list for return view
        List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);

        OrderProduct selectedOrderProduct = new OrderProduct();
        String returnmessage="";
        model.addAttribute("returnmessage",returnmessage);
        model.addAttribute("orderId", order.getId());
        model.addAttribute("orderProducts", orderProducts);
        model.addAttribute("selectedOrderProduct", selectedOrderProduct);
        model.addAttribute("userRecord",user);
        model.addAttribute("viewTitle","Winkelmandje");
        return "/orderproducts/basket";
    }

    @PostMapping("/products/do-ordercomplete")
    public String completeOrder(Model model, HttpServletRequest request) {

        //Ophalen orderId van de basket en opzoeken order in de db
        Long orderid= Long.valueOf(request.getParameter("orderId"));
        Order order = orderService.getOrderById(orderid);


        // Aantallen op de gevraagde producten aanpassen
        //* lijst maken van alle producten in dit order
        for (OrderProduct op : order.getOrderProducts()) {
            //Voor elk product in het order, verminder het aantal
            if(op.getOrderType()==2)   //rent
            {
                int rentstock=op.getProduct().getRentStock();
                op.getProduct().setRentStock(rentstock-1);
            }
            else //buy
            {
                //get amount available in stock
                int buystock=op.getProduct().getBuyStock();
                //perform check stock not less than ordered
                if(buystock >= op.getAmount())  //stock is ok
                {
                    Product product =  op.getProduct();
                    product.setBuyStock(buystock-op.getAmount());
                    // update via
                    productService.updateProduct(product);
                }
                else
                {
                    // TO-DO
                    // error - het gevraagde aantal is niet meer beschikbaar
                    return "/index";
                }
            }
        }
        //Ophalen alternatief leveringsadres
        String provided_street = request.getParameter("deliveryStreet");
        String provided_nr = request.getParameter("deliveryStreet");
        Integer provided_postalcode = Integer.valueOf(request.getParameter("deliveryPostalcode"));
        String provided_city = request.getParameter("deliveryCity");

        if(order.getDeliveryStreet() != provided_street)
        {
            order.setDeliveryStreet(provided_street);
        }
        if(order.getDeliveryNumber() != provided_nr)
        {
            order.setDeliveryNumber(provided_nr);
        }
        if(order.getDeliveryPostalcode() != provided_postalcode)
        {
            order.setDeliveryPostalcode(provided_postalcode);
        }
        if(order.getDeliveryCity() != provided_city)
        {
            order.setDeliveryCity(provided_city);
        }

        //order vervolledigen en basket afsluiten
        order.setStatus(1);
        //Alle wijzigingen opslaan
        Boolean bool= orderService.updateOrder(order);
        return "/index";
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
            if(order!= null) {
                List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);

                OrderProduct selectedOrderProduct = new OrderProduct();

                String returnmessage = "";
                model.addAttribute("returnmessage", returnmessage);
                model.addAttribute("orderProducts", orderProducts);
                model.addAttribute("orderId", order.getId());
                model.addAttribute("userRecord", user);
                model.addAttribute("selectedOrderProduct", selectedOrderProduct);
                model.addAttribute("viewTitle", "Winkelmandje");


                return "orderproducts/basket";
            }
            else
            {   //no products in the basket
                List<OrderProduct> orderProducts = null;

                OrderProduct selectedOrderProduct = new OrderProduct();

                String returnmessage = "";
                /*model.addAttribute("returnmessage", returnmessage);
                model.addAttribute("orderProducts", orderProducts);
                model.addAttribute("orderId", 0);
                model.addAttribute("userRecord", user);
                model.addAttribute("selectedOrderProduct", selectedOrderProduct);*/
                model.addAttribute("viewTitle", "Winkelmandje");
                return "orderproducts/basket";
            }
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
            boolean stockcheck;
            int stock=0;
            switch (orderProduct.getOrderType()) {
                case 2:
                    // rent
                    //stock = orderProduct.getProduct().getRentStock();
                    /*if(stock >= inputnumber) {*/
                        orderProduct.setRentDurationWeeks(inputnumber);
                        stockcheck=true;
                   /* }
                    else
                    {
                        stockcheck=false;
                    }*/
                    break;
                case 1:
                case 3:
                    // preorder
                    // buy
                    stock = orderProduct.getProduct().getBuyStock();
                    if(stock >= inputnumber) {
                        orderProduct.setAmount(inputnumber);
                        stockcheck=true;
                    }
                    else
                    {
                        stockcheck=false;
                    }
                    break;
                default:
                    stockcheck=false;
                    break;
            }

            String returnmessage="";
            if(stockcheck)
            {
                // save changes in db
                if(orderProductService.updateOrderProduct(orderProduct))
                {
                    returnmessage = "Het aantal werd aangepast.";
                }
                else
                {
                    returnmessage = "De aanpassing werd niet doorgevoerd.";
                }
            }
            else
            {
                returnmessage ="Het gewenste aantal is groter dan wat er beschikbaar is. Momenteel zijn er slechts " + stock + " in stock.";
            }

            /*orderProductService.updateOrderProduct(orderProduct);*/

            // Get input for view
            List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);

            OrderProduct selectedOrderProduct = new OrderProduct();

            boolean successSave=stockcheck;

            model.addAttribute("successSave",successSave);
            model.addAttribute("returnmessage",returnmessage);
            model.addAttribute("userRecord", user);
            model.addAttribute("orderId", order.getId());
            model.addAttribute("orderProducts", orderProducts);
            model.addAttribute("selectedOrderProduct", selectedOrderProduct);
            model.addAttribute("viewTitle","Winkelmandje");

            return "orderproducts/basket";
        }
        return "index";
    }

    @RequestMapping(value = "/orderproducts/edit" , params= {"orderID"})
    public String dataOrderProductsByOrderID(ModelMap model, @RequestParam("orderID") Long orderID) {

        User user;
        List<OrderProduct> orderProducts = new ArrayList<>();
        OrderProduct selectedOrderProduct = new OrderProduct();
        Order selectedOrder = orderService.getOrderById(orderID);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);

            if(user.getUserType().getName().equals("ADMIN") || selectedOrder.getUser().equals(user)){

                orderProducts = orderProductService.getOrderProductsByOrder(selectedOrder);
            }

         }

        model.addAttribute("orderProducts", orderProducts);
        model.addAttribute("selectedOrderProduct", selectedOrderProduct);
        model.addAttribute("viewTitle","Orderproductenlijst");
        return "orderproducts/edit";
    }

    @PostMapping(value = "/orderproducts/edit/detail", params = "Edit")
    public String editDetailOrderProduct(ModelMap model, @RequestParam("orderID") Long orderID, @RequestParam("orderProductID") Long orderProductID) {

        OrderProduct selectedOrderProduct;
        List<OrderProduct> orderProducts;

        if (orderProductID != 0) {
            selectedOrderProduct = orderProductService.getOrderProductById(orderProductID);
            orderProducts = orderProductService.getOrderProductsByOrder(selectedOrderProduct.getOrder());
            model.addAttribute("orderProducts", orderProducts);
            model.addAttribute("selectedOrderProduct", selectedOrderProduct);
            model.addAttribute("viewTitle","Orderproductenlijst");
            return "orderproducts/edit";
        }

        if(orderID != 0){
            return dataOrderProductsByOrderID(model, orderID);
        }

        return dataOrder(model);
    }

    @PostMapping(value = "/orderproducts/edit/detail", params = "Delete")
    public String deleteDetailOrderProduct(ModelMap model, @RequestParam("orderID") Long orderID, @RequestParam("orderProductID") Long orderProductID) {

        if (orderProductService.deleteOrderProductByID(orderProductID) == true) {

            model.addAttribute("successDelete", true);
            // do something

        }
        else{
            model.addAttribute("successDelete", false);
            // do something
        }

        return dataOrderProductsByOrderID(model, orderID);
    }

 /*   @RequestMapping(value = "/orderproducts/edit/orderID/{orderID}/id/{id}", method = GET)
    public String orderProductsEditId(ModelMap model, HttpSession session, @PathVariable long orderID, @PathVariable long id) {

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
            return dataOrderProductsByOrderID(model,orderID);
        }

        return dataOrder(model);
    }*/

    @PostMapping(value = "/orderproducts/edit/submit", params = "Save")
    public String editOrderProduct(@Valid @ModelAttribute("selectedOrderProduct") OrderProduct selectedOrderProduct, BindingResult result, ModelMap model) {

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
    public String cancelEditOrderProduct(@ModelAttribute("selectedOrderProduct") OrderProduct selectedOrderProduct, BindingResult result, ModelMap model) {

        return dataOrderProductsByOrderIDByCancel(model,selectedOrderProduct.getOrder().getId());
    }

    @RequestMapping(value = "/orderproducts/delete", params = {"id"})
    public String deleteOrderProductById(ModelMap model, HttpSession session, @RequestParam("id") Long id) {

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

