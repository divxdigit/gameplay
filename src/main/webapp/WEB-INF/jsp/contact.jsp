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


</head>
<body>
<div class="container" style="margin-top: 25px ">
    <div class="form-row">
        <h1 align="center">
            Contact
        </h1>
    </div>
    <div class="form-row">
        <div class="col-sm-6 table-responsive ">

                <h2>
                    GamePlay bvba
                </h2>
                <p>Kleinhoefstraat 4
                    <br/>2440 Geel
                </p>
                <p>BTW: 000-5555-66666
                    <br/>Telefoon: 014/14.14.14
                </p>
            <br/><br/>
                <h2>
                    Onze medewerkers
                </h2>
                <ul>
                    <li>Ruben Van Hout</li>
                    <li>Eve Ravignot</li>
                    <li>Maarten Celen</li>
                </ul>
        </div>
        <div class="col-sm-6 table-responsive " id="map"></div>
            <script>
                function initMap() {
                    var shop = { lat:51.16149, lng: 4.961340}
                    var map = new google.maps.Map(document.getElementById("map"), {
                        center: shop,
                        zoom: 15
                                /*
                                1: World
                                5: Landmass/continent
                                10: City
                                15: Streets
                                20: Building
                                */
                    });
                    var marker = new google.maps.Marker({ position: shop, map: map });
                }
            </script>
            <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzaBI4HEPbe1_7hwrjOQLsHxzjd_vdQgw&callback=initMap" defer></script>
    </div>
</div>
</body>

</html>
