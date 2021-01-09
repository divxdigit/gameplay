<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.gameplay.entity.Product" %>
<%@ page import="java.time.LocalDate" %>

<%@ page import="be.thomasmore.graduaten.gameplay.entity.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en" >
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/css/styles.css" rel="stylesheet">
    <link href="/css/bootstrap.css" rel="stylesheet">

    <title>Aanpassen bordspel</title>

    <jsp:include page="../navigation.jsp" />

</head>
<body>
<div class="container" style="margin-top: 25px ">
    <div class="col-md-8">
        <h1>
            Aanpassen Bordspel
        </h1>
    </div>
    <%
        if (request.getAttribute("inputProduct") != null) {
            Product product = (Product) request.getAttribute("inputProduct");
            /*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");*/
    %>


    <form:form action="/products/do-update" method="POST" enctype="multipart/form-data"  modelAttribute="inputProduct">
        <div class="form-row">

            <div class="form-group col-md-6 ">
                <label for="publisher">Uitgeverij</label>
                <form:select class="form-control" name="publisherId" id="publisher" path="publisher.id">
                    <%  List<Publisher> publisherList = (List<Publisher>) request.getAttribute("publishers");
                        for (Publisher publisher: publisherList) {
                            if(product.getPublisher().getId() == publisher.getId()) {
                    %>
                    <option selected value="<%= publisher.getId() %>"><%= publisher.getName() %></option>
                    <% } else { %>
                    <option value="<%= publisher.getId() %>"><%= publisher.getName() %></option>
                    <% } %>
                    <%} %>
                </form:select>
            </div>

            <div class="form-group col-md-6">
                <label for="language">Taal van het spel</label>
                <form:select class="form-control" name="languageId" id="language" path="language.id">
                    <%  List<Language> languageList = (List<Language>) request.getAttribute("languages");
                        for (Language  language: languageList) {
                            if(product.getLanguage().getId() == language.getId()) {
                    %>
                    <option selected value="<%= language.getId() %>"><%= language.getName() %></option>
                    <% } else { %>
                    <option value="<%= language.getId() %>"><%= language.getName() %></option>
                    <% } %>
                    <%} %>
                </form:select>
            </div>

        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="name">Naam</label>
                <form:input class="form-control" type="text" name="name" id="name" placeholder="Naam bordspel" path="name" value="<%=product.getName()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="name"/>
                </div>
            </div>

            <div class="form-group col-md-6">
                <label for="genre">Genre</label>
                <form:select class="form-control" name="genreId" id="genre" path="genre.id">
                    <%  List<Genre> genreList = (List<Genre>) request.getAttribute("genres");
                        for (Genre  genre: genreList) {
                            if(product.getGenre().getId() == genre.getId()) {
                    %>
                    <option selected value="<%= genre.getId() %>"><%= genre.getName() %></option>
                    <%} else { %>
                    <option value="<%= genre.getId() %>"><%= genre.getName() %></option>
                    <% } %>
                    <%} %>
                </form:select>
            </div>

        </div>

        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="description">Omschrijving</label>
                <form:textarea  class="form-control" name="description" id="description" placeholder="Vul een omschrijving in" path="description" value="<%=product.getDescription()%>"></form:textarea>
                <div class="invalid-feedback d-block">
                    <form:errors path ="description"/>
                </div>
            </div>

        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="dateLaunch">Release datum</label>
                <form:input class="form-control" type="date" name="dateLaunch" id="dateLaunch" path="dateLaunch" value="<%=product.getDateLaunch()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="dateLaunch"/>
                </div>
            </div>
            <div class="form-group col-md-6">
                <label for="rating">Beoordeling spel</label>
                <form:input class="form-control" type="number" name="rating" id="rating" path="rating" value="<%=product.getRating()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="rating"/>
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="ageCategory">Leeftijdscategorie</label>
                <form:select class="form-control" name="ageCategoryId" id="ageCategory" path="ageCategory.id">
                    <%  List<AgeCategory> ageCategoryList = (List<AgeCategory>) request.getAttribute("ageCategories");
                        for (AgeCategory ageCategory: ageCategoryList) {
                            if(product.getAgeCategory().getId() == ageCategory.getId()) {
                    %>
                    <option selected value="<%= ageCategory.getId() %>"><%= ageCategory.getName() %></option>
                    <% } else { %>
                    <option value="<%= ageCategory.getId() %>"><%= ageCategory.getName() %></option>
                    <% } %>
                    <%} %>
                </form:select>
                <div class="invalid-feedback d-block">
                    <form:errors path ="ageCategory.id"/>
                </div>
            </div>

            <div class="form-group col-md-3">
                <label for="playersMinimum">Minimum aantal spelers</label>
                <form:input class="form-control" type="number" name="playersMinimum" id="playersMinimum" path="playersMinimum" value="<%=product.getPlayersMinimum()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="playersMinimum"/>
                </div>
            </div>

            <div class="form-group col-md-3">
                <label for="playersMaximum">Maximum aantal spelers</label>
                <form:input class="form-control" type="number" name="playersMaximum" id="playersMaximum" path="playersMaximum" value="<%=product.getPlayersMaximum()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="playersMaximum"/>
                </div>
            </div>

        </div>

        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="rentStock">Stock spellen te huur</label>
                <form:input class="form-control" type="number" name="rentStock" id="rentStock" path="rentStock" value="<%=product.getRentStock()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="rentStock"/>
                </div>
            </div>

            <div class="form-group col-md-2">
                <label for="rentPrice">Huurprijs</label>
                <form:input class="form-control" type="number" step=".01" name="rentPrice" id="rentPrice" path="rentPrice" value="<%=product.getRentPrice()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="rentPrice"/>
                </div>
            </div>

            <div class="form-group col-md-4">
                <label for="buyStock">Stock spellen te koop</label>
                <form:input class="form-control" type="number" name="buyStock" id="buyStock" path="buyStock" value="<%=product.getBuyStock()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="buyStock"/>
                </div>
            </div>

            <div class="form-group col-md-2">
                <label for="buyPrice">Aankoopprijs</label>
                <form:input class="form-control" type="number" step=".01" name="buyPrice" id="buyPrice" path="buyPrice" value="<%=product.getBuyPrice()%>"/>
                <div class="invalid-feedback d-block">
                    <form:errors path ="buyPrice"/>
                </div>
            </div>

            <div class="form-group col-md-2">
                <label>Actief</label>
                <%if(product.getActive()){%>
                <form:radiobutton path="active" value="true" checked="checked"/>Ja
                <form:radiobutton path="active" value="false"/>Nee
                <%}else {%>
                <form:radiobutton path="active" value="true"/>Ja
                <form:radiobutton path="active" value="false" checked="checked"/>Nee
                <%};%>
            </div>

        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label>Afbeelding</label>
                <input type="file" name="image" accept="image/png, image/jpeg" />
                <label>Indien geen afbeelding wordt toegevoegd, zal de oude afbeelding blijven staan.</label>
            </div>

            <div class="form-group col-md-2">
                <form:input class="form-control" type="hidden" name="productid" id="productid" value="<%=product.getId()%>" path="id"/>
            </div>

        </div>




        <button type="submit" class="btn btn-primary">Wijzigingen opslaan</button>

    </form:form>

<% } %>
</div>
</body>
</html>
