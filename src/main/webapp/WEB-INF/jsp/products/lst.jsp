<%@ page import="be.thomasmore.graduaten.gameplay.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.swing.*" %>
<%@ page import="be.thomasmore.graduaten.gameplay.entity.Genre" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en" >
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/css/styles.css" rel="stylesheet">
    <link href="/css/bootstrap.css" rel="stylesheet">

    <title>Overzicht bordspellen</title>

    <jsp:include page="../navigation.jsp" />

</head>
<body>
<div class="container  p-3 my-3" style="margin-top: 25px ">
    <div class="row">
    <h1>
        Overzicht Bordspellen
    </h1>
        <p>
            Hieronder vind u een lijst met alle beschikbare bordspellen. U kan ook de zoekfunctie gebruiken voor het zoeken op naam.
        </p>
    </div>
    <div class="row">
        <div class="col-sm-4 table-responsive ">
            <form class="form-inline my-2 my-md-2" method="get" action="/products/search">
                <input class="form-control" type="text" placeholder="Geef naam" name="searchString">
                <button class="btn btn-info" id="button-id" type="submit">Zoeken
                    <img src="/icons/search.svg" width="20" height="20" fill="none"/>
                </button>
            </form>
        </div>
        <div class="col-sm-4 table-responsive ">
            <form class="form-inline my-2 my-md-2" method="get" action="/products/search">
                <select class="form-control" name="genreId">
                    <%  List<Genre> genres2 = (List<Genre>) request.getAttribute("genres");
                        for (Genre genre: genres2) { %>
                    <option value="<%= genre.getId() %>"><%= genre.getName() %></option>
                    <%} %>
                </select>
                <button class="btn btn-info" id="button=id2" type="submit">Zoeken
                    <img src="/icons/search.svg" width="20" height="20" fill="none"/>

                </button>
            </form>
        </div>
        <div class="col-sm-4 table-responsive ">
            <form class="form-inline my-2 my-md-2" method="get" action="/products/lst">
                <button class="btn btn-info" id="button-id3" type="submit">Toon Alles
                    <img src="/icons/search.svg" width="20" height="20" fill="none"/>
                </button>
            </form>
        </div>
    </div>

        <br />
        <%--<%  List<Genre> genres = (List<Genre>) request.getAttribute("genres");
            for (Genre genre: genres) { %>
                <p><%=genre.getName()%></p>
             <%} %>--%>
<sec:authorize access="hasAnyAuthority('ADMIN')">
    <div class="row">
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
            %>
                <table border='1' class="table table-md table-light table-hover table-bordered  " >
                    <tr>
                        <th>Id</th>
                        <th>Info</th>
                        <th>Naam</th>
                        <th>Leeftijdscategorie</th>
                        <%--<th>Genre</th>
                        <th>Taal</th>--%>
                        <th>Prijs Verkoop</th>
                        <th>Stock Verkoop</th>
                        <th>Prijs Verhuur</th>
                        <th>Stock Verhuur</th>
                        <%--<th>Detail</th>--%>
                        <th>Acties</th></tr>

                <%--//Als er geen producten beschikbaar zijn of wanneer de search-string geen resultaten oplevert.--%>
                <% if (products.isEmpty()) {
                %>
                    <tr>
                        <td colspan = "7" class="error"> Er werden geen producten gevonden.</td>
                    </tr>
                <% } else {%>
                <%--//Wanneer er wel producten zijn gegeven, wordt de tabel opgebouwd met de verkregen gegevens.--%>
                    <% for (Product product: products) {
                    %>
                    <tr >
                        <td><%=product.getId()%></td>
                        <td><a href="/products/search?id=<%=product.getId()%>">
                                <img src="/icons/info-circle.svg" width="15" height="15" fill="none"/>
                            </a>
                        </td>
                        <td>
                            <b><%=product.getName()%></b>
                            <br/><%=product.getLanguage()%> - <%=product.getGenre()%>
                        </td>
                        <td><%=product.getAgeCategory()%></td>
                        <%--<td><%=product.getGenre()%></td>
                        <td><%=product.getLanguage()%></td>--%>
                        <td><%=product.getBuyPrice()%> euro</td>
                        <% if (product.getBuyStock() ==0 ) {%>
                            <td style="color:darkred;">
                                <b><%=product.getBuyStock()%></b>
                                <%--<a href="/products/search?id=<%=product.getId()%>">
                                    <img src="/icons/plus-circle-fill.svg" width="15" height="15" fill="none"/>
                                </a>--%>
                            </td>
                        <% } else { %>
                            <td><%=product.getBuyStock()%>
                                <%--<a href="/products/search?id=<%=product.getId()%>">
                                    <img src="/icons/plus-circle-fill.svg" width="15" height="15" fill="none"/>
                                </a>--%>
                            </td>
                        <% } %>
                            <td><%=product.getRentPrice()%> euro</td>
                        <% if (product.getRentStock() ==0 ) {%>
                        <td style="color:darkred;"><b><%=product.getRentStock()%></b></td>
                        <% } else { %>
                            <td><%=product.getRentStock()%></td>
                        <% } %>
                        <%--<td> <a href="/products/search?id=<%=product.getId()%>">Meer info </a></td>--%>
                        <td>
                                <a class="btn btn-primary" href="/products/edit?id=<%=product.getId()%>" role="button">Wijzig</a>
                                <a class="btn btn-primary" href="/products/delete?id=<%=product.getId()%>" role="button">Verwijder</a>
                        </td>
                    </tr>
                    <% } %>
                <% } %>
                </table>

    </div>
    <div class="row">
        <a href=/products/create>Nieuws spel toevoegen</a>
        <br/><br/>
    </div>
</sec:authorize>



    <div class="row">
    <%
        List<Product> products2 = (List<Product>) request.getAttribute("products");
        //Als er geen producten beschikbaar zijn of wanneer de search-string geen resultaten oplevert.
        if (products2.isEmpty()) {
            out.print("<tr><td colspan = \"7\" class=\"error\"> Er werden geen producten gevonden.</td>");
        }
        //Wanneer er wel producten zijn gegeven, wordt de tabel opgebouwd met de verkregen gegevens.
        for (Product product: products2) {
    %>

        <div class="col-sm-4  ">
            <div class="card shadow p-3  bg-white rounded" style="margin-bottom: 15px; " >
                <% if(product.getPicture() =="") { %>
                <svg  height="300" fill="currentColor">
                    <use xlink:href="/icons/bootstrap-icons.svg#image" />
                </svg>
                <% } else { %>
                <div><img src="<%= product.getPicture()%>" alt="<%= product.getName()%>" height="150"></div>
                <% } %>

               <%-- <svg  width="150" height="150" fill="currentColor">
                    <use xlink:href="/icons/bootstrap-icons.svg#image" />
                </svg>--%>
                <div class="card-title">
                    <h4><%= product.getName() %></h4>
                    <h5><i>(<%= product.getPublisher() %>)</i></h5>
                    <hr />
                </div>
                <div>
                    <p class="card-text"><b>Leeftijdscategorie:</b> <%=product.getAgeCategory() %>
                    <br /> <b>Aantal spelers:</b> <%=product.getPlayersMinimum() %> - <%=product.getPlayersMaximum() %>
                    <br /><b>Taal:</b> <%=product.getLanguage() %></p>
                    <%--<a href=/products/search?id=<%=product.getId()%>>Meer info </a>--%>
                </div>
                <%--<div class="card-body">--%>
                    <div>
                    <a href=/products/search?id=<%=product.getId()%> class="card-link" >Meer info </a>
                    <hr />
                    <% if (product.getRentStock() > 0) {%>
                        <p><a href=/products/rent?id=<%=product.getId()%> class="card-link" >Leen dit spel - <%=product.getRentStock()%> stuk(s) beschikbaar</a></p>
                    <%   } else  { %>
                    <p>Er is geen spel beschikbaar voor uitleen.</p>
                    <% } %>
                    <hr />
                    <% if (product.getBuyStock() > 0) {%>
                    <p><a href=/products/buy?id=<%=product.getId()%> class="card-link" >Koop dit spel voor <%=product.getBuyPrice()%> euro.</a></p>
                    <%   } else  { %>
                    <p>Het spel is niet in voorraad voor verkoop.</p>
                    <% } %>
                </div>
            </div>
        </div>
        <% } %>

    </div>


</div>

</body>

</html>
