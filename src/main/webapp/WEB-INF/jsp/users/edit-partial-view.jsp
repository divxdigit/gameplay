<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
%>

<form:form action="/Users/edit/submit" method="POST" modelAttribute="selectedUser" >

    <div class="row"><h3>Geselecteerde Gebruiker</h3></div>

    <div class="form-row">

        <div class="form-group col-md-6">
            <label for="id">UserID</label>
            <form:input readonly="true" type="text" class="form-control" id="id" path="id" placeholder="UserID" value="<%=selectedUser.getId()%>"/>
        </div>

<%--        <div class="form-group col-md-6">
            <label for="userType.name">Type</label>
            <form:input readonly="true" type="text" class="form-control" id="userType.name" path="userType.name" placeholder="Type" value="<%=selectedUser.getType().getName()%>"/>
        </div>--%>

        <div class="form-group col-md-6">
            <label for="userType.id">Usertype</label>
            <form:select class="form-control" name="userTypeId" id="userType" path="userType.id">
                <%  List<UserType> userTypeList = (List<UserType>) request.getAttribute("userType");
                    for (UserType userType: userTypeList) { %>
                <option value="<%= userType.getId() %>"><%= userType.getName() %></option>
                <%} %>
            </form:select>
        </div>

        <div class="form-group col-md-6">
            <label for="firstName">FirstName</label>
            <form:input readonly="true" type="text" class="form-control" id="firstName" path="firstName" placeholder="FirstName" value="<%=selectedUser.getFirstname()%>"/>
        </div>

        <<%--div class="form-group col-md-6">
            <label for="user.lastname">Achternaam</label>
            <form:input readonly="true" type="text" class="form-control" id="user.lastname" path="user.lastname" placeholder="Achternaam" value="<%=selectedOrder.getUser().getLastname()%>"/>
        </div>

        <div class="form-group col-md-6">
            <label for="dateCreated">Besteldatum</label>
            <form:input type="date" class="form-control" id="dateCreated" path="dateCreated" placeholder="Besteldatum" value="<%=selectedOrder.getDateCreated()%>"/>
            <div class="invalid-feedback d-block">
                <form:errors path ="dateCreated"/>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="dateCollect">Leverdatum</label>
            <form:input type="date" class="form-control" id="dateCollect" path="dateCollect" placeholder="Leverdatum" value="<%=selectedOrder.getDateCollect()%>"/>
            <div class="invalid-feedback d-block">
                <form:errors path ="dateCollect"/>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="deliveryStreet">Straat van leveradres</label>
            <form:input type="text" class="form-control" id="deliveryStreet" path="deliveryStreet" placeholder="Straat van leveringsadres" value="<%=selectedOrder.getDeliveryStreet()%>"/>
            <div class="invalid-feedback d-block">
                <form:errors path ="deliveryStreet"/>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="deliveryNumber">Huisnummer van leveradres</label>
            <form:input type="text" class="form-control" id="deliveryNumber" path="deliveryNumber" placeholder="Huisnummer van leveringsadres" value="<%=selectedOrder.getDeliveryNumber()%>"/>
            <div class="invalid-feedback d-block">
                <form:errors path ="deliveryNumber"/>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="deliveryPostalcode">Postcode van leveradres</label>
            <form:input type="text" class="form-control" id="deliveryPostalcode" path="deliveryPostalcode" placeholder="Postcode van leveringsadres" value="<%=selectedOrder.getDeliveryPostalcode()%>"/>
            <div class="invalid-feedback d-block">
                <form:errors path ="deliveryPostalcode"/>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="deliveryCity">Gemeente van leveradres</label>
            <form:input type="text" class="form-control" id="deliveryCity" path="deliveryCity" placeholder="Gemeente van leveringsadres" value="<%=selectedOrder.getDeliveryCity()%>"/>
            <div class="invalid-feedback d-block">
                <form:errors path ="deliveryCity"/>
            </div>
        </div>--%>

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


