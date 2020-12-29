<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Styles CSS -->
    <link href="/static/css/styles.css" rel="stylesheet">

    <!--Datatables CSS-->
    <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet">

    <title>Bestellingen</title>

    <%@ page import="java.util.List" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.Order" %>


    <jsp:include page="../navigation.jsp" />

</head>
<body>

<div class="container mb-3 mt-3" style="margin-top: 25px ">
    <div class="row">
        <h1>
            Bestellingen
        </h1>
    </div>

    <div class="row">
        <h1>
            <h2>Lijst van bestellingen</h2>
        </h1>
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
                        <th>Id</th>
                        <th>Klant</th>
                        <th>Besteldatum</th>
                        <th>Leverdatum</th>
                        <th>Acties</th>

                    </tr>
                </thead>


                <%
                    List<Order> orders = (List<Order>) request.getAttribute("orders");
                    for (Order order: orders) { %>
                        <tr  class='clickable-row' data-href='/orders/edit?id=<%=order.getId()%>' style="cursor: pointer" >
                        <td><%=order.getId()%></td>
                        <td><%=order.getUser().getFirstname()%> <%=order.getUser().getLastname()%></td>
                        <td><%=order.getDateCreated()%> </td>
                        <td><%=order.getDateCollect()%> </td>
                        <td>
                            <sec:authorize access="hasAnyAuthority('ADMIN')">
                                <a class="btn btn-primary" href="/orders/edit?id=<%=order.getId()%>" role="button">Wijzig</a>
                                <a class="btn btn-primary" href="/orders/delete?id=<%=order.getId()%>" role="button">Verwijderen</a>
                                <a class="btn btn-primary" href="/orderproducts/edit?orderID=<%=order.getId()%>" role="button">Toon bestellijnen</a>
                            </sec:authorize>

                            <sec:authorize access="hasAnyAuthority('USER')">
                                <a class="btn btn-primary" href="/orders/edit?id=<%=order.getId()%>" role="button">Toon info</a>
                                <a class="btn btn-primary" href="/orderproducts/edit?orderID=<%=order.getId()%>" role="button">Toon bestellijnen</a>
                            </sec:authorize>

                        </td>

                        </tr>

                <%    } %>

            </table>

        <%
            Order selectedOrder = (Order)request.getAttribute("selectedOrder");
            if(selectedOrder.getId()!=null){
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


