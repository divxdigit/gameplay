<%@ page import="be.thomasmore.graduaten.gameplay.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    <title>GamePlay - Online webshop</title>

    <jsp:include page="navigation.jsp" />
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

</head>

<body>
<div class="container" style="margin-top: 25px ">
    <div class="row">
        <div class="col-md-6">
            <h2>
                Welkom
                        <sec:authorize access="isAuthenticated()">
<%--                            <sec:authentication property="principal.username" />--%>
                            <sec:authentication property="principal.firstname" />
                            <sec:authentication property="principal.lastname" />
                        </sec:authorize>
                bij Gameplay
            </h2>
            <p>GamePlay is opgericht in 2015 en is in 2020 gestart met het online verkopen van bordspellen. Bij ons kan u terecht voor bordspellen van zeer uiteenlopende genres.
            </p>
            <p>Twijfelt u tussen bepaalde spellen? Geen probleem! Bij ons in de winkel kan u bijna elk spel testen alvorens u het koopt.
            Woont u echter te ver van onze winkel? Ook hieraan hebben we gedacht. De meeste van onze spellen kan u namelijk ook huren! Benieuzd naar de prijzen? Neem snel een kijkje in ons aanbod!</p>
        </div>
        <div class="col-md-6 card bg-white rounded shadow" >  <%--#9fcdff, #b9bbbe--%>
            <div class="text-center"><u><h3>In de kijker</h3></u>
            </div>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <% List<Product> promoProducts = (List<Product>) request.getAttribute("promoProducts");%>

                    <div class="carousel-item active">
                        <a href="/products/search?id=<%= promoProducts.get(0).getId()%>"><img class="d-block w-100" src="<%= promoProducts.get(0).getPicture()%>" alt="First promo" height="500"></a>
                    </div>
                    <div class="carousel-item">
                        <a href="/products/search?id=<%= promoProducts.get(1).getId()%>"><img class="d-block w-100" src="<%= promoProducts.get(1).getPicture()%>" alt="Second promo" height="500"></a>
                    </div>
                    <div class="carousel-item">
                        <a href="/products/search?id=<%= promoProducts.get(2).getId()%>"><img class="d-block w-100" src="<%= promoProducts.get(2).getPicture()%>" alt="Third promo" height="500"></a>
                    </div>

                </div>

                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>

    <div class="card shadow p-3 mb-5 bg-white rounded " style="margin-top: 25px ">
        <h2>
            Openingsuren
        </h2>
        <p>Webshop: 24/7<br>
           Winkel:<br>
            - dinsdag tot vrijdag: 10:00u - 18:00u<br>
            - zaterdag: 11:00u - 20:00u<br>
            - maandag en zondag: gesloten
        </p>
    </div>

</div>

</body>

</html>
