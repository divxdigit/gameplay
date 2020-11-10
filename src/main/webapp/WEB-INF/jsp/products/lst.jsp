<%@ page import="be.thomasmore.graduaten.gameplay.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.swing.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>

<html lang="en" >
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/static/css/styles.css" rel="stylesheet">
    <link href="/static/css/bootstrap.css" rel="stylesheet">

    <title>GamePlay - Bordspellen</title>

    <jsp:include page="../navigation.jsp" />

</head>
<body>
<div class="container" style="margin-top: 25px ">
    <div class="col-md-8">
    <h1>
        Overzicht Bordspellen
    </h1>
        <p>
            Hieronder vind u een lijst met alle beschikbare bordspellen. U kan ook de zoekfunctie gebruiken voor het zoeken op naam.
        </p>
    </div>
    <div class="col-md-10 table-responsive ">
        <form class="form-inline my-2 my-md-2" method="get" action="/products/search">
            <input class="form-control" type="text" placeholder="Geef naam" name="searchString">
            <button class="btn btn-info" id="button-id" type="submit">Zoeken
                <img src="/icons/search.svg" width="20" height="20" fill="none"/>

            </button>
        </form>
        <br />


            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                out.print("<table border='1' class=\"table table-md table-light table-hover table-bordered  \" >");
                out.print("<tr><th>Id</th><th>Naam</th><th>Leeftijdscategorie</th><th>Genre</th><th>Taal</th><th>Verkooprijs</th><th>Huurprijs (per week)</th><th>Detail</th><th>Acties</th></tr>");

                //Als er geen producten beschikbaar zijn of wanneer de search-string geen resultaten oplevert.
                if (products.isEmpty()) {
                    out.print("<tr><td colspan = \"7\" class=\"error\"> Er werden geen producten gevonden.</td>");
                }
                //Wanneer er wel producten zijn gegeven, wordt de tabel opgebouwd met de verkregen gegevens.
                for (Product product: products) {
                    out.print("<tr><td>" + product.getId() + "</td>");
                    out.print("<td>" + product.getName() + "</td>" );
                    out.print("<td>" + product.getAgeCategory() + "</td>" );
                    out.print("<td>" + product.getGenre() + "</td>" );
                    out.print("<td>" + product.getLanguage() + "</td>" );
                    out.print("<td>" + product.getBuyPrice() + " euro</td>" );
                    out.print("<td>" + product.getRentPrice() + " euro</td>" );
                    out.print("<td> <a href=\"/products/search?id="+product.getId()+"\">Meer info </a></td>" );
                    out.print("<td><a href=\"/products/edit.jsp?id="+product.getId()+"\">Edit | <a href=\"delete-product.jsp?id="+product.getId()+"\"> Delete</a></td>" );
                    out.print("</tr>");
                }
                out.print("</table>");
            %>

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

<%--        <%
            List<Product> products2 = (List<Product>) request.getAttribute("products");
            //Als er geen producten beschikbaar zijn of wanneer de search-string geen resultaten oplevert.
            if (products2.isEmpty()) {
                out.print("<tr><td colspan = \"7\" class=\"error\"> Er werden geen producten gevonden.</td>");
            }
            //Wanneer er wel producten zijn gegeven, wordt de tabel opgebouwd met de verkregen gegevens.
            for (Product product: products2) {
        %>
    <div class="card shadow p-3 mb-5 bg-white rounded " style="margin-top: 25px ">
        <img src="..." class="card-img-top" alt="Placeholder image .."><%= product.getPicture()%>
        &lt;%&ndash;<div class="card-body">&ndash;%&gt;
            <h5 class="card-title"><%= product.getName() %> - <%= product.getPublisher() %></h5>
            <p class="card-text">
                <b>Leeftijdscategorie:</b> <%=product.getAgeCategory() %><br />
                <b>Aantal spelers:</b> <%=product.getPlayersMinimum() %> - <%=product.getPlayersMaximum() %><br />
                <b>Taal:</b> <%=product.getLanguage() %>
            </p>
        &lt;%&ndash;</div>&ndash;%&gt;
            <p class="price">
                <%= product.getBuyPrice() %>
            </p>
            <p><button>Toevoegen aan winkelmandje</button></p>
            <p class="card-deck">
                <a href=/products/search?id=<%=product.getId()%>>Meer info </a>
            </p>
        </div>--%>


 <%--       <div class="card shadow p-3 mb-5 bg-white rounded " style="margin-top: 25px ">
            <div class="m-mb-5" >

                <h2 style="border:2px;">
                <%= product.getName() %> - <%= product.getPublisher() %>
                </h2>
            </div>
            <div class="m-mb-2" >
                <p style="border:2px;">
                    Placeholder for : <%= product.getPicture()%>
                </p>
            </div>
            <div class="m-mb-3" >
                <p style="border:2px;">
                    <b>Leeftijdscategorie:</b> <%=product.getAgeCategory() %><br />
                    <b>Aantal spelers:</b> <%=product.getPlayersMaximum() %> - <%=product.getPlayersMaximum() %><br />
                    <b>Taal:</b> <%=product.getLanguage() %>
                </p>
            </div>--%>

           <%-- <div class="mb-5">
                <i><%= product.getDescription()%></i>
            </div>
        </div>--%>
<%--        <% } %>--%>
 <%--           out.print("<table border='1' class=\"table table-md table-light table-hover table-bordered  \" >");
            out.print("<tr><th>Id</th><th>Naam</th><th>Leeftijdscategorie</th><th>Genre</th><th>Taal</th><th>Verkooprijs</th><th>Huurprijs (per week)</th><th>Detail</th><th>Acties</th></tr>");

            //Als er geen producten beschikbaar zijn of wanneer de search-string geen resultaten oplevert.
            if (products.isEmpty()) {
                out.print("<tr><td colspan = \"7\" class=\"error\"> Er werden geen producten gevonden.</td>");
            }
            //Wanneer er wel producten zijn gegeven, wordt de tabel opgebouwd met de verkregen gegevens.
            for (Product product: products) {
                out.print("<tr><td>" + product.getId() + "</td>");
                out.print("<td>" + product.getName() + "</td>" );
                out.print("<td>" + product.getAgeCategory() + "</td>" );
                out.print("<td>" + product.getGenre() + "</td>" );
                out.print("<td>" + product.getLanguage() + "</td>" );
                out.print("<td>" + product.getBuyPrice() + " euro</td>" );
                out.print("<td>" + product.getRentPrice() + " euro</td>" );
                out.print("<td> <a href=\"/products/search?id="+product.getId()+"\">Meer info </a></td>" );
                out.print("<td><a href=\"/products/edit.jsp?id="+product.getId()+"\">Edit | <a href=\"delete-product.jsp?id="+product.getId()+"\"> Delete</a></td>" );
                out.print("</tr>");
            }
            out.print("</table>");
        %>--%>
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

        <div class="col-sm-4 scrollmenu ">
            <div class="card shadow p-3  bg-white rounded" style="margin-bottom: 15px; " >
                <%--<img class="card-img-top"  src="/icons/image.svg" alt="Card image cap" width="70%" />--%>
                <%--<svg class="text-success" width="150" height="150" fill="currentColor">--%>
                <svg  width="150" height="150" fill="currentColor">
                    <use xlink:href="/icons/bootstrap-icons.svg#image" />
                </svg>
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
                    <a href=/products/search?id=<%=product.getId()%> class="card-link" >Meer info </a>
                    <hr />
                    <% if (product.getRentStock() > 0) {%>
                    <p>Leen dit spel - <%=product.getRentStock()%> stuk(s) beschikbaar</p>
                    <%   } else  { %>
                    <p>Er is geen spel beschikbaar voor uitleen.</p>
                    <% } %>
                    <hr />
                    <% if (product.getBuyStock() > 0) {%>
                    <p>Koop dit spel voor <%=product.getBuyPrice()%> euro.</p>
                    <%   } else  { %>
                    <p>Het spel is niet in voorraad voor verkoop.</p>
                    <% } %>
                </div>
            </div>
        </div>
        <% } %>

    </div>


</div>
</div>
</body>

</html>
