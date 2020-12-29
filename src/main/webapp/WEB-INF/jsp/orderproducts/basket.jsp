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

    <title>Winkelmandje</title>

    <%@ page import="java.util.List" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.Order" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.OrderProduct" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.User" %>
    <%@ page import="java.text.DecimalFormat" %>
    <%@ page import="java.math.RoundingMode" %>

    <jsp:include page="../navigation.jsp" />

</head>
<body>

<div class="container mb-3 mt-3" style="margin-top: 25px ">
    <div class="row"><h1><%=request.getAttribute("viewTitle")%></h1></div>

<% Long id =(Long) request.getAttribute("orderId");%>
<% if (request.getAttribute("orderProducts") == null) { %>

    <div>Er bevinden zich geen producten in het winkelmandje</div>
    <div class="col-md-4 table-responsive "><a class="btn btn-primary" href="/products/lst" role="button">Verder winkelen</a></div>

<% } else { %>

    <b>OrderID: <%=id%></b>
<%
    List<OrderProduct> orderProducts = (List<OrderProduct>) request.getAttribute("orderProducts");
    double totalPrice=0;
    DecimalFormat df = new DecimalFormat("0.00");
    df.setRoundingMode(RoundingMode.UP);

    for (OrderProduct orderProduct: orderProducts) {  %>

    <table id="tblOrders" class="table table-striped table-bordered table-hover" style="width: 100%" >
        <tr>
            <td>
                <% if(orderProduct.getProduct().getPicture() =="") { %>
                <svg  height="100" fill="currentColor"><use xlink:href="/icons/bootstrap-icons.svg#image" /></svg>
                <% } else { %>
                <div><img src="<%= orderProduct.getProduct().getPicture()%>" alt="<%= orderProduct.getProduct().getName()%>" height="100"></div>
                <% } %>
            </td>
            <td>
                <b><%=orderProduct.getProduct().getName()%></b>
                <br><%=orderProduct.getProduct().getPublisher().getName()%>
                <br>    <%  int count = 0;%>
                        <%  while (count < orderProduct.getProduct().getRating()) { %>
                            <img src="/images/star.png" alt="<%= count %>" height="20" />
                        <% count++; } %>
            </td>
            <td>
                <form action="/orderproducts/basket" method="post">
                    <input class="form-control" type="hidden" name="orderProductID" id="orderProductID"  value=<%=orderProduct.getId()%> />
                    <div>
                        <%  Integer inputnumber;
                            switch(orderProduct.getOrderType()) {
                                case 2: inputnumber = orderProduct.getRentDurationWeeks();%>
                                    <label for="inputnumber">Huren - weeks</label><% break;
                                case 1: inputnumber = orderProduct.getAmount();%>
                                    <label for="inputnumber">Kopen - aantal</label><% break;
                                case 3: inputnumber =  orderProduct.getAmount();%>
                                    <label for="inputnumber"> Pre-Order - aantal</label><%  break;
                                default: throw new IllegalStateException("Unexpected value: " + orderProduct.getOrderType());
                            }%>
                        <input class="form-control" type="number" min="1" step="1" name="inputnumber" id="inputnumber"  value=<%=inputnumber%> />
                    </div>
                    <button type="submit" class="btn btn-primary">Aanpassen</button>
                </form>
            </td>
            <td>Eenheidsprijs:
                <br>
                €<%=orderProduct.getPrice()%>
                <% if(orderProduct.getDiscountPrice() >0) {%>
                    <br/><i>- €<%=orderProduct.getDiscountPrice()%></i>
                <% } %>
            </td>
            <td>Totaal prijs:
                <br><b>€ <%=df.format((orderProduct.getPrice() - orderProduct.getDiscountPrice()) * inputnumber)%></b>
                <% totalPrice += (orderProduct.getPrice() - orderProduct.getDiscountPrice()) * inputnumber; %>
            </td>
            <td>
                <a class="btn btn-primary" href="/orderproducts/basket?prodid=<%=orderProduct.getId()%>" role="button">Verwijder</a>
            </td>
        </tr>
    </table>
    <% } %>

    <form action="/products/do-ordercomplete" method="post">
        <div class="row" style="margin-top: 50px">
            <div class="col-md-4 table-responsive "><a class="btn btn-primary" href="/products/lst" role="button">Verder winkelen</a></div>
            <div class="col-md-8 table-responsive ">
                <button type="submit" class="btn btn-primary">Voltooien bestelling</button>
                Totaal te Betalen: € <%= df.format(totalPrice)%>
            </div>
        </div>
        <div class="row" style="margin-top: 50px">
            <p><b>Leveringsadres:</b>
            <br><i>Indien het leveringsadres verschillend is met de informatie die wij hebben, gelieve deze hieronder dan aan te passen.</i>
        </div>
        <div class="row">
            <div class="col-md-4 table-responsive ">

    <%User user = (User) request.getAttribute("userRecord");%>
    <%if (request.getAttribute("userRecord") != null) { %>

                <input class="form-control" type="hidden" name="orderId" id="orderId"  value=<%=(Long) request.getAttribute("orderId") %> />
                <label for="deliveryStreet">Straat</label>
                <input class="form-control" type="text" name="deliveryStreet" id="deliveryStreet" value="<%=user.getStreet()%>" />
            </div>
            <div class="col-md-4 table-responsive ">
                <label for="deliveryNumber">Nr</label>
                <input class="form-control" type="text" name="deliveryNumber" id="deliveryNumber" value="<%=user.getNumber()%>" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 table-responsive ">
                <label for="deliveryPostalcode">Postcode</label>
                <input class="form-control" type="text" name="deliveryPostalcode" id="deliveryPostalcode" value="<%=user.getPostalcode()%>" />
            </div>
            <div class="col-md-4 table-responsive ">
                <label for="deliveryCity">Gemeente</label>
                <input class="form-control" type="text" name="deliveryCity" id="deliveryCity" value="<%=user.getCity()%>" />
            </div>
        </div>
    <% } %>
    </form>

<% } %>

    <%  if(request.getAttribute("successSave")!=null){ %>
        <%  if (Boolean.valueOf(String.valueOf(request.getAttribute("successSave")))){ %>
        <div class="alert alert-success" role="alert" style="margin-top: 20px;">Het aanpassen is gelukt.</div>
        <div class="alert alert-success" role="alert" style="margin-top: 20px;"><%=request.getAttribute("returnmessage")%> </div>
        <% } else { %>
        <div class="alert alert-danger" role="alert" style="margin-top: 20px;">Het aanpassen is mislukt.</div>
        <div class="alert alert-danger" role="alert" style="margin-top: 20px;"><%=request.getAttribute("returnmessage")%> </div>
        <%};%>
    <%};%>
    <% if(request.getAttribute("successDelete")!=null){ %>
        <%  if (Boolean.valueOf(String.valueOf(request.getAttribute("successDelete")))){ %>
        <div class="alert alert-success" role="alert" style="margin-top: 20px;">Het verwijderen is gelukt.</div>
        <% } else { %>
        <div class="alert alert-danger" role="alert" style="margin-top: 20px;">Het verwijderen is mislukt.</div>
        <% };%>
    <%};%>
</div>

</body>

</html>

<!-- Styles CSS -->
<link href="/static/css/styles.css" rel="stylesheet">


