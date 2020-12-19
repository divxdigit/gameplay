<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link href="/static/css/styles.css" rel="stylesheet">
    <title>Users</title>

    <%@ page import="java.util.List" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.User" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.UserType" %>

    <jsp:include page="../navigation.jsp" />
</head>
<body>
<div class="container" style="margin-top: 25px ">
    <h1>
        Users
    </h1>
    <div class="row">
        <div class="col-md-6 table-responsive">
            <h2>Gebruikerslijst</h2>

        <%
            List<User> users = (List<User>) request.getAttribute("users");
            out.print("<table border='0' class=\"table table-md table-light table-hover  \">");
            out.print("<tr scope=\"col\"><th>Id</th><th>Naam</th><th>Email</th><th>Actief</th></tr>");
            for (User user: users) {
                out.print("<tr><td>" + user.getId() + "</td><td>" + user.getFirstname() + " " + user.getLastname() + "</td><td>" + user.getEmail() + "</td><td>" + user.isActive() +"</td></tr>");
            }
            out.print("</table>");
        %>
        </div>
        <div class="col-md-4 card rounded" style="background-image: linear-gradient(to bottom,  white 60%, #b1dfbb ); margin-bottom: 15px;" >  <%--#9fcdff, #b9bbbe--%>
            <%--linear-gradient(180deg, #9fcdff, white);--%>
            <h2>
                Details
            </h2>

            <form>
                    <div class="form-group col-md-6">
                        <label for="firstname">Voornaam</label>
                        <input type="text" class="form-control" id="firstname" placeholder="Voornaam">
                    </div>

                    <div class="form-group col-md-6">
                        <label for="lastname">Achternaam</label>
                        <input type="text" class="form-control" id="lastname" placeholder="Achternaam">
                    </div>

                    <div class="form-group col-md-6">
                        <label for="email">E-mail adres</label>
                        <input type="email" class="form-control" id="email" placeholder="E-mail adres">
                    </div>

                    <div class="form-group col-md-6">
                        <label for="password">Wachtwoord</label>
                        <input type="password" class="form-control" id="password" placeholder="Wachtwoord">
                    </div>

                    <div>
                        <select name="id">
                            <%  List<UserType> usertypes = (List<UserType>) request.getAttribute("userTypes");
                                for (UserType usertype: usertypes) { %>
                            <option value="<%= usertype.getId() %>"><%= usertype.getName() %></option>
                            <%} %>
                        </select>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="isActive">Actief</label>
                        <input type="isActive" class="form-control" id="isActive" placeholder="Actief">
                    </div>

                <button type="submit" class="btn btn-primary">Opslaan</button>

            </form>

        </div>
    </div>

</div>

</div>
</body>

</html>
<!-- Bootstrap CSS -->
<link href="/static/css/bootstrap.css" rel="stylesheet">
<link href="/static/css/styles.css" rel="stylesheet">
