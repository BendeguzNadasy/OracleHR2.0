<%-- 
    Document   : terkepek
    Created on : 2021.04.12., 14:27:30
    Author     : Nami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="terkep" class="lekerdez.LekerdezOrszagokesKontinensekAdataiBean"/>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Oracle HR lekérdező 2.0</title>
        <link rel="icon" href="kepek/oracle.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="stilus.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {
                'packages': ['geochart'],
                // Note: you will need to get a mapsApiKey for your project.
                // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
                'mapsApiKey': 'AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY'
            });
            google.charts.setOnLoadCallback(drawRegionsMap);

            function drawRegionsMap() {
                var data = google.visualization.arrayToDataTable([
                    ['Ország', 'Székhelyek száma'],
            <%=terkep.vilagTerkep()%>
                ]);

                var options = {};

                var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <main>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">Oracle HR 2.0</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Főoldal</a></li>
                            <% if (lekerdez.isLoginOK()) { %>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Oldalak <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="privatDolgozok.jsp">Dolgozók részlegenként</a></li>
                                    <% if ((session.getAttribute("munkakor").equals("Stock Manager")
                                            && session.getAttribute("reszleg").equals("Shipping"))
                                            || session.getAttribute("reszleg").equals("Executive")) { %>
                                <li><a href="terkepek.jsp">Térkép</a></li>
                                    <% }%>
                            </ul>
                        </li>
                        <li><a href="loginOK.jsp">Profil</a></li>
                            <% }%>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <% if (!lekerdez.isLoginOK()) { %>
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span> Bejelentkezés</a></li>
                            <% } else {%>
                        <li><a class="btn disabled"> Bejelentkezve: <%= session.getAttribute("nev")%></a></li>
                        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Kijelentkezés</a></li>
                            <% }%>
                    </ul>
                </div>
            </nav>

            <article>
                <% if (!lekerdez.isLoginOK()) { %>
                <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
                <p><a href="login.jsp">Bejelentkezés</a></p>
                <% } else {%>
                <% if ((session.getAttribute("munkakor").equals("Stock Manager")
                            && session.getAttribute("reszleg").equals("Shipping"))
                            || session.getAttribute("reszleg").equals("Executive")) { %>
                <h1>Térkép</h1>
                <p>Országonként jelenlévő székhelyek száma térkép-diagrammon megjelenítve.</p>
                <div id="regions_div" style="width: 100%; height: 500px;"></div>
                <% }%>
                <% }%>

            </article>

            <footer>
                <hr><p>Készítették:<br>Czinkóczi Naómi, Gombos Imre, Nádasy Bendegúz</p>
            </footer>
        </main>

    </body>
</html>







