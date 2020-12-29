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

    <title>Overzicht van uitgevers</title>

<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.gameplay.entity.Publisher" %>

    <jsp:include page="../navigation.jsp" />
</head>
<body>
<div class="container" style="margin-top: 25px ">
<h1>
    Overzicht van Uitgevers
</h1>

    <div class="col-md-6 table-responsive">

        <table border='1' class="table table-striped table-bordered table-hover">
            <tr scope="col"><th>Id</th><th>Naam</th></tr>

            <% List<Publisher> publishers = (List<Publisher>) request.getAttribute("publishers");
                for (Publisher publisher: publishers) { %>
                    <tr>
                        <td><%=publisher.getId()%></td>
                        <td><%=publisher.getName()%></td>
                    </tr>

                <%};%>

         </table>
    </div>

    <div class="col-md-6">
        <form:form action="/publishers/add" method="post" modelAttribute="publisher">
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="name">Uitgever</label>
                    <form:input type="text" class="form-control" id="name" path="name" placeholder="Naam"/>
                    <div class="invalid-feedback d-block">
                        <form:errors path="name"/>
                    </div>
                </div>

            </div>
            <button type="submit" name="submit" value="submit" class="btn btn-primary">Uitgever toevoegen</button>
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
