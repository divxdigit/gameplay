
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <a class="navbar-brand" href="/index"><img src="/images/GamePlayLogo.png" alt="Logo GamePlay" height="40"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home <span class="sr-only" >(current)</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/products/lst">Bordspellen <span class="sr-only" >(current)</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/contact">Contact</a>
            </li>
        </ul>

        <ul class="navbar-nav ml-auto" style="margin-right: 5px">

            <sec:authorize access="isAuthenticated()">
            <li class="nav-item">
                <a class="nav-link" href="/orderproducts/basket">

                    <button type="button" class="btn btn-primary">
                        <svg  width="20" height="20" fill="currentColor">
                            <use xlink:href="/icons/bootstrap-icons.svg#cart2" />
                        </svg>
                    </button>

                </a>
            </sec:authorize>

            <li class="nav-item dropdown">
                <a class="nav-link" href="#" id="AccountDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <button type="button" class="btn btn-secondary dropdown-toggle">
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
                 </a>

                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="AccountDropdownMenuLink" style="margin-left: 15px">
                        <sec:authorize access="hasAnyAuthority('ADMIN')">
                            <a class="dropdown-item" href="/publishers/list" >
                                <svg  width="20" height="20" fill="currentColor">
                                    <use xlink:href="/icons/bootstrap-icons.svg#signpost-split" />
                                </svg> Beheer uitgevers
                            </a>
                            <a class="dropdown-item" href="/languages/list" >
                                <svg  width="20" height="20" fill="currentColor">
                                    <use xlink:href="/icons/bootstrap-icons.svg#signpost-split" />
                                </svg> Beheer talen
                            </a>
                            <a class="dropdown-item" href="/genres/list" >
                                <svg  width="20" height="20" fill="currentColor">
                                    <use xlink:href="/icons/bootstrap-icons.svg#signpost-split" />
                                </svg> Beheer genres
                            </a>
                            <a class="dropdown-item" href="/agecategory/lst">
                                <svg  width="20" height="20" fill="currentColor">
                                    <use xlink:href="/icons/bootstrap-icons.svg#shield-check" />
                                </svg> Beheer leeftijdscategorieën
                            </a>
                            <a class="dropdown-item" href="/products/lst">
                                <svg  width="20" height="20" fill="currentColor">
                                    <use xlink:href="/icons/bootstrap-icons.svg#dice-5" />
                                </svg> Beheer bordspellen
                            </a>
                            <a class="dropdown-item" href="/orders/edit">
                                <svg  width="20" height="20" fill="currentColor">
                                    <use xlink:href="/icons/bootstrap-icons.svg#reception-4" />
                                </svg> Beheer bestellingen
                            </a>
                            <a class="dropdown-item" href="/users/edit">
                                <svg  width="20" height="20" fill="currentColor">
                                    <use xlink:href="/icons/bootstrap-icons.svg#people-fill" />
                                </svg> Beheer gebruikers
                            </a>

                        </sec:authorize>

                        <sec:authorize access="hasAnyAuthority('USER')">
                            <a class="dropdown-item" href="/orders/edit">
                                <svg  width="20" height="20" fill="currentColor">
                                    <use xlink:href="/icons/bootstrap-icons.svg#receipt" />
                                </svg> Mijn bestellingen
                            </a>
                            <a class="dropdown-item" href="/users/my-account">
                                <svg  width="20" height="20" fill="currentColor">
                                    <use xlink:href="/icons/bootstrap-icons.svg#person-circle" />
                                </svg> Mijn account
                            </a>

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
            </li>
        </ul>

    </div>
</nav>

<!-- Bootstrap CSS -->
<link href="/css/bootstrap.css" rel="stylesheet">

<script src="/js/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="/js/popper.min.js" crossorigin="anonymous"></script>
<script src="/js/bootstrap.min.js" crossorigin="anonymous"></script>


