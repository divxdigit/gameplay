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


    <jsp:include page="../navigation.jsp" />
</head>
<body>

<div class="container mb-3 mt-3" style="margin-top: 25px ">
    <h1>
        Orders
    </h1>

    <h2>Orderlijst</h2>


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
                        <th>UserID</th>
                        <th>Besteldatum</th>
                        <th>Leverdatum</th>
                    </tr>
                </thead>

            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                for (Order order: orders) {
                    out.print("<tr class='clickable-row' data-href='/products/create' style=\"cursor: pointer\" >");
                    out.print("<td>" + order.getId() + "</td>");
                    out.print("<td>" + order.getUser().getId() + "</td>");
                    out.print("<td>" + order.getDateCreated() + "</td>");
                    out.print(" <td>" + order.getDateCollect() + "</td>");
                    out.print("</tr>");

                }
            %>

            </table>
</div>

<!--Datatables JS -->
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

</body>

</html>

<!-- Styles CSS -->
<link href="/static/css/styles.css" rel="stylesheet">


