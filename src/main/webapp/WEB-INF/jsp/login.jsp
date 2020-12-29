<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">

    <title>log in</title>

<jsp:include page="navigation.jsp" />

</head>
<body>
<div class="container" style="margin-top: 25px ">

    <%
        if(request.getAttribute("registrationSuccess")!=null){
            if (Boolean.valueOf(String.valueOf(request.getAttribute("registrationSuccess"))) == true){
    %>

    <div class="alert alert-success" role="alert" style="margin-top: 20px;">De registratie is gelukt.</div>

    <% };};%>

    <h1>Log in</h1>

    <form action="login" method="POST" >
        <div class="form-row">

            <div class="form-group col-md-6">
                <label for="Email">E-mailadres</label>
                <input type="text" class="form-control" id="Email" name="username" placeholder="E-mailadres"/>
            </div>

            <div class="form-group col-md-6">
                <label for="password">Wachtwoord</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Wachtwoord"/>
            </div>

            <button type="submit" name="submit" value="submit" class="btn btn-primary">Inloggen</button>
        </div>
        <div class="form-row" aria-colspan="2">
            <p>Nog geen account? <a href="/users/registration">Registreer hier</a></p>
        </div>

        <%
            if(request.getAttribute("login_error")!=null){
                if (Boolean.valueOf(String.valueOf(request.getAttribute("login_error"))) == true){
        %>

        <div class="alert alert-danger" role="alert" style="margin-top: 20px;">Het inloggen is mislukt. E-mailadres en/of wachtwoord is verkeerd.</div>

        <% };};%>

      </form>
</div>

</body>

</html>
