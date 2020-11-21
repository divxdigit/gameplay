<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">

<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/registration.js"></script>--%>

    <title>Registratie</title>

    <%@ page import="java.util.List" %>

    <jsp:include page="../navigation.jsp" />
</head>
<body>
<div class="container" style="margin-top: 25px ">

<form:form action="/users/registration/submit" method="POST" modelAttribute="user" >
  <div class="form-row">

    <div class="form-group col-md-6">
      <label for="firstname">Voornaam</label>
      <form:input type="text" class="form-control" id="firstname" path="firstname" placeholder="Voornaam"/>
        <div class="invalid-feedback d-block">
            <form:errors path ="firstname"/>
        </div>
    </div>

      <div class="form-group col-md-6">
          <label for="lastname">Achternaam</label>
          <form:input type="text" class="form-control" id="lastname" path="lastname" placeholder="Achternaam"/>
          <div class="invalid-feedback d-block">
              <form:errors path ="lastname"/>
          </div>
      </div>

      <div class="form-group col-md-6">
          <label for="email">E-mail adres</label>
          <form:input type="email" class="form-control" id="email" path="email" placeholder="E-mail adres"/>
          <div class="invalid-feedback d-block">
              <form:errors path ="email"/>
          </div>

      </div>

    <div class="form-group col-md-6">
      <label for="password">Wachtwoord</label>
      <form:input type="password" class="form-control" id="password" path="password" placeholder="Wachtwoord"/>
        <div class="invalid-feedback d-block">
            <form:errors path ="password"/>
        </div>
    </div>

  </div>
  <form:button type="submit" value="Submit" class="btn btn-primary">Account aanmaken</form:button>

</form:form>

</div>
</body>

</html>
<!-- Bootstrap CSS -->
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/styles.css" rel="stylesheet">

<!-- jQuery, Popper.js, and Bootstrap JS-->
<%--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>--%>

