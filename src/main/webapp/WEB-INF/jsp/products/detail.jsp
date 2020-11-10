<%@ page import="be.thomasmore.graduaten.gameplay.entity.Product" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>

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
<div class="container" style="margin-top: 25px ">
    <%--<div class="col-md-8">
        <h1>
            Detail Bordspel
        </h1>

    </div>--%>
    <div class="col-md-10 table-responsive ">
        <%
            if (request.getAttribute("productRecord") != null) {
                Product product = (Product) request.getAttribute("productRecord");
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        %>
        <h1><%= product.getName()%></h1>
       <%-- <div>ID: <%= product.getId()%></div>
        <div>Naam: <%= product.getName()%></div>--%>
        <div>Uitgever: <%= product.getPublisher()%></div>
        <div>Launch datum: <%= format.format(product.getDateLaunch())%></div>
        <div>Leeftijdscategory: <%= product.getAgeCategory()%></div>

        <div>Taal: <%= product.getLanguage()%></div>
        <div>Genre: <%= product.getGenre()%></div>
        <div>Geschikt aantal spelers: <%= product.getPlayersMinimum()%> - <%= product.getPlayersMaximum()%></div>
        <div>Omschrijving: <%= product.getDescription()%></div>

        <div>Beoordeling: <%= product.getRating()%></div>
        <%
        } else {
        %>
// ELSE WERKT NIET. Komt error bij retrieving object
        <h1>Oops</h1>
            <p>Sorry, het product werd niet gevonden.</p>
        <% } %>



        <%--this.id = id;
        this.name = name;
        this.description = description;
        this.genre = genre;
        this.ageCategory = ageCategory;
        this.playersMinimum = playersMinimum;
        this.playersMaximum = playersMaximum;
        this.rating = rating;
        this.rentStock = rentStock;
        this.buyStock = buyStock;
        this.publisher = publisher;
        this.picture = picture;
        this.rentPrice = rentPrice;
        this.buyPrice = buyPrice;
        this.language = language;
        this.dateLaunch = dateLaunch;
        this.active = active;--%>

    <div>

    </div>
</div>
</body>

</html>
