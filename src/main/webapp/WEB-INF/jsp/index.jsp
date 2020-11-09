<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    <title>Index</title>

    <jsp:include page="navigation.jsp" />

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
                Welkom bij Gameplay
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




           <%-- <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                <a class="navbar-brand" href="#"><img src="/images/GamePlayLogo.png" alt="Logo GamePlay" height="40"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExample03">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown03">
                                <a class="dropdown-item" href="/publishers">Publishers</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>
                        <li>


                        </li>
                    </ul>

                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>

                    <a class="nav-link" href="#">Account <span class="sr-only">(current)</span></a>


                </div>
            </nav>

            <p>
                <a href="/publishers">
                    One to one relation example
                </a>
            </p>
    <!-- JavaScript -->

    <script src="/js/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="/js/popper.min.js" crossorigin="anonymous"></script>
    <script src="/js/bootstrap.min.js" crossorigin="anonymous"></script>--%>
</div>
</body>

</html>
