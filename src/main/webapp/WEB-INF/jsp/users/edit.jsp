<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Styles CSS -->
    <link href="/static/css/styles.css" rel="stylesheet">

    <!--Datatables CSS-->
    <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet">

    <title>Overzicht van gebruikers</title>

    <%@ page import="java.util.List" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.User" %>


    <jsp:include page="../navigation.jsp" />

</head>
<body>

<div class="container mb-3 mt-3" style="margin-top: 25px ">
    <div class="row">
        <h1>
            Gebruikers
        </h1>
    </div>

    <div class="row">
        <h1>
            <h2>Gebruikerslijst</h2>
        </h1>
    </div>

    <script>
        $(document).ready(function() {
            $('#tblUsers').DataTable();
            $(".clickable-row").click(function() {
                window.location = $(this).data("href");
            });
        } );
    </script>

            <table id="tblUsers" class="table table-striped table-bordered table-hover" style="width: 100%" >

                <thead>
                    <tr scope=\"col\">
                        <th>Id</th>
                        <th>Naam</th>
                        <th>Acties</th>
                    </tr>
                </thead>


                <%
                    List<User> users = (List<User>) request.getAttribute("users");
                    for (User user: users) { %>
                        <tr  class='clickable-row' data-href='/users/edit?id=<%=user.getId()%>' style="cursor: pointer" >
                        <td><%=user.getId()%></td>
                        <td><%=user.getFirstname()%> <%=user.getLastname()%></td>
                        <td>
                            <a class="btn btn-primary" href="/users/edit?id=<%=user.getId()%>" role="button">Wijzig</a>
                        </td>

                        </tr>

                <%    } %>

            </table>


    <%
        User selectedUser = (User) request.getAttribute("selectedUser");
        if(selectedUser.getId()!=null){
    %>

    <jsp:include page="./edit-partial-view.jsp" />

    <%};%>

    <%
        if(request.getAttribute("successSave")!=null){
            if (Boolean.valueOf(String.valueOf(request.getAttribute("successSave"))) == true){
    %>

    <div class="alert alert-success" role="alert" style="margin-top: 20px;">Het aanpassen is gelukt.</div>

    <% } else { %>

    <div class="alert alert-danger" role="alert" style="margin-top: 20px;">Het aanpassen is mislukt.</div>

    <%};};%>

</div>

<!--Datatables JS -->
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

</body>

</html>

<!-- Styles CSS -->
<link href="/static/css/styles.css" rel="stylesheet">


