<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    <title>GamePlay - Online webshop</title>

    <jsp:include page="navigation.jsp" />
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%--<style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>--%>

</head>
<body>
<div class="container" style="margin-top: 25px ">
    <div class="row">
        <div class="col-md-8">
            <h2>
                Welkom
                        <sec:authorize access="isAuthenticated()">
<%--                            <sec:authentication property="principal.username" />--%>
                            <sec:authentication property="principal.firstname" />
                            <sec:authentication property="principal.lastname" />
                        </sec:authorize>
                bij Gameplay
            </h2>
            <p>GamePlay is opgericht als schoolproject en uitgegroeid tot een webshop met een zeer groot aanbod.
            </p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus libero leo, pellentesque ornare, adipiscing vitae, rhoncus commodo, nulla. Fusce quis ipsum. Nulla neque massa, feugiat sed, commodo in, adipiscing ut, est. In fermentum mattis ligula. Nulla ipsum. Vestibulum condimentum condimentum augue. Nunc purus risus, volutpat sagittis, lobortis at, dignissim sed, sapien. Fusce porttitor iaculis ante. Curabitur eu arcu. Morbi quam purus, tempor eget, ullamcorper feugiat, commodo ullamcorper, neque.</p>
        </div>
        <div class="col-md-4 card rounded shadow" style="background-image: linear-gradient(to bottom,  white 60%, #b1dfbb ); margin-bottom: 15px;" >  <%--#9fcdff, #b9bbbe--%>

            <%--linear-gradient(180deg, #9fcdff, white);--%>
            <h2>
                Games
            </h2>

        </div>
    </div>

    <div class="card shadow p-3 mb-5 bg-white rounded " style="margin-top: 25px ">
        <h2>
            Aanbod
        </h2>
        <p>Bij ons kan u verschillende bordspellen vinden in alle genres.<br>
            - RPG<br>
            - Co-op<br>
            - ...</p>
    </div>

</div>

</body>

</html>
