<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%@ page import="be.thomasmore.graduaten.gameplay.entity.Order" %>
    <%@ page import="be.thomasmore.graduaten.gameplay.entity.OrderProduct" %>

</head>
<body>

<%  OrderProduct selectedOrderProduct = (OrderProduct) request.getAttribute("selectedOrderProduct");
    if(selectedOrderProduct.getId()!=null){
%>

<form:form action="/orderproducts/edit/submit" method="POST" modelAttribute="selectedOrderProduct" >

    <div class="row" style="margin-top: 25px"><h3>Geselecteerde bestellijn</h3></div>

    <div class="form-row">

        <%--READ ONLY GEDEELTE (zowel voor admin als user) --%>
        <div class="form-group col-md-6">
            <label for="id">OrderProductID</label>
            <form:input readonly="true" type="text" class="form-control" id="id" path="id" placeholder="OrderProductID" value="<%=selectedOrderProduct.getId()%>"/>
        </div>

        <div class="form-group col-md-6">
            <label for="order.id">OrderID</label>
            <form:input readonly="true" type="text" class="form-control" id="order.id" path="order.id" placeholder="OrderID" value="<%=selectedOrderProduct.getOrder().getId()%>"/>
        </div>

        <div class="form-group col-md-6">
            <label for="product.id">ProductID</label>
            <form:input readonly="true" type="text" class="form-control" id="product.id" path="product.id" placeholder="ProductID" value="<%=selectedOrderProduct.getProduct().getId()%>"/>
        </div>

        <div class="form-group col-md-6">
            <label for="product.name">Product</label>
            <form:input readonly="true" type="text" class="form-control" id="product.name" path="product.name" placeholder="Productnaam" value="<%=selectedOrderProduct.getProduct().getName()%>"/>
        </div>

        <%--READ ONLY (enkel voor user) --%>
        <sec:authorize access="hasAnyAuthority('USER')">
            <div class="form-group col-md-6">
                <label for="rentDurationWeeks">Huurtijd in weken</label>
                <form:input readonly="true" type="text" class="form-control" id="rentDurationWeeks" path="rentDurationWeeks" placeholder="Huurtijd in weken" value="<%=selectedOrderProduct.getRentDurationWeeks()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="rentDurationWeeks"/>
                </div>
            </div>

            <div class="form-group col-md-6">
                <label for="orderType">Ordertype</label>
                <form:input readonly="true" type="text" class="form-control" id="orderType" path="orderType" placeholder="Ordertype" value="<%=selectedOrderProduct.getOrderType()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="orderType"/>
                </div>
            </div>

            <div class="form-group col-md-6">
                <label for="price">Prijs</label>
                <form:input readonly="true" type="text" class="form-control" id="price" path="price" placeholder="Prijs" value="<%=selectedOrderProduct.getPrice()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="price"/>
                </div>
            </div>

            <div class="form-group col-md-6">
                <label for="discountPrice">Korting</label>
                <form:input readonly="true" type="text" class="form-control" id="discountPrice" path="discountPrice" placeholder="Promoprijs" value="<%=selectedOrderProduct.getDiscountPrice()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="discountPrice"/>
                </div>
            </div>
        </sec:authorize>

        <%--READ & WRITE (enkel voor admin) --%>
        <sec:authorize access="hasAnyAuthority('ADMIN')">

            <div class="form-group col-md-6">
                <label for="rentDurationWeeks">Huurtijd in weken</label>
                <form:input type="text" class="form-control" id="rentDurationWeeks" path="rentDurationWeeks" placeholder="Huurtijd in weken" value="<%=selectedOrderProduct.getRentDurationWeeks()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="rentDurationWeeks"/>
                </div>
            </div>

            <div class="form-group col-md-6">
                <label for="orderType">Ordertype</label>
                <form:input type="text" class="form-control" id="orderType" path="orderType" placeholder="Ordertype" value="<%=selectedOrderProduct.getOrderType()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="orderType"/>
                </div>
            </div>

            <div class="form-group col-md-6">
                <label for="price">Prijs</label>
                <form:input type="text" class="form-control" id="price" path="price" placeholder="Prijs" value="<%=selectedOrderProduct.getPrice()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="price"/>
                </div>
            </div>

            <div class="form-group col-md-6">
                <label for="discountPrice">Kprto,g</label>
                <form:input type="text" class="form-control" id="discountPrice" path="discountPrice" placeholder="Promoprijs" value="<%=selectedOrderProduct.getDiscountPrice()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="discountPrice"/>
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


