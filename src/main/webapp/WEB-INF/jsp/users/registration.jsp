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
          <label for="birthdate">Geboortedatum</label>
          <form:input type="date" class="form-control" id="birthdate" path="birthdate" placeholder="Geboortedatum"/>
          <div class="invalid-feedback d-block">
              <form:errors path ="birthdate"/>
          </div>
      </div>

      <div class="form-group col-md-6">
          <label for="street">Straat</label>
          <form:input type="text" class="form-control" id="street" path="street" placeholder="Straat"/>
          <div class="invalid-feedback d-block">
              <form:errors path ="street"/>
          </div>
      </div>

      <div class="form-group col-md-6">
          <label for="number">Huisnummer</label>
          <form:input type="text" class="form-control" id="number" path="number" placeholder="Huisnummer"/>
          <div class="invalid-feedback d-block">
              <form:errors path ="number"/>
          </div>
      </div>

      <div class="form-group col-md-6">
          <label for="postalcode">Postcode</label>
          <form:input type="text" class="form-control" id="postalcode" path="postalcode" placeholder="Postcode"/>
          <div class="invalid-feedback d-block">
              <form:errors path ="postalcode"/>
          </div>
      </div>

      <div class="form-group col-md-6">
          <label for="city">Gemeente</label>
          <form:input type="text" class="form-control" id="city" path="city" placeholder="Gemeente"/>
          <div class="invalid-feedback d-block">
              <form:errors path ="city"/>
          </div>
      </div>

      <div class="form-group col-md-6">
          <label for="email">E-mail adres</label>
          <form:input type="email" class="form-control" id="email" path="email" placeholder="E-mail adres"/>
          <div class="invalid-feedback d-block">
              <form:errors path ="email"/>
              <p><%
                  if (request.getAttribute("emailMessage")!=null){ out.print(request.getAttribute("emailMessage"));}
                  else {out.print("");};
              %></p>
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

    <%if (Boolean.valueOf(String.valueOf(request.getAttribute("success"))) == false){%>
    <div class="alert alert-danger" role="alert" style="margin-top: 20px;">Er is een probleem opgetreden met het maken van het account.</div>
        <% }; %>

</form:form>

</div>
</body>

</html>
<!-- Bootstrap CSS -->
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/styles.css" rel="stylesheet">


