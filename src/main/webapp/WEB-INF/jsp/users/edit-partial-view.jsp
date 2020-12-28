<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Users - edit - partial view</title>

    <%@ page import="be.thomasmore.graduaten.gameplay.entity.User" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.UserType" %>
    <%@ page import="java.util.List" %>

</head>
<body>

<% User selectedUser = (User) request.getAttribute("selectedUser");
    if(selectedUser.getId()!=null){
//        User user = (User) request.getAttribute("inputUser");
%>




<form:form action="/users/edit/submit" method="POST" modelAttribute="selectedUser" >

    <div class="row"><h3>Geselecteerde Gebruiker</h3></div>

    <div class="form-row">

        <div class="form-group col-md-6">
            <label for="id">UserID</label>

             <form:input readonly="true" type="text" class="form-control" id="id" path="id" placeholder="UserID" value="<%=selectedUser.getId()%>"/>
        </div>


        <div class="form-group col-md-6">
            <label for="userType.id">Usertype</label>
            <form:select class="form-control" name="userTypeId" id="userType" path="userType.id">
                <%  List<UserType> userTypeList = (List<UserType>) request.getAttribute("userTypes");
                    for (UserType userType: userTypeList) {
                        if(selectedUser.getUserType().getId() == userType.getId()) {
                %>
                <option selected value="<%= userType.getId() %>"><%= userType.getName() %></option>
                <% } else { %>
                <option value="<%= userType.getId() %>"><%= userType.getName() %></option>
                <%} %>
                <%} %>
            </form:select>
        </div>

        <div class="form-group col-md-6">
            <label for="firstName">Voornaam</label>
             <form:input  readonly="false" type="text" class="form-control" id="firstname" path="firstname" placeholder="Voornaam" value="<%=selectedUser.getFirstname()%>"/>
        </div>

        <div class="form-group col-md-6">
            <label for="firstname">Achternaam</label>
            <form:input readonly="false" type="text" class="form-control" id="lastname" path="lastname" placeholder="Achternaam" value="<%=selectedUser.getLastname()%>"/>
        </div>

        <div class="form-group col-md-6">
            <label for="email">Email</label>
            <form:input readonly="false" type="text" class="form-control" id="email" path="email" placeholder="Email" value="<%=selectedUser.getEmail()%>"/>
        </div>

        <div class="form-group col-md-6">
            <label for="birthdate">Geboortedatum</label>
            <form:input readonly="false" type="date" class="form-control" id="birthdate" path="birthdate" placeholder="BirthDate" value="<%=selectedUser.getBirthdate()%>"/>
        </div>

        <div class="form-group col-md-6">
            <label for="street">Straat</label>
            <form:input type="text" class="form-control" id="street" path="street" placeholder="Straat" value="<%=selectedUser.getStreet()%>"/>
            <div class="invalid-feedback d-block">
                <form:errors path ="street"/>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="number">Huisnummer</label>
            <form:input type="text" class="form-control" id="number" path="number" placeholder="Huisnummer" value="<%=selectedUser.getNumber()%>"/>
            <div class="invalid-feedback d-block">
                <form:errors path ="number"/>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="postalcode">Postcode</label>
            <form:input type="text" class="form-control" id="postalcode" path="postalcode" placeholder="Postcode" value="<%=selectedUser.getPostalcode()%>"/>
            <div class="invalid-feedback d-block">
                <form:errors path ="postalcode"/>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="city">Gemeente</label>
            <form:input type="text" class="form-control" id="city" path="city" placeholder="Gemeente" value="<%=selectedUser.getCity()%>"/>
            <div class="invalid-feedback d-block">
                <form:errors path ="city"/>
            </div>
        </div>

        <div class="form-group col-md-2">
            <form:input class="form-control" type="hidden" name="password" id="password" value="<%=selectedUser.getPassword()%>" path="password"/>
        </div>
<%--        <div class="form-group col-md-2">--%>
<%--            <form:input class="form-control" type="hidden" name="wrongpasswordcounter" id="wrongpasswordcounter" value="<%=selectedUser.getWrongPasswordcounter()%>" path="wrongpasswordcounter"/>--%>
<%--        </div>--%>
        <div class="form-group col-md-6">
            <form:input class="form-check-input" type="hidden" name="active" id="active" value="true" path="active"/>
        </div>
<%--        <div class="form-group col-md-6">--%>
<%--            <form:input class="form-check-input" type="hidden" name="deleted" id="deleted" value="false" path="deleted"/>--%>
<%--        </div>--%>

    </div>

    <form:button type="submit" name="Save" value="Save" class="btn btn-primary">Opslaan</form:button>
<%--    <form:button type="submit" name="Delete" value="Delete" class="btn btn-primary">Verwijderen</form:button>--%>
    <form:button type="submit" name="Cancel" value="Cancel" class="btn btn-primary">Cancel</form:button>

</form:form>

<%};%>

</body>

</html>

<!-- Styles CSS -->
<link href="/static/css/styles.css" rel="stylesheet">


