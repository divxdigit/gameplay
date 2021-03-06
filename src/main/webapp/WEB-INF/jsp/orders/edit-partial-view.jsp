<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%@ page import="be.thomasmore.graduaten.gameplay.entity.Order" %>

</head>
<body>

<% Order selectedOrder = (Order) request.getAttribute("selectedOrder");
    if(selectedOrder.getId()!=null){
%>

<form:form action="/orders/edit/submit" method="POST" modelAttribute="selectedOrder" >

    <div class="row" style="margin-top: 25px"><h3>Geselecteerde bestelling</h3></div>

    <div class="form-row">

        <%--READ ONLY GEDEELTE (zowel voor admin als user) --%>
        <div class="form-group col-md-6">
                <label for="id">OrderID</label>
                <form:input readonly="true" type="text" class="form-control" id="id" path="id" placeholder="OrderID" value="<%=selectedOrder.getId()%>"/>
        </div>

        <div class="form-group col-md-6">
            <label for="user.id">UserID</label>
            <form:input readonly="true" type="text" class="form-control" id="user.id" path="user.id" placeholder="UserID" value="<%=selectedOrder.getUser().getId()%>"/>
        </div>

        <div class="form-group col-md-6">
            <label for="user.firstname">Voornaam</label>
            <form:input readonly="true" type="text" class="form-control" id="user.firstname" path="user.firstname" placeholder="Voornaam" value="<%=selectedOrder.getUser().getFirstname()%>"/>
        </div>

        <div class="form-group col-md-6">
            <label for="user.lastname">Achternaam</label>
            <form:input readonly="true" type="text" class="form-control" id="user.lastname" path="user.lastname" placeholder="Achternaam" value="<%=selectedOrder.getUser().getLastname()%>"/>
        </div>

        <%--READ ONLY (enkel voor user) --%>
            <sec:authorize access="hasAnyAuthority('USER')">
                <div class="form-group col-md-6">

                    <label for="dateCreated">Besteldatum</label>
                    <form:input readonly="true" type="date" class="form-control" id="dateCreated" path="dateCreated" placeholder="Besteldatum" value="<%=selectedOrder.getDateCreated()%>"/>
                    <div class="invalid-feedback d-block">
                        <form:errors path ="dateCreated"/>
                    </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="dateCollect">Leverdatum</label>
                    <form:input readonly="true" type="date" class="form-control" id="dateCollect" path="dateCollect" placeholder="Leverdatum" value="<%=selectedOrder.getDateCollect()%>"/>
                    <div class="invalid-feedback d-block">
                        <form:errors path ="dateCollect"/>
                    </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="deliveryStreet">Straat van leveradres</label>
                    <form:input readonly="true" type="text" class="form-control" id="deliveryStreet" path="deliveryStreet" placeholder="Straat van leveringsadres" value="<%=selectedOrder.getDeliveryStreet()%>"/>
                    <div class="invalid-feedback d-block">
                        <form:errors path ="deliveryStreet"/>
                    </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="deliveryNumber">Huisnummer van leveradres</label>
                    <form:input readonly="true" type="text" class="form-control" id="deliveryNumber" path="deliveryNumber" placeholder="Huisnummer van leveringsadres" value="<%=selectedOrder.getDeliveryNumber()%>"/>
                    <div class="invalid-feedback d-block">
                        <form:errors path ="deliveryNumber"/>
                    </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="deliveryPostalcode">Postcode van leveradres</label>
                    <form:input readonly="true" type="text" class="form-control" id="deliveryPostalcode" path="deliveryPostalcode" placeholder="Postcode van leveringsadres" value="<%=selectedOrder.getDeliveryPostalcode()%>"/>
                    <div class="invalid-feedback d-block">
                        <form:errors path ="deliveryPostalcode"/>
                    </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="deliveryCity">Gemeente van leveradres</label>
                    <form:input readonly="true" type="text" class="form-control" id="deliveryCity" path="deliveryCity" placeholder="Gemeente van leveringsadres" value="<%=selectedOrder.getDeliveryCity()%>"/>
                    <div class="invalid-feedback d-block">
                        <form:errors path ="deliveryCity"/>
                    </div>
                </div>
            </sec:authorize>

        <%--READ & WRITE (enkel voor admin) --%>
        <sec:authorize access="hasAnyAuthority('ADMIN')">
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
            </div>
       </sec:authorize>
    </div>

    <%--BUTTONS ONLY FOR ADMINS --%>
    <sec:authorize access="hasAnyAuthority('ADMIN')">
        <form:button type="submit" name="Save" value="Save" class="btn btn-primary">Opslaan</form:button>
    </sec:authorize>

    <%--BUTTONS FOR USERS AND ADMINS --%>
    <form:button type="submit" name="Cancel" value="Cancel" class="btn btn-primary">Annuleren</form:button>

</form:form>

<%};%>

</body>

</html>

<!-- Styles CSS -->
<link href="/static/css/styles.css" rel="stylesheet">


