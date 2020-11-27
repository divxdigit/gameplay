<%@ page import="be.thomasmore.graduaten.gameplay.entity.AgeCategory" %>
<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.gameplay.entity.Genre" %>
<%@ page import="be.thomasmore.graduaten.gameplay.entity.Language" %>
<%@ page import="be.thomasmore.graduaten.gameplay.entity.Publisher" %><%--
  Created by IntelliJ IDEA.
  User: Eve
  Date: 11/21/2020
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
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

    <title>GamePlay - Bordspellen</title>

    <jsp:include page="../navigation.jsp" />

</head>
<body>

<div class="container" style="margin-top: 25px ">
    <div class="col-md-8">
        <h1>
            Nieuw Bordspel
        </h1>
    </div>

    <form:form action="/products/do-create" method="POST">
        <div class="form-row">

            <div class="form-group col-md-6 ">
                <label for="publisher">Uitgeverij</label>
                <select class="form-control" name="publisherId" id="publisher">
                    <%  List<Publisher> publisherList = (List<Publisher>) request.getAttribute("publishers");
                        for (Publisher publisher: publisherList) { %>
                    <option value="<%= publisher.getId() %>"><%= publisher.getName() %></option>
                    <%} %>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="language">Taal van het spel</label>
                <select class="form-control" name="languageId" id="language">
                    <%  List<Language> languageList = (List<Language>) request.getAttribute("languages");
                        for (Language  language: languageList) { %>
                    <option value="<%= language.getId() %>"><%= language.getName() %></option>
                    <%} %>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="name">Naam</label>
                <input class="form-control" type="text" name="name" id="name" placeholder="Naam bordspel">
                <div class="invalid-feedback d-block">
                    <errors path ="name"/>
                </div>
            </div>
            <div class="form-group col-md-6">
                <label for="genre">Genre</label>
                <select class="form-control" name="genreId" id="genre">
                    <%  List<Genre> genreList = (List<Genre>) request.getAttribute("genres");
                        for (Genre  genre: genreList) { %>
                    <option value="<%= genre.getId() %>"><%= genre.getName() %></option>
                    <%} %>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="description">Omschrijving</label>
                <textarea  class="form-control" name="description" id="description" placeholder="Vul een omschrijving in"></textarea>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="dateLaunch">Release datum</label>
                <input class="form-control" type=date name="dateLaunch" id="dateLaunch">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="ageCategory">Leeftijdscategorie</label>
                <select class="form-control" name="ageCategoryId" id="ageCategory">
                    <%  List<AgeCategory> ageCategoryList = (List<AgeCategory>) request.getAttribute("ageCategories");
                        for (AgeCategory ageCategory: ageCategoryList) { %>
                    <option value="<%= ageCategory.getId() %>"><%= ageCategory.getName() %></option>
                    <%} %>
                </select>
            </div>
            <div class="form-group col-md-3">
                <label for="playersMinimum">Minimum aantal spelers</label>
                <input class="form-control" type="number" name="playersMinimum" id="playersMinimum">
            </div>
            <div class="form-group col-md-3">
                <label for="playersMaximum">Maximum aantal spelers</label>
                <input class="form-control" type="number" name="playersMaximum" id="playersMaximum">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="rentStock">Stock spellen te huur</label>
                <input class="form-control" type="number" name="rentStock" id="rentStock">
            </div>
            <div class="form-group col-md-2">
                <label for="rentPrice">Huurprijs</label>
                <input class="form-control" type="number" name="rentPrice" id="rentPrice">
            </div>
            <div class="form-group col-md-4">
                <label for="buyStock">Stock spellen te koop</label>
                <input class="form-control" type="number" name="buyStock" id="buyStock">
            </div>
            <div class="form-group col-md-2">
                <label for="buyPrice">Aankoopprijs</label>
                <input class="form-control" type="number" name="buyPrice" id="buyPrice">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="picture">Afbeelding</label>
                <input class="form-control" type="text" name="picture" id="picture">
            </div>
            <%--<div class="form-group col-md-6">
                <input class="form-check-input" type="checkbox" name="active" id="active" value="true" disabled><label for="active">Spel in omloop</label>
            </div>--%>
        </div>
        <%--<div class="form-group">
            <input type="submit" value="Register a new product">
        </div>--%>
        <button type="submit" class="btn btn-primary">Nieuw bordspel registreren</button>

    </form:form>


</div>
</body>
</html>
