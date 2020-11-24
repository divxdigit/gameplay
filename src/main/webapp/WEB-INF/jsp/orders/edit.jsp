<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link href="/static/css/styles.css" rel="stylesheet">
    <title>Users</title>

    <%@ page import="java.util.List" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.Order" %>

    <jsp:include page="../navigation.jsp" />
</head>
<body>
<div class="container" style="margin-top: 25px ">
    <h1>
        Orders
    </h1>
    <div class="row">
        <div class="col-md-6 table-responsive">
            <h2>Orderlijst</h2>

            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                out.print("<table border='0' class=\"table table-md table-light table-hover  \">");
                out.print("<tr scope=\"col\"><th>Id</th><th>UserID</th><th>Besteldatum</th><th>Leverdatum</th></tr>");
                for (Order order: orders) {
                    out.print("<tr><td>" + order.getId() + "</td><td>" + order.getUser().getId() + " " + order.getDateCreated() + "</td><td>" + order.getDateCollect() + "</td></tr>");
                }
                out.print("</table>");
            %>

<%--            <table border='0' class="table table-md table-light table-hover  ">
                <tr scope="col"><th>Id</th><th>UserID</th><th>Besteldatum</th><th>Leverdatum</th></tr>

                    <%
                        List<Order> orders = (List<Order>) request.getAttribute("orders");
                        for(Order order:orders){
                    %>

&lt;%&ndash;                <tr class="clickable-row" data-href="orders/edit.jsp?id="<%order.getId();%>>&ndash;%&gt;
                <tr>
                    <td><%order.getId();%></td>
                    <td><%order.getUser().getId();%></td>
                    <td><%order.getDateCreated();%></td>
                    <td><%order.getDateCollect();%></td>
                </tr>

                    <%
                        };
                    %>
            </table>--%>

        </div>
       <%-- <div class="col-md-4 card rounded" style="background-image: linear-gradient(to bottom,  white 60%, #b1dfbb ); margin-bottom: 15px;" >  &lt;%&ndash;#9fcdff, #b9bbbe&ndash;%&gt;
            &lt;%&ndash;linear-gradient(180deg, #9fcdff, white);&ndash;%&gt;
            <h2>
                Details
            </h2>

            <form>
                <div class="form-group col-md-6">
                    <label for="firstname">Voornaam</label>
                    <input type="text" class="form-control" id="firstname" placeholder="Voornaam">
                </div>

                <div class="form-group col-md-6">
                    <label for="lastname">Achternaam</label>
                    <input type="text" class="form-control" id="lastname" placeholder="Achternaam">
                </div>

                <div class="form-group col-md-6">
                    <label for="email">E-mail adres</label>
                    <input type="email" class="form-control" id="email" placeholder="E-mail adres">
                </div>

                <div class="form-group col-md-6">
                    <label for="password">Wachtwoord</label>
                    <input type="password" class="form-control" id="password" placeholder="Wachtwoord">
                </div>

                <div>
                    <select name="id">
                        <%  List<UserType> usertypes = (List<UserType>) request.getAttribute("userTypes");
                            for (UserType usertype: usertypes) { %>
                        <option value="<%= usertype.getId() %>"><%= usertype.getName() %></option>
                        <%} %>
                    </select>
                </div>

                <div class="form-group col-md-6">
                    <label for="isActive">Actief</label>
                    <input type="isActive" class="form-control" id="isActive" placeholder="Actief">
                </div>

                <button type="submit" class="btn btn-primary">Opslaan</button>

            </form>

        </div>--%>

    </div>
</div>

</div>

<%--<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>--%>

</body>

<%--jQuery(document).ready(function($) {
$(".clickable-row").click(function() {
window.location = $(this).data("href");
});
});--%>

</html>
<!-- Bootstrap CSS -->
<link href="/static/css/bootstrap.css" rel="stylesheet">
<link href="/static/css/styles.css" rel="stylesheet">