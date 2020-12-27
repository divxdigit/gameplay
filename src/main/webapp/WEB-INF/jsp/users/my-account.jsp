<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Styles CSS -->
    <link href="/static/css/styles.css" rel="stylesheet">

    <!--Datatables CSS-->
    <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet">

    <title>Users - edit</title>

    <%@ page import="be.thomasmore.graduaten.gameplay.entity.User" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.UserType" %>
    <%@ page import="java.util.List" %>


    <jsp:include page="../navigation.jsp" />

</head>
<body>

<% User myUser = (User) request.getAttribute("myUser");
    if(myUser.getId()!=null){
%>
<div class="container mb-3 mt-3" style="margin-top: 25px ">
    <div class="row card shadow p-3 mb-5 bg-white rounded " style="margin-top: 25px ">
        <div class="card shadow p-3 mb-5 bg-white rounded " style="margin-top: 25px;">
            <form:form action="/users/my-account/submit" method="POST" modelAttribute="myUser" >

                <div class="row"><h1 style="margin-left:15px;">Algemene info</h1></div>
                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label for="id">UserID</label>
                        <form:input readonly="true" type="text" class="form-control" id="id" path="id" placeholder="UserID" value="<%=myUser.getId()%>"/>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="firstName">Voornaam</label>
                        <form:input  readonly="false" type="text" class="form-control" id="firstname" path="firstname" placeholder="Voornaam" value="<%=myUser.getFirstname()%>"/>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="firstname">Achternaam</label>
                        <form:input readonly="false" type="text" class="form-control" id="lastname" path="lastname" placeholder="Achternaam" value="<%=myUser.getLastname()%>"/>
                    </div>

                    <div class="form-group col-md-6">

                        <label for="birthdate">Geboortedatum</label>
                        <form:input type="date" class="form-control" id="birtdate" path="birthdate" placeholder="Geboortedatum" value="<%=myUser.getBirthdate()%>"/>
                        <div class="invalid-feedback d-block">
                            <form:errors path ="birthdate"/>
                        </div>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="email">Email</label>
                        <form:input readonly="false" type="text" class="form-control" id="email" path="email" placeholder="Email" value="<%=myUser.getEmail()%>"/>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="street">Straat</label>
                        <form:input type="text" class="form-control" id="street" path="street" placeholder="Straat" value="<%=myUser.getStreet()%>"/>
                        <div class="invalid-feedback d-block">
                            <form:errors path ="street"/>
                        </div>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="number">Huisnummer</label>
                        <form:input type="text" class="form-control" id="number" path="number" placeholder="Huisnummer" value="<%=myUser.getNumber()%>"/>
                        <div class="invalid-feedback d-block">
                            <form:errors path ="number"/>
                        </div>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="postalcode">Postcode</label>
                        <form:input type="text" class="form-control" id="postalcode" path="postalcode" placeholder="Postcode" value="<%=myUser.getPostalcode()%>"/>
                        <div class="invalid-feedback d-block">
                            <form:errors path ="postalcode"/>
                        </div>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="city">Gemeente</label>
                        <form:input type="text" class="form-control" id="city" path="city" placeholder="Gemeente" value="<%=myUser.getCity()%>"/>
                        <div class="invalid-feedback d-block">
                            <form:errors path ="city"/>
                        </div>
                    </div>

                    <div class="form-group col-md-6">
                        <form:input hidden="true" type="password" class="form-control" id="password" path="password" placeholder="Wachtwoord" value="<%=myUser.getPassword()%>"/>
                        <div class="invalid-feedback d-block">
                            <form:errors path ="password"/>
                        </div>
                    </div>

                </div>

                <%
                    if(request.getAttribute("successSave")!=null){
                        if (Boolean.valueOf(String.valueOf(request.getAttribute("successSave"))) == true){
                %>

                <div class="alert alert-success" role="alert" style="margin-top: 20px;">Wijzigen gegevens is gelukt.</div>

                <% } else { %>

                <div class="alert alert-danger" role="alert" style="margin-top: 20px;">Wijzigen gegevens is mislukt.</div>

                <%};};%>

                <form:button type="submit" name="Save" value="Save" class="btn btn-primary">Wijzig gegevens</form:button>
            </form:form>
        </div>

        <div class="card shadow p-3 mb-5 bg-white rounded ">
            <form action="/users/my-account/changepwd" method="POST">

                <div class="row"><h1 style="margin-left:15px;">Wijzig wachtwoord</h1></div>
                    <div class="form-group col-md-6">
                        <label for="userID">UserID</label>
                        <input readonly="true" type="text" class="form-control" id="userID" name="userID" placeholder="userID" value="<%=myUser.getId()%>"/>
                    </div>
                     <div class="form-row form-group col-md-6">
                        <label for="currentPwd">Huidig wachtwoord</label>
                        <input type="password" class="form-control" name="currentPwd" id="currentPwd" placeholder="Huidig wachtwoord"/>
                    </div>
                    <div class="form-row form-group col-md-6">
                        <label for="newPwd">Nieuw wachtwoord</label>
                        <input type="password" class="form-control" name="newPwd" id="newPwd" placeholder="Nieuw wachtwoord"/>
                    </div>
                    <div class="form-row form-group col-md-6">
                        <label for="repeatPwd">Herhaal wachtwoord</label>
                        <input type="password" class="form-control" name="repeatPwd" id="repeatPwd" placeholder="Herhaal nieuw wachtwoord"/>
                    </div>

                    <%
                        if(request.getAttribute("successChangePwd")!=null){
                            if (Boolean.valueOf(String.valueOf(request.getAttribute("successChangePwd"))) == true){
                    %>

                    <div class="alert alert-success" role="alert" style="margin-top: 20px;">Wijzigen wachtwoord is gelukt</div>

                    <% } else { %>

                    <div class="alert alert-danger" role="alert" style="margin-top: 20px;">
                        <div class="row">Wijzigen wachtwoord mislukt.</div>
                        <div class="row"><%=request.getAttribute("errorMessage")%></div>
                    </div>

                    <%};};%>

                    <button type="submit" name="Save" value="Save" class="btn btn-primary">Wijzig wachtwoord</button>
            </form>
        </div>
    </div>
</div>

<%};%>

</body>

</html>

<!-- Styles CSS -->
<link href="/static/css/styles.css" rel="stylesheet">


