<%@ page import="be.thomasmore.graduaten.gameplay.entity.Publisher" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <title>Index</title>

    <jsp:include page="navigation.jsp" />

</head>
<body>

            <h1>
                Publishers
            </h1>

            <%
                List<Publisher> publishers = (List<Publisher>) request.getAttribute("publishers");
                out.print("<table border='1'>");
                out.print("<tr><th>Id</th><th>Naam</th></tr>");
                for (Publisher publisher: publishers) {
                    out.print("<tr><td>" + publisher.getId() + "</td><td>" + publisher.getName() + "</td></tr>");
                }
                out.print("</table>");
            %>

</body>

</html>
