package be.thomasmore.graduaten.gameplay.controller;

import be.thomasmore.graduaten.gameplay.entity.*;
import be.thomasmore.graduaten.gameplay.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.time.LocalDate;
import java.util.*;

/*
@RolesAllowed({"USER","ADMIN"})
*/
@Controller
public class OrderController {

    // ORDERS AND ORDERPRODUCTS
    //-----------------
    @Autowired
    OrderService orderService;
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    OrderProductService orderProductService;

    // returning a list of orderProducts to the "orderproducts/edit" view based on the passed orderId
    public String listOfOrderProductsByOrderID(ModelMap model, Long orderID) {
        //retrieve order from database based on the passed orderID
        Order order = orderService.getOrderById(orderID);
        //retrieve a list of orderProducts on the order
        List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);
        //initialize a new selectedOrderProduct
        OrderProduct selectedOrderProduct = new OrderProduct();

        //set attributes
        model.addAttribute("orderProducts", orderProducts);
        model.addAttribute("selectedOrderProduct", selectedOrderProduct);
        model.addAttribute("viewTitle","Bestellijnen van geselecteerde bestelling");

        //return view
        return "orderproducts/edit";
    }

    //returning a list of orders to the "orders/edit" view based on logged in user and passed orderId
    public String listOfOrdersByUserAndOrderId(ModelMap model,Long OrderId){
        //Initialize new selectedOrder, list of orders and user
        Order selectedOrder = new Order();
        List<Order> orders = new ArrayList<>();

        //get logged in user
        User user;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);

            //check if user is admin -> admin gets all orders, user only gets his orders.
            if(user.getUserType().getName().equals("ADMIN")){ orders = orderService.getOrders(); }
            else{ orders = orderService.getOrdersByUser(user); }

            //get order (selectedOrder) from database if orderId is not 0
            if (OrderId != 0) { selectedOrder = orderService.getOrderById(OrderId); }

            //set attributes for view
            model.addAttribute("orders", orders);
            model.addAttribute("selectedOrder", selectedOrder);

            //return view
            return "orders/edit";
        }
        //user not logged in
        else
        {
            //return login view
            return "/login";
        }
    }

    @RequestMapping("/orders/edit") //returns a list of orders based on logged in user
    public String listOrders(ModelMap model) {
        //return list of orders for logged in user with selectedOrder = empty
        //admin gets a list of all orders
        //user gets a list of his orders
        return listOfOrdersByUserAndOrderId(model,(long)0);
    }

    @RequestMapping(value = "/orders/edit", params = {"id"}) //returns a list of orders based on logged in user and selected OrderId
    public String OrdersById(ModelMap model, @RequestParam("id") Long id) {
        //return list of orders for logged in user with selectedOrder = order with orderId = parameter id
        //admin gets a list of all orders
        //user gets a list of his orders
        return listOfOrdersByUserAndOrderId(model,id);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping(value = "/orders/edit/submit", params = "Save") //saving an update for an order (only for admins)
    public String EditOrder(@Valid @ModelAttribute("selectedOrder") Order selectedOrder, BindingResult result, ModelMap model) {

        //get all orders from the database
        List<Order> orders = orderService.getOrders();

        //check if input values have validation errors
        if (result.hasErrors()) {
            model.addAttribute("orders", orders);
            model.addAttribute("successSave", null);
            model.addAttribute("selectedOrder", selectedOrder);
            return "/orders/edit";
        }

        //set user (from database) for the selected order based on the bound userId from selectedOrder object
        selectedOrder.setUser(userService.getUserById(selectedOrder.getUser().getId()));

        //check is updateOrder is successful
        if (orderService.updateOrder(selectedOrder)) {
            //actions if updateOrder is successful
            model.addAttribute("successSave", "true");
            model.addAttribute("selectedOrder", new Order());
        }
        else{
            //actions if updateOrder failed
            model.addAttribute("successSave", "false");
            model.addAttribute("selectedOrder", selectedOrder);
        }

        //setting "orders" attribute
        model.addAttribute("orders", orders);

        return "/orders/edit";
    }

    @PostMapping(value = "/orders/edit/submit", params = "Cancel") //cancelling the editing of an selectedOrder
    public String cancelEditOrder(ModelMap model) {
        return listOrders(model);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/orders/delete", params = {"id"}) //deleting an order by a passed id (only for admins)
    public String deleteOrderById(ModelMap model, @RequestParam("id") Long id) {

        if (orderService.deleteOrderByID(id)) { model.addAttribute("successDelete", true); }
        else{ model.addAttribute("successDelete", false); }
        return listOrders(model);
    }

    @PostMapping("/products/do-orderproduct") //adding a product to the wishlist/basket
    public String addOrderProduct(ModelMap model, HttpServletRequest request) {

        //get user and product from database with userId and productId
        User user = userService.getUserById(Long.valueOf(request.getParameter("userid")));
        Product product = productService.getProductById(Long.valueOf(request.getParameter("productid")));

        //request typeId (rent of buy)
        Integer typeId= Integer.valueOf(request.getParameter("typeid"));

        //initialize empty order
        Order order = new Order();

        //check if an order for user exists with order_status 0 : wishlist
        if (orderService.getOrderByUserByStatus(user, 0) == null){
            //user doesn't have a current wishlist open
            //add new wishlist order and add basic info to initialized new order
            order.setStatus(0);
            order.setUser(user);
            order.setDateCreated(LocalDate.now());
            order.setDateCollect(LocalDate.now());
            order.setDeliveryCity(user.getCity());
            order.setDeliveryNumber(user.getNumber());
            order.setDeliveryPostalcode(user.getPostalcode());
            order.setDeliveryStreet(user.getStreet());
            if(! orderService.addOrder(order)) {
                //display error for failing of saving order in database
                //redirect to basic error page
                return "error/basic";
            }
        }

        //get wishlist order from database
        //always from database so that in case of new wishlist order initialization also the ID from database is known
        order = orderService.getOrderByUserByStatus(user, 0);

        //create orderProduct object and add default values
        OrderProduct orderProduct = new OrderProduct();
        orderProduct.setAmount(1);
        orderProduct.setDiscountPrice(0.00);
        orderProduct.setReturned(false);
        orderProduct.setOrder(order);
        orderProduct.setProduct(product);
        orderProduct.setOrderType(typeId);
        // check if no orderProducts exist in the order
        if(order.getOrderProducts() == null) { //no orderProducts exist in the order

            //initialize new list of orderProducts
            Set<OrderProduct> orderlist = new HashSet<>();
            //add the new orderProduct to the new list of orderProducts
            orderlist.add(orderProduct);
            //add the list of orderProducts to the order
            order.setOrderProducts(orderlist);
            //check if the product is bought (buy -> typeId = 1) or rent (rent = all typeIs except 1)
            if (typeId == 1) {  //buy product
                orderProduct.setPrice(product.getBuyPrice());
            } else {            //rent product
                Integer weeks = Integer.valueOf(request.getParameter("weeks"));
                orderProduct.setPrice(product.getRentPrice() * weeks);
                orderProduct.setRentDurationWeeks(weeks);
            }
        }
        else { //already orderProducts exist in the order
            // loop list of orderProducts to check if already an orderProduct exists for same product and for same type (rent of buy)
            for (OrderProduct op : order.getOrderProducts()) {
                if (op.getProduct().equals(product) && op.getOrderType().equals(typeId)) {
                    // if orderProduct with type already exists on list orderProducts
                    orderProduct = op;

                    if (typeId == 1) {  //buy product
                        orderProduct.setAmount(orderProduct.getAmount() + 1);
                        orderProduct.setPrice(product.getBuyPrice());

                    } else {            //rent product
                        Integer weeks= Integer.valueOf(request.getParameter("weeks"));
                        orderProduct.setPrice(product.getRentPrice()* weeks);
                        orderProduct.setRentDurationWeeks(weeks);
                    }
                } else {

                    if (typeId == 1) {  //buy product
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
            //display error for failing of saving order in database
            //redirect to basic error page
            return "error/basic";
        }

        // Generate list of orderproducts for basket view
        List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);

        //make returnMessage empty
        String returnMessage="";
        //setting all attributes necessary for return view (basket)
        model.addAttribute("returnmessage",returnMessage);
        model.addAttribute("orderId", order.getId());
        model.addAttribute("orderProducts", orderProducts);
        model.addAttribute("userRecord",user);
        model.addAttribute("viewTitle","Winkelmandje");
        return "/orderproducts/basket";
    }

    @PostMapping("/products/do-ordercomplete") //completion of an order -> by selecting complete in basket/wishlist
    public String completeOrder(ModelMap model, HttpServletRequest request) {

        //Retrieve order from database via orderId
        Order order = orderService.getOrderById(Long.valueOf(request.getParameter("orderId")));

        //Initialize returnMessage
        String returnMessage = "";

        //Change buyStock amount from the bought products
        //Change rentStock amount from the rent products
        for (OrderProduct op : order.getOrderProducts()) {
            //for each product in the order, reduce amount of stock
            //check orderType (buy = 1, rent = 2, pre-order = 3)
            if(op.getOrderType()==2)   //rent
            {
                //check if rentStock is sufficient
                if(op.getProduct().getRentStock()>=1){ op.getProduct().setRentStock(op.getProduct().getRentStock()-1); }
                else {
                    //insufficient rentStock -> setting returnMessage
                    returnMessage ="Van product:" + op.getProduct().getName() + " zijn momenteel alle exemplaren verhuurd.";
                    //setting all attributes necessary for return view (basket)
                    model.addAttribute("successSave",false);
                    model.addAttribute("returnmessage",returnMessage);
                    model.addAttribute("userRecord", order.getUser());
                    model.addAttribute("orderId", order.getId());
                    model.addAttribute("orderProducts", orderProductService.getOrderProductsByOrder(order));
                    model.addAttribute("viewTitle","Winkelmandje");
                    return "orderproducts/basket";
                }
            }
            else //buy
            {
                //get amount available in stock
                int buyStock = op.getProduct().getBuyStock();
                //check if buyStock amount is sufficient
                if(buyStock >= op.getAmount())  //stock is ok
                {
                    Product product =  op.getProduct();
                    product.setBuyStock(buyStock-op.getAmount());
                    // update via
                    productService.updateProduct(product);
                }
                else
                {
                    //insufficient buyStock -> setting returnMessage
                    returnMessage ="Er is onvoldoende stock van volgend product:" + op.getProduct().getName() + ". Momenteel zijn er slechts " + buyStock + " producten in stock.";
                    //setting all attributes necessary for return view (basket)
                    model.addAttribute("successSave",false);
                    model.addAttribute("returnmessage",returnMessage);
                    model.addAttribute("userRecord", order.getUser());
                    model.addAttribute("orderId", order.getId());
                    model.addAttribute("orderProducts", orderProductService.getOrderProductsByOrder(order));
                    model.addAttribute("viewTitle","Winkelmandje");
                    return "orderproducts/basket";
                }
            }
        }

        //Retrieving alternative delivery address
        String provided_street = request.getParameter("deliveryStreet");
        String provided_nr = request.getParameter("deliveryNumber");
        Integer provided_postalcode = Integer.valueOf(request.getParameter("deliveryPostalcode"));
        String provided_city = request.getParameter("deliveryCity");

        //checking if alternative delivery address values are different form the known delivery address.
        //if different than change order delivery address info
        if(!order.getDeliveryStreet().equals(null)){if(!order.getDeliveryStreet().equals(provided_street)) { order.setDeliveryStreet(provided_street); }}
        if(!order.getDeliveryNumber().equals(null)){if(!order.getDeliveryNumber().equals(provided_nr)) { order.setDeliveryNumber(provided_nr); }}
        if(order.getDeliveryPostalcode() != provided_postalcode) { order.setDeliveryPostalcode(provided_postalcode); }
        if(!order.getDeliveryCity().equals(null)){if(!order.getDeliveryCity().equals(provided_city)) { order.setDeliveryCity(provided_city); }}

        //complete order and close basket
        order.setStatus(1);
        //save all changes
        Boolean bool= orderService.updateOrder(order);
        //return to "my orders" page
        return listOrders(model);
    }

    @RequestMapping(value = "/orderproducts/basket") //retrieving the basket/wishlist for the logged in user
    public String dataOrderProductsByUserCard(ModelMap model) {
        //get logged-in user
        User user;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);

            //get order from user where state is 0 (wishlist/basket)
            Order order = orderService.getOrderByUserByStatus(user,0);

            //check if "wishlist" order (with state =0) exists
            if(order!= null) { //"wishlist" order is available

                //retrieve orderProducts from order in database
                List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);
                //setting all attributes necessary for return view (basket)
                String returnMessage = "";
                model.addAttribute("returnmessage", returnMessage);
                model.addAttribute("orderProducts", orderProducts);
                model.addAttribute("orderId", order.getId());
                model.addAttribute("userRecord", user);
            }
            else
            {   //no products in the basket
                List<OrderProduct> orderProducts = null;
            }
            model.addAttribute("viewTitle", "Winkelmandje");
            return "orderproducts/basket";
        }

        //no logged in user available
        return "/login";
    }

    @RequestMapping(value = "/orderproducts/basket" , params= {"orderProductID","inputnumber"}) //editing of input values in the basket/wishlist view
    public String dataOrderProductsByOrderID(ModelMap model, @RequestParam("orderProductID") Long orderProductID, @RequestParam("inputnumber") Integer inputnumber) {
        //get logged-in user
        User user = new User();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);

            //get order from user where state is 0 (wishlist/basket)
            Order order = orderService.getOrderByUserByStatus(user,0);

            //edit number depending product type
            OrderProduct orderProduct = orderProductService.getOrderProductById(orderProductID);

            //initializing boolean for checking stock
            boolean stockcheck;
            int stock=0;

            //changing product amount depending of orderType (buy(1) , rent(2) or preorder(3))
            switch (orderProduct.getOrderType()) {
                case 2:
                    // rent
                    stock = orderProduct.getProduct().getRentStock();
                    if(stock >= 1) {
                        orderProduct.setRentDurationWeeks(inputnumber);
                        stockcheck=true;
                    }
                    else { stockcheck=false;}
                    break;
                case 1:
                case 3:
                    // buy (orderType = 1)
                    // preorder (orderType = 2)
                    stock = orderProduct.getProduct().getBuyStock();
                    if(stock >= inputnumber) {
                        orderProduct.setAmount(inputnumber);
                        stockcheck=true;
                    }
                    else { stockcheck=false; }
                    break;
                default:
                    stockcheck=false;
                    break;
            }

            //Initializing return message
            String returnMessage="";

            //check if current stock is sufficient
            if(stockcheck) { // if sufficient stock -> save changes in db
                if(orderProductService.updateOrderProduct(orderProduct)) { returnMessage = "Het aantal werd aangepast."; }
                else { returnMessage = "De aanpassing werd niet doorgevoerd."; }
            }
            else { returnMessage ="Er is onvoldoende stock. Momenteel zijn er slechts " + stock + " producten in stock."; }

            /*orderProductService.updateOrderProduct(orderProduct);*/

            // Get input for view
            List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(order);
            boolean successSave=stockcheck;
            //setting all attributes necessary for return view (basket)
            model.addAttribute("successSave",successSave);
            model.addAttribute("returnmessage",returnMessage);
            model.addAttribute("userRecord", user);
            model.addAttribute("orderId", order.getId());
            model.addAttribute("orderProducts", orderProducts);
            model.addAttribute("viewTitle","Winkelmandje");

            return "orderproducts/basket";
        }

        //unable to retrieve a logged in user
        return "/login";
    }

    @RequestMapping(value = "/orderproducts/basket", params = {"prodid"}) //Used for deleting a orderProduct record in basket/wishlist view by the user
    public String deleteOrderProductByProdId(ModelMap model, @RequestParam("prodid") Long id) {

        //retrieve order from database based on orderProductId (id = param prodid)
        Order order = orderProductService.getOrderProductById(id).getOrder();
        Long orderID = order.getId();

        //get logged-in user
        User user = new User();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);

            //Initialize list of new orderProducts
            List<OrderProduct> orderProducts;

            //try to delete orderProduct by orderProductId (id = param prodid)
            if (orderProductService.deleteOrderProductByID(id)) {

                model.addAttribute("successDelete", true);

                //check if order is empty
                if(orderProductService.getOrderProductsByOrder(order).size() == 0){
                    //in case of empty order set orderProducts null
                    orderProducts = null;
                    //delete order in case order has no orderProducts
                    orderService.deleteOrderByID(orderID);
                }
                else {
                    //actions if order is not empty
                    orderProducts = orderProductService.getOrderProductsByOrder(order);
                }
            }
            else {
                //actions in case deleting orderProduct from database failed
                model.addAttribute("successDelete", false);
                orderProducts = orderProductService.getOrderProductsByOrder(order);
            }

            String returnmessage = "";
            //setting all attributes necessary for return view (basket)
            model.addAttribute("returnmessage", returnmessage);
            model.addAttribute("orderProducts", orderProducts);
            model.addAttribute("orderId", orderID);
            model.addAttribute("userRecord", user);
            model.addAttribute("viewTitle", "Winkelmandje");
            return "/orderproducts/basket";
        }

        //unable to retrieve a logged in user
        return "/login";
    }

    @RequestMapping(value = "/orderproducts/edit" , params= {"orderID"}) //returns a list of orderProducts based on logged in user and selected OrderId
    public String listOrderProducts(ModelMap model, @RequestParam("orderID") Long orderID) {

        //initialize new list of orderProducts
        List<OrderProduct> orderProducts = new ArrayList<>();

        //initialize new selectedOrderProduct
        OrderProduct selectedOrderProduct = new OrderProduct();

        //get order from database via the orderID
        Order selectedOrder = orderService.getOrderById(orderID);

        //get logged in user
        User user;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);

            //check if user is a admin or the user is the owner of the order
            if(user.getUserType().getName().equals("ADMIN") || selectedOrder.getUser().equals(user)){
                orderProducts = orderProductService.getOrderProductsByOrder(selectedOrder);
            }
         }

        //set attributes
        model.addAttribute("orderProducts", orderProducts);
        model.addAttribute("selectedOrderProduct", selectedOrderProduct);
        model.addAttribute("viewTitle","Bestellijnen van geselecteerde bestelling");
        return "orderproducts/edit";
    }

    @RequestMapping(value = "/orderproducts/edit/detail") //return list of orderProducts
    public String orderProductsEditId(ModelMap model, @RequestParam long orderID, @RequestParam long orderProductID) {
        return editDetailOrderProduct(model,orderID,orderProductID);
    }

    @PostMapping(value = "/orderproducts/edit/detail", params = "Edit") //return list of orderProducts with a detailed list of parameters for the selected orderProductID
    public String editDetailOrderProduct(ModelMap model, @RequestParam("orderID") Long orderID, @RequestParam("orderProductID") Long orderProductID) {

        //initialize new selectedOrderProduct
        OrderProduct selectedOrderProduct;

        //initialize new list of orderProducts
        List<OrderProduct> orderProducts;

        //get logged in user
        User user;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            user = userService.getUserByEmail(currentUserName);

            //check if orderProductID not 0
            if (orderProductID != 0) {
                //actions if orderProductID not 0
                //retrieve orderProduct from database based on orderProductID
                selectedOrderProduct = orderProductService.getOrderProductById(orderProductID);

                //check if user is a admin or the user is the owner of the order
                if (user.getUserType().getName().equals("ADMIN") || selectedOrderProduct.getOrder().getUser().equals(user)) {

                    //retrieve all orderProducts from database from a the order whereto the selectedOrderProduct belongs
                    orderProducts = orderProductService.getOrderProductsByOrder(selectedOrderProduct.getOrder());
                    //set attributes
                    model.addAttribute("orderProducts", orderProducts);
                    model.addAttribute("selectedOrderProduct", selectedOrderProduct);
                    model.addAttribute("viewTitle", "Bestellijnen van geselecteerde bestelling");
                    //return view
                    return "orderproducts/edit";
                } else {
                    //user not authorised for this action, return to list of orders for the logged in user
                    return listOrders(model);
                }
            } else {

                //orderProductID = 0
                //check if orderID is not null -> if not null then return view with a list of orderProducts for that orderID
                if(orderID != 0){

                    Order order = orderService.getOrderById(orderID);
                    //check if user is a admin or the user is the owner of the order
                    if (user.getUserType().getName().equals("ADMIN") || order.getUser().equals(user))
                    { return listOrderProducts(model, orderID); }
                    else
                    {
                        //user not authorised for this action, return to list of orders for the logged in user
                        return listOrders(model);
                    }
                }
                else
                {
                    //OrderID =0 -> return to list of orders for the logged in user
                    return listOrders(model); }
            }
        }
        else
        {
            //no logged in user
            return "/login";
        }
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping(value = "/orderproducts/edit/detail", params = "Delete") //deleting an orderProduct by a passed orderProductID
    public String deleteDetailOrderProduct(ModelMap model, @RequestParam("orderID") Long orderID, @RequestParam("orderProductID") Long orderProductID) {

        if (orderProductService.deleteOrderProductByID(orderProductID)) { model.addAttribute("successDelete", true); }
        else{ model.addAttribute("successDelete", false); }
        return listOrderProducts(model, orderID);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping(value = "/orderproducts/edit/submit", params = "Save") //saving the editing of an orderProduct
    public String editOrderProduct(@Valid @ModelAttribute("selectedOrderProduct") OrderProduct selectedOrderProduct, BindingResult result, ModelMap model) {

        //check if bound selectedOrderProduct has errors
        if (result.hasErrors()) {
            //when result has errors -> return view with selectedOrderProduct with errors so they get shown
            List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(orderService.getOrderById(selectedOrderProduct.getOrder().getId()));
            model.addAttribute("orderProducts", orderProducts);
            model.addAttribute("successSave", null);
            model.addAttribute("selectedOrderProduct", selectedOrderProduct);
            model.addAttribute("viewTitle","Bestellijnen van geselecteerde bestelling");
            return "/orderproducts/edit";
        }

        //no result errors
        //check if update orderProduct is successful
        if (orderProductService.updateOrderProduct(selectedOrderProduct)) {
            //update successful
            //set attributes for successful save and return a empty new orderProduct so that only list get shown
            model.addAttribute("successSave", true);
            model.addAttribute("selectedOrderProduct", new OrderProduct());

        }
        else{
            //update failed
            //set attributes for unsuccessful save and return a the selectedOrderProduct so that also the detailed list for the orderProduct values gets shown
            model.addAttribute("successSave", false);
            model.addAttribute("selectedOrderProduct", selectedOrderProduct);
        }

        //get list of orderProducts from database
        List<OrderProduct> orderProducts = orderProductService.getOrderProductsByOrder(selectedOrderProduct.getOrder());

        //set attributes
        model.addAttribute("orderProducts", orderProducts);
        model.addAttribute("viewTitle","Bestellijnen van geselecteerde bestelling");

        //return view
        return "orderproducts/edit";
    }

    @PostMapping(value = "/orderproducts/edit/submit", params = "Cancel") //cancelling the editing of an selectedOrderProduct
    public String cancelEditOrderProduct(@ModelAttribute("selectedOrderProduct") OrderProduct selectedOrderProduct, BindingResult result, ModelMap model) {
        return listOfOrderProductsByOrderID(model,selectedOrderProduct.getOrder().getId());
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/orderproducts/delete", params = {"id"}) //deleting an orderProduct by a passed orderProductID
    public String deleteOrderProductById(ModelMap model, @RequestParam("id") Long id) {
        Long orderID = orderProductService.getOrderProductById(id).getOrder().getId();
        return deleteDetailOrderProduct(model, orderID, id);
    }
}

