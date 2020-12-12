<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Styles CSS -->
    <link href="/static/css/styles.css" rel="stylesheet">

    <!--Datatables CSS-->
    <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet">

    <title>Orders - edit</title>

    <%@ page import="java.util.List" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.Order" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.OrderProduct" %>



    <jsp:include page="../navigation.jsp" />

</head>
<body>

<div class="container mb-3 mt-3" style="margin-top: 25px ">
    <div class="row">
        <h1><%=request.getAttribute("viewTitle")%></h1>
    </div>

    <script>
        $(document).ready(function() {
            $('#tblOrders').DataTable();
            $(".clickable-row").click(function() {
                window.location = $(this).data("href");
            });
        } );
    </script>
    <%
        List<OrderProduct> orderProducts = (List<OrderProduct>) request.getAttribute("orderProducts");
        for (OrderProduct orderProduct: orderProducts) {  %>

            <table id="tblOrders" class="table table-striped table-bordered table-hover" style="width: 100%" >

                        <tr  class='clickable-row' data-href='/orderproducts/edit/orderID/<%=orderProduct.getOrder().getId()%>/id/<%=orderProduct.getId()%>' style="cursor: pointer" >
                        <td><% if(orderProduct.getProduct().getPicture() =="") { %>
                            <svg  height="100" fill="currentColor">
                                <use xlink:href="/icons/bootstrap-icons.svg#image" />
                            </svg>
                            <% } else { %>
                            <div><img src="<%= orderProduct.getProduct().getPicture()%>" alt="<%= orderProduct.getProduct().getName()%>" height="100"></div>
                            <% } %>
                        </td>
                        <td><b><%=orderProduct.getProduct().getName()%></b>
                                <br/><%=orderProduct.getProduct().getPublisher().getName()%>
                                <br/>
                                    <%
                                        int count = 0;
                                        while (count < orderProduct.getProduct().getRating()) {
                                    %>
                                        <img src="/images/star.png" alt="<%= count %>" height="20" />
                                    <% count++;
                                    } %>
                        </td>
                        <td>
                            <form action="/orderproducts/basket" method="post">
                                <input class="form-control" type="hidden" name="orderProductID" id="orderProductID"  value=<%=orderProduct.getId()%> />
                                <div>
                                    <%
                                    Integer inputnumber;
                                    switch(orderProduct.getOrderType()) {
                                       case 2:
                                           inputnumber = orderProduct.getRentDurationWeeks();
                                    %>
                                        <label for="inputnumber">Huren - weeks</label>
                                    <% break;

                                        case 1:
                                            inputnumber = orderProduct.getAmount();
                                    %>
                                        <label for="inputnumber">Kopen - aantal</label>
                                    <% break;

                                        case 3:
                                            inputnumber =  orderProduct.getAmount();
                                    %>
                                        <label for="inputnumber"> Pre-Order - aantal</label>
                                    <%  break;
                                        default:
                                            throw new IllegalStateException("Unexpected value: " + orderProduct.getOrderType());
                                    }%>
                                    <input class="form-control" type="number" name="inputnumber" id="inputnumber"  value=<%=inputnumber%> />
                                </div>
                                <button type="submit" class="btn btn-primary">Aanpassen</button>
                            </form>
                        </td>
                            <td>Eenheidsprijs:
                                <br/>
                                <b>€<%=orderProduct.getPrice()%></b>
                                <% if(orderProduct.getDiscountPrice() >0) {%>
                                    <br/><i>- €<%=orderProduct.getDiscountPrice()%></i>
                                <% } %>
                            </td>
                            <td>Totaal prijs:
                                <br/>€ <%=(orderProduct.getPrice() - orderProduct.getDiscountPrice()) * inputnumber%>
                            </td>
                       <%-- <td>
                            <a class="btn btn-primary" href="/orderproducts/edit/orderID/<%=orderProduct.getOrder().getId()%>/id/<%=orderProduct.getId()%>" role="button">Edit</a>
                            <a class="btn btn-primary" href="/orderproducts/delete?id=<%=orderProduct.getId()%>" role="button">Delete</a>
                        </td>--%>

                        </tr>


            </table>
<% } %>
    <div>
        <a class="btn btn-primary" href="/products/lst" role="button">Verder winkelen</a>
    </div>
    <div>
        <a class="btn btn-primary" href="/orderproducts/do-ordercomplete" role="button">Voltooien bestelling</a>
    </div>

    <%
        OrderProduct selectedOrderProduct = (OrderProduct) request.getAttribute("selectedOrderProduct");
        if(selectedOrderProduct.getId()!=null){
    %>

    <jsp:include page="./edit-partial-view.jsp" />

    <%};%>

    <%
        if(request.getAttribute("successSave")!=null){
            if (Boolean.valueOf(String.valueOf(request.getAttribute("successSave"))) == true){
    %>

    <div class="alert alert-success" role="alert" style="margin-top: 20px;">Het aanpassen is gelukt.</div>

    <% } else { %>

    <div class="alert alert-danger" role="alert" style="margin-top: 20px;">Het aanpassen is mislukt.</div>

    <%};};%>

    <%
        if(request.getAttribute("successDelete")!=null){
            if (Boolean.valueOf(String.valueOf(request.getAttribute("successDelete"))) == true){
    %>

    <div class="alert alert-success" role="alert" style="margin-top: 20px;">Het verwijderen is gelukt.</div>

    <% } else { %>

    <div class="alert alert-danger" role="alert" style="margin-top: 20px;">Het verwijderen is mislukt.</div>

    <%};};%>
</div>

<!--Datatables JS -->
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

</body>

</html>

<!-- Styles CSS -->
<link href="/static/css/styles.css" rel="stylesheet">

