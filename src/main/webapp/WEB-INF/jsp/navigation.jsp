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

<%--    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">--%>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

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

    <div class="collapse navbar-collapse" id="aanbodDropdown">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home <span class="sr-only" >(current)</span></a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="aanbodDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Aanbod</a>
                <div class="dropdown-menu" aria-labelledby="aanbodDropdownMenuLink">
                    <a class="dropdown-item" href="/products/lst">Overzicht Bordspellen</a>
                    <a class="dropdown-item" href="/genres/list">Genres</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/contact">Contact</a>
            </li>

          <%--  &lt;%&ndash;<sec:authorize access="hasAnyAuthority('USER','ADMIN')">&ndash;%&gt;
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
--%>

        </ul>
<%--        <form class="form-inline my-2 my-md-0" method="get" action="/search">
            <input class="form-control" type="text" placeholder="Zoeken naar" name="searchString">
            <button id="button-id" type="submit">Search</button>
        </form>--%>

        <div class="btn-group" style="margin-left: 15px">
            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <svg  width="20" height="20" fill="currentColor">
                    <use xlink:href="/icons/bootstrap-icons.svg#person-circle" />
                </svg>

                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.firstname" />
                    <sec:authentication property="principal.lastname" />
                </sec:authorize>

                <sec:authorize access="!isAuthenticated()">
                    Leden
                </sec:authorize>

            </button>
            <div class="dropdown-menu dropdown-menu-right">
                <sec:authorize access="hasAnyAuthority('ADMIN')">
                    <a class="dropdown-item" href="/genres/list" >
                        <svg  width="20" height="20" fill="currentColor">
                            <use xlink:href="/icons/bootstrap-icons.svg#signpost-split" />
                        </svg> Beheer Genres
                    </a>
                    <a class="dropdown-item" href="/agecategory/lst">
                        <svg  width="20" height="20" fill="currentColor">
                            <use xlink:href="/icons/bootstrap-icons.svg#shield-check" />
                        </svg> Beheer Leeftijdscategorieën
                    </a>
                    <a class="dropdown-item" href="/products/lst">
                        <svg  width="20" height="20" fill="currentColor">
                            <use xlink:href="/icons/bootstrap-icons.svg#dice-5" />
                        </svg> Beheer Bordspellen
                    </a>
                    <a class="dropdown-item" href="/orders/edit">
                        <svg  width="20" height="20" fill="currentColor">
                            <use xlink:href="/icons/bootstrap-icons.svg#reception-4" />
                        </svg> Beheer Orders
                    </a>
                    <a class="dropdown-item" href="/users">
                        <svg  width="20" height="20" fill="currentColor">
                            <use xlink:href="/icons/bootstrap-icons.svg#people-fill" />
                        </svg> Beheer Gebruikers
                    </a>
                    <hr>
                </sec:authorize>
                <sec:authorize access="hasAnyAuthority('USER')">
                    <a class="dropdown-item" href="#">
                        <svg  width="20" height="20" fill="currentColor">
                            <use xlink:href="/icons/bootstrap-icons.svg#receipt" />
                        </svg> Mijn orders
                    </a>
                    <hr>
                </sec:authorize>

                <sec:authorize access="!isAuthenticated()">
                    <a class="dropdown-item" href="/login">
                        <svg  width="20" height="20" fill="currentColor">
                            <use xlink:href="/icons/bootstrap-icons.svg#unlock" />
                        </svg> Login
                    </a>
                </sec:authorize>

                <sec:authorize access="!isAuthenticated()">
                    <a class="dropdown-item" href="/users/registration">
                        <svg  width="20" height="20" fill="currentColor">
                            <use xlink:href="/icons/bootstrap-icons.svg#person-plus" />
                        </svg> Account aanmaken
                    </a>
                </sec:authorize>

                <%--<sec:authorize access="hasAnyAuthority('USER','ADMIN')">--%>
                <sec:authorize access="isAuthenticated()">
                    <a class="dropdown-item" href="/logout"><svg  width="20" height="20" fill="currentColor">
                        <use xlink:href="/icons/bootstrap-icons.svg#power" />
                    </svg>Logout</a>
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
