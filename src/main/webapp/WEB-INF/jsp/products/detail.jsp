<%@ page import="be.thomasmore.graduaten.gameplay.entity.Product" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDate" %>

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
    <a href=/products/lst> Terug naar overzicht spellen</a>

    <%--<div class="col-md-8">
        <h1>
            Detail Bordspel
        </h1>

    </div>--%>
        <%
            if (request.getAttribute("productRecord") != null) {
                Product product = (Product) request.getAttribute("productRecord");
                /*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");*/
        %>

    <div class="row">
        <div class="col-md-4 table-responsive ">
            <% if(product.getPicture() =="") { %>
                <svg  height="300" fill="currentColor">
                    <use xlink:href="/icons/bootstrap-icons.svg#image" />
                </svg>
            <% } else { %>
                <div><img src="<%= product.getPicture()%>" alt="<%= product.getName()%>" height="300"></div>
            <% } %>
            <% if(product.getDateLaunch().isAfter(LocalDate.now()) ){
            %>
            <div>Beschikbaar vanaf <%= product.getDateLaunch()%></div>
            <% } else {%>
            <div>Reeds in ons assortiment sinds <%= product.getDateLaunch()%></div>
            <% } %>
            <br/>
            <div class="row">
                <div class="col-md-4 table-responsive ">
                <% if (product.getBuyStock() >0) { %>
                    <a href=/products/buy?id=<%=product.getId()%> class="card-link" >Koop dit spel</a>
                <% } else { %>
                    Momenteel is er geen artikel in stock voor aankoop.
                <% } %>
                </div>
                <div class="col-md-8 table-responsive ">
                <% if (product.getRentStock() < 0) { %>
                    Momenteel is er geen artikel in stock voor verhuur.
                <% } else if (product.getRentStock() == 1)  { %>
                    <form action="/products/rent" method="post">
                        <button type="submit" class="btn btn-primary">Huur nu</button>
                        Haast je, er is nog <%=product.getRentStock()%> stuk beschikbaar om uit te lenen - <%=product.getRentPrice()%> €/week
                    </form>

                    <br/>
                    <a href=/products/rent?id=<%=product.getId()%> class="card-link" >Huur dit spel</a>
                <% } else { %>
                <form action="/products/rent" method="post">
                    <button type="submit" class="btn btn-primary">Huur nu</button>
                </form>
                Er zijn nog <%=product.getRentStock()%> stuks beschikbaar om uit te lenen - <%=product.getRentPrice()%> €/week.
                <% } %>
                </div>
            </div>
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
        <div class="col-md-8 table-responsive ">
            <%-- <div>ID: <%= product.getId()%></div>
            <div>Naam: <%= product.getName()%></div>--%>
            <%= product.getPublisher()%>
            <h1><%= product.getName()%></h1>
            <div><%= product.getPlayersMinimum()%> tot <%= product.getPlayersMaximum()%> spelers| <%= product.getAgeCategory()%> | <%= product.getLanguage()%></div>

            <div>
                <%
                    int count = 0;
                    while (count < product.getRating()) {
                %>
                <img src="/images/star.png" alt="<%= count %>" height="20" />
                <% count++;
                } %>
            </div>
            <br />
            <%--<div>Launch datum: <%= product.getDateLaunch()%></div>--%>
            <%--<div>Leeftijdscategory: <%= product.getAgeCategory()%></div>
            <%--<div>Launch datum: <%= format.format(product.getDateLaunch())%></div>--%><%--
            <div>Taal: <%= product.getLanguage()%></div>--%>
            <div>Genre: <%= product.getGenre()%></div>
            <div>Omschrijving:
                <br/> <%= product.getDescription()%></div>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <%--<svg height="20" fill="Yellow" style="margin:0;"><use href="/icons/bootstrap-icons.svg#star-fill" /></svg>
                <svg height="20" fill="Yellow" style="margin:0;"><use href="/icons/bootstrap-icons.svg#star-fill" /></svg>
                <svg height="20" fill="Yellow" style="margin:0;"><use xlink:href="/icons/bootstrap-icons.svg#star-fill" /></svg>
                <svg height="20" fill="Yellow" style="margin:0;"><use xlink:href="/icons/bootstrap-icons.svg#star-fill" /></svg>--%>
            <div>Beoordeling: <%= product.getRating()%></div>



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
        </div>
        <% } else { %>
        <div>No output</div>
        <% } %>
    </div>

</div>
</body>

</html>
