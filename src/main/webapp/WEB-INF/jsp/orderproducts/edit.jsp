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
        <h1>Orderproductenlijst</h1>
    </div>

    <script>
        $(document).ready(function() {
            $('#tblOrders').DataTable();
            $(".clickable-row").click(function() {
                window.location = $(this).data("href");
            });
        } );
    </script>

            <table id="tblOrders" class="table table-striped table-bordered table-hover" style="width: 100%" >

                <thead>
                    <tr scope=\"col\">
                        <th>OrderId</th>
                        <th>Id</th>
                        <th>Product</th>
                        <th>Huurtijd in weken</th>
                        <th>Ordertype</th>
                        <th>Prijs</th>
                        <th>Promoprijs</th>
                        <th>Acties</th>

                    </tr>
                </thead>
                <%
                    List<OrderProduct> orderProducts = (List<OrderProduct>) request.getAttribute("orderProducts");
                    for (OrderProduct orderProduct: orderProducts) { %>
                        <tr  class='clickable-row' data-href='/orderproducts/edit/orderID/<%=orderProduct.getOrder().getId()%>/id/<%=orderProduct.getId()%>' style="cursor: pointer" >
                        <td><%=orderProduct.getOrder().getId()%></td>
                        <td><%=orderProduct.getId()%></td>
                        <td><%=orderProduct.getProduct().getName()%></td>
                        <td><%=orderProduct.getRentDurationWeeks()%> </td>
                        <td><%=orderProduct.getOrderType()%></td>
                        <td><%=orderProduct.getPrice()%></td>
                        <td><%=orderProduct.getDiscountPrice()%></td>
                        <td>
                            <a class="btn btn-primary" href="/orderproducts/edit/orderID/<%=orderProduct.getOrder().getId()%>/id/<%=orderProduct.getId()%>" role="button">Edit</a>
                            <a class="btn btn-primary" href="/orderproducts/delete?id=<%=orderProduct.getId()%>" role="button">Delete</a>
                        </td>

                        </tr>

                <%    } %>
            </table>

    <div>
        <a class="btn btn-primary" href="/orders/edit" role="button">Terug naar orders</a>
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


