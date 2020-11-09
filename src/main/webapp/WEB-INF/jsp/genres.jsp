<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    <title>Index</title>

<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.gameplay.entity.Genre" %>

    <jsp:include page="navigation.jsp" />
</head>
<body>
<div class="container" style="margin-top: 25px ">
<h1>
    Overzicht van Genres
</h1>

    <div class="col-md-6 table-responsive">
        <%
            List<Genre> genres = (List<Genre>) request.getAttribute("genres");
            out.print("<table border='1' class=\"table table-md table-dark table-hover  \">");
            out.print("<tr scope=\"col\"><th>Id</th><th>Naam</th></tr>");
            for (Genre genre: genres) {
                out.print("<tr><td>" + genre.getId() + "</td><td>" + genre.getName() + "</td></tr>");
            }
            out.print("</table>");
        %>
    </div>
    <div class="col-md-6>
        <form action="/genres" method="post">
            <p>
                <label for="name">Genre</label>
                <input type="text" name="name" id="name">
            </p>
            <p>
                <input type="submit" value="Voeg een nieuw genre toe.">
            </p>
        </form>
    </div>

</div>
</body>

</html>
<!-- Bootstrap CSS -->
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/styles.css" rel="stylesheet">
