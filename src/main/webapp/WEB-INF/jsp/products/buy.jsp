<%@ page import="be.thomasmore.graduaten.gameplay.entity.Product" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="be.thomasmore.graduaten.gameplay.entity.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en" >
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/static/css/bootstrap.css" rel="stylesheet">

    <title>GamePlay - Bordspellen</title>

    <jsp:include page="../navigation.jsp" />

</head>
<body>

<%
    if (request.getAttribute("productRecord") != null) {
        Product product = (Product) request.getAttribute("productRecord");
        /*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");*/
%>
<div class="container" style="margin-top: 25px ">
    <div class="row">
        <div class="col-md-8 table-responsive ">
            <h1>Verkoop</h1>
            Beste <sec:authentication property="principal.firstname" /> <sec:authentication property="principal.lastname" />,
            <br/>
            Alvorens de aankoop te bevestigen, gelieve eerst te controleren of de gegevens in orde zijn.
            <br/><br/>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 table-responsive ">
            <h2>Gegevens over het spel</h2>
            <% if(product.getPicture().equals("")) { %>
                <svg  height="200" fill="currentColor">
                    <use xlink:href="/icons/bootstrap-icons.svg#image" />
                </svg>
            <% } else { %>
                <div><img src="<%= product.getPicture()%>" alt="<%= product.getName()%>" height="200"></div>
            <% } %>
            <br/>Merk: <%=product.getPublisher()%>
            <br/>Spel: <%=product.getName()%>
            <br/>Taal: <%=product.getLanguage()%>
            <br/>Genre: <%=product.getGenre()%>
            <br/>Spelers: <%=product.getPlayersMinimum()%> - <%=product.getPlayersMaximum()%>
            <br/>Leeftijdscategorie: <%=product.getAgeCategory()%>
            <br/>
            <br/>Prijs: <%=product.getBuyPrice()%>€/stuk
            <br/>
            <br/>
        </div>
        <div class="col-md-6 table-responsive ">
            <%
                if (request.getAttribute("userRecord") != null) {
                    User user = (User) request.getAttribute("userRecord");
                    /*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");*/
            %>
            <h2>Uw persoonlijke gegevens</h2>
            <%--<table class="table border-0">--%>
            <table class="table" style="border:none;">
                <tbody>
                <tr>
                    <th scope="row">Voornaam</th>
                    <td><%=user.getFirstname()%></td>
                </tr>
                <tr>
                    <th scope="row">Achternaam</th>
                    <td><%=user.getLastname()%></td>
                </tr>
                <tr>
                    <th scope="row">Geboortedatum</th>
                    <td><%=user.getBirthdate()%></td>
                </tr>
                <tr>
                    <th scope="row">Email</th>
                    <td><%=user.getEmail()%></td>
                </tr>
                </tbody>
            </table>

            <br/>
            <br/><b>Facturatie adres:</b>
            <br/><%=user.getStreet()%> <%=user.getNumber()%> <%=user.getPostalcode()%> <%=user.getCity()%>
            <br/>
            <%--<br/><b>Leveringsadres:</b>
            <br/><%=user.getStreet()%> <%=user.getNumber()%> <%=user.getPostalcode()%> <%=user.getCity()%>
            <br/><i>Momenteel is het nog niet mogelijk om op een andere locatie te leveren.</i>--%>
            <% } else { %>
            <br/>No output
            <% } %>
        </div>
        <%
            if (request.getAttribute("userRecord") != null) {
                User user = (User) request.getAttribute("userRecord");
                /*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");*/
        %>
        <div class="row">
            <div class="col-md-12 table-responsive ">
                <h2>Bevestig</h2>
                <% if (product.getBuyStock() < 0) { %>
                Momenteel is er geen artikel in stock voor verkoop.
                <% } else if (product.getBuyStock() == 1)  { %>
                <form action="/products/do-orderproduct" method="post">
                    <div>
                        <%--<label for="productid">productid</label>--%>
                        <input class="form-control" type="hidden" name="productid" id="productid"  value=<%=product.getId()%> />
                    </div>
                    <div>
                        <%--<label for="userid">userid</label>--%>
                        <input class="form-control" type="hidden" name="userid" id="userid" value=<%=user.getId()%> />
                    </div>
                    <div>
                        <%--<label for="userid">typeid</label>--%>
                        <input class="form-control" type="hidden" name="typeid" id="typeid" value="1" /> <%-- 1 : buy--%>
                    </div>
                    <div><b>Facturatie adres:</b></div>
                    <div>
                        <label for="deliveryStreet">Leveringsadres</label>
                        <input class="form-control" type="text" name="deliveryStreet" id="deliveryStreet" value="<%=user.getStreet()%>" />
                    </div>
                    <div>
                        <label for="deliveryNumber">Nr</label>
                        <input class="form-control" type="text" name="deliveryNumber" id="deliveryNumber" value="<%=user.getNumber()%>" />
                    </div>
                    <div>
                        <label for="deliveryPostalcode">Postcode</label>
                        <input class="form-control" type="text" name="deliveryPostalcode" id="deliveryPostalcode" value="<%=user.getPostalcode()%>" />
                    </div>
                    <div>
                        <label for="deliveryCity">Gemeente</label>
                        <input class="form-control" type="text" name="deliveryCity" id="deliveryCity" value="<%=user.getCity()%>" />
                    </div>


                    <button type="submit" class="btn btn-primary">Koop nu voor <%=product.getBuyPrice()%> €</button>
                    Haast je, er is nog <%=product.getBuyStock()%> stuk beschikbaar.
                </form>


                <% } else { %>
                <form action="/products/do-orderproduct" method="POST">
                    <div style=“display:none”>
                        <%--<label for="productid">productid</label>--%>
                        <input class="form-control" type="hidden" name="productid" id="productid" value="<%=product.getId()%>" />
                    </div>
                    <div>
                        <%--<label for="userid">userid</label>--%>
                        <input class="form-control" type="hidden" name="userid" id="userid" value="<%=user.getId()%>" />
                    </div>
                    <div>
                        <%--<label for="userid">typeid</label>--%>
                        <input class="form-control" type="hidden" name="typeid" id="typeid" value="1" /> <%-- 1 : buy--%>
                    </div>
<%--                    <div><b>Facturatie adres:</b></div>--%>
<%--                    <div>--%>
<%--                        <label for="deliveryStreet">Leveringsadres</label>--%>
<%--                        <input class="form-control" type="text" name="deliveryStreet" id="deliveryStreet" value="<%=user.getStreet()%>" />--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <label for="deliveryNumber">Nr</label>--%>
<%--                        <input class="form-control" type="text" name="deliveryNumber" id="deliveryNumber" value="<%=user.getNumber()%>" />--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <label for="deliveryPostalcode">Postcode</label>--%>
<%--                        <input class="form-control" type="text" name="deliveryPostalcode" id="deliveryPostalcode" value="<%=user.getPostalcode()%>" />--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <label for="deliveryCity">Gemeente</label>--%>
<%--                        <input class="form-control" type="text" name="deliveryCity" id="deliveryCity" value="<%=user.getCity()%>" />--%>
<%--                    </div>--%>
                    <button type="submit" class="btn btn-primary">Koop nu voor <%=product.getBuyPrice()%> €</button>
                    Er zijn nog <%=product.getRentStock()%> stuks beschikbaar.
                </form>
                <% } %>
            </div>

        </div>
        <%}%>
    <% } else { %>
    <div>No output</div>
    <% } %>
    </div>
</div>
</body>

</html>
