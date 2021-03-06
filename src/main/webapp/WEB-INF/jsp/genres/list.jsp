<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link href="/static/css/styles.css" rel="stylesheet">
    <title>Overzicht van genres</title>

<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.gameplay.entity.Genre" %>

    <jsp:include page="../navigation.jsp" />
</head>
<body>
<div class="container" style="margin-top: 25px ">
<h1>
    Overzicht van Genres
</h1>

    <div class="col-md-6 table-responsive">

        <table border='1' class="table table-striped table-bordered table-hover">
            <tr scope="col"><th>Id</th><th>Naam</th></tr>

            <% List<Genre> genres = (List<Genre>) request.getAttribute("genres");
                for (Genre genre: genres) { %>
                    <tr>
                        <td><%=genre.getId()%></td>
                        <td><%=genre.getName()%></td>
                    </tr>

                <%};%>

         </table>
    </div>

    <div class="col-md-6">
        <form:form action="/genres/add" method="post" modelAttribute="genre">
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="name">Genre</label>
                    <form:input type="text" class="form-control" id="name" path="name" placeholder="Naam"/>
                    <div class="invalid-feedback d-block">
                        <form:errors path="name"/>
                    </div>
                </div>

            </div>
            <button type="submit" name="submit" value="submit" class="btn btn-primary">Genre toevoegen</button>
        </form:form>

        <%
            if(request.getAttribute("successAdd")!=null){
                if (Boolean.valueOf(String.valueOf(request.getAttribute("successAdd"))) == true){
        %>

        <div class="alert alert-success" role="alert" style="margin-top: 20px;">Het toevoegen is gelukt.</div>

        <% } else { %>

        <div class="alert alert-danger" role="alert" style="margin-top: 20px;">Het toevoegen is mislukt.</div>

        <%};};%>

    </div>

</div>
</body>

</html>

<!-- Bootstrap CSS -->
<link href="/static/css/bootstrap.css" rel="stylesheet">
<link href="/static/css/styles.css" rel="stylesheet">
