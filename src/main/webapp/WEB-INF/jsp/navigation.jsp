<%--
  Created by IntelliJ IDEA.
  User: Maarten
  Date: 24/10/2020
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%--<html lang="en">
<head>--%>
    <!-- Required meta tags -->
<%--
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
--%>

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">

<%--    <title>Index</title>--%>

<%--
    <style>
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
    </style>
--%>
<%--
</head>
<body>--%>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <a class="navbar-brand" href="#"><img src="/images/GamePlayLogo.png" alt="Logo GamePlay" height="40"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExample03">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Aanbod</a>
                <div class="dropdown-menu" aria-labelledby="Aanbod">
                    <a class="dropdown-item" href="/genres">Genres page</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/contact">Contact</a>
            </li>
            <%--<sec:authorize access="hasAnyAuthority('USER','ADMIN')">--%>
            <sec:authorize access="isAuthenticated()">
            <li class="nav-item">
                <a class="nav-link" href="#">USER PRIVILEGE</a>
            </li>
            </sec:authorize>
            <sec:authorize access="hasAnyAuthority('ADMIN')">
                <li class="nav-item">
                    <a class="nav-link" href="#">ADMIN PRIVILEGE</a>
                </li>
            </sec:authorize>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                <div class="dropdown-menu" aria-labelledby="dropdown03">
                    <sec:authorize access="hasAnyAuthority('ADMIN')">
                        <a class="dropdown-item" href="/publishers">Manage Publishers</a>

                    </sec:authorize>
                    <a class="dropdown-item" href="/admin">Admin page</a>

                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>


        </ul>
        <form class="form-inline my-2 my-md-0">
            <input class="form-control" type="text" placeholder="Search">
        </form>

        <div class="btn-group" style="margin-left: 15px">
            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Leden
            </button>
            <div class="dropdown-menu dropdown-menu-right">
                <sec:authorize access="hasAnyAuthority('ADMIN')">
                    <a class="dropdown-item" href="/genres">Manage Genres</a>
                    <a class="dropdown-item" href="#">Manage Games</a>
                    <a class="dropdown-item" href="#">Manage Orders</a>
                    <hr>
                </sec:authorize>
                <sec:authorize access="hasAnyAuthority('USER')">
                    <a class="dropdown-item" href="#">My orders</a>
                    <hr>
                </sec:authorize>

                <sec:authorize access="!isAuthenticated()">
                    <a class="dropdown-item" href="/login">Login</a>

                </sec:authorize>
                <%--<sec:authorize access="hasAnyAuthority('USER','ADMIN')">--%>
                <sec:authorize access="isAuthenticated()">
                    <a class="dropdown-item" href="/logout">Logout</a>
                </sec:authorize>
            </div>
        </div>
    </div>
</nav>


<!-- JavaScript -->

<script src="/js/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="/js/popper.min.js" crossorigin="anonymous"></script>
<script src="/js/bootstrap.min.js" crossorigin="anonymous"></script>
<%--
</body>

</html>--%>
