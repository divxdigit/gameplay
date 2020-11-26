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
            <h1>Verhuur</h1>
            Beste <sec:authentication property="principal.firstname" /> <sec:authentication property="principal.lastname" />,
            <br/>
            Alvorens de reservatie te bevestigen, gelieve eerst te controlleren of de gegevens in orde zijn.
            <br/><br/>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 table-responsive ">
            <h2>Gegevens over het spel</h2>
            <% if(product.getPicture() =="") { %>
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
            <br/>Prijs: <%=product.getRentPrice()%> €/week
            <br/>
            <br/>

            <%--<div>
                <form action="/products/rent" method="post">
                    <button type="submit" class="btn btn-primary">Huur nu</button>
                    <% if (product.getRentStock() < 0) { %>
                    Momenteel is er geen artikel in stock voor verhuur.
                    <% } else if (product.getRentStock() == 1)  { %>
                    Haast je, er is nog <%=product.getRentStock()%> stuk beschikbaar om uit te lenen - <%=product.getRentPrice()%> €/week
                    <% } else { %>
                    Er zijn nog <%=product.getRentStock()%> stuks beschikbaar om uit te lenen - <%=product.getRentPrice()%> €/week
                    <% } %>
                </form>
            </div>--%>


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
                    <td><sec:authentication property="principal.firstname" /></td>
                </tr>
                <tr>
                    <th scope="row">Achternaam</th>
                    <td><sec:authentication property="principal.lastname" /></td>
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
            <br/><b>Leveringsadres:</b>
            <br/><%=user.getStreet()%> <%=user.getNumber()%> <%=user.getPostalcode()%> <%=user.getCity()%>
            <br/><i>Momenteel is het nog niet mogelijk om op een andere locatie te leveren.</i>
            <% } else { %>
            <br/>No output
            <% } %>
        </div>
    <div class="row">
        <div class="col-md-12 table-responsive ">
            <h2>Bevestig</h2>
            <% if (product.getRentStock() < 0) { %>
            Momenteel is er geen artikel in stock voor verhuur.
            <% } else if (product.getRentStock() == 1)  { %>
            <form action="/products/rent" method="post">
                <button type="submit" class="btn btn-primary">Huur nu</button>
                Haast je, er is nog <%=product.getRentStock()%> stuk beschikbaar om uit te lenen - <%=product.getRentPrice()%> €/week
            </form>


            <% } else { %>
            <form action="/products/rent" method="post">
                <button type="submit" class="btn btn-primary">Huur nu</button>
                Er zijn nog <%=product.getRentStock()%> stuks beschikbaar om uit te lenen - <%=product.getRentPrice()%> €/week.
            </form>
            <% } %>
        </div>

    </div>
    <% } else { %>
    <div>No output</div>
    <% } %>
</div>
</body>

</html>
