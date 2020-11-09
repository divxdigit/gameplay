<%@ page import="be.thomasmore.graduaten.gameplay.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" >
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">

    <title>GamePlay - Bordspellen</title>

    <jsp:include page="navigation.jsp" />

</head>
<body>
<div class="container" style="margin-top: 25px ">
    <h1>
        Overzicht Bordspellen
    </h1>
    <div class="col-md-8 table-responsive ">

            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                out.print("<table border='1' class=\"table table-md table-light table-hover table-bordered  \" >");
                out.print("<tr><th>Id</th><th>Naam</th><th>Leeftijdscategorie</th><th>Genre</th><th>Taal</th></tr>");
                for (Product product: products) {
                    out.print("<tr><td>" + product.getId() + "</td>");
                    out.print("<td>" + product.getName() + "</td>" );
                    out.print("<td>" + product.getAgeCategory() + "</td>" );
                    out.print("<td>" + product.getGenre() + "</td>" );
                    out.print("<td>" + product.getLanguage() + "</td>" );
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
</div>
</body>

</html>
