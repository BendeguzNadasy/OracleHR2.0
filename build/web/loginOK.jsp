<%-- 
    Document   : login
    Created on : 2021.02.26., 8:38:31
    Author     : Kaczur
--%>

<%@page import="lekerdez.AdatbazisLekerdezBean"
        contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Oracle HR lekérdező 2.0</title>
        <link rel="icon" href="kepek/oracle.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="stilus.css" rel="stylesheet" type="text/css"/>
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
                        <% }%>
                        <% if (lekerdez.isLoginOK()) { %>
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
                <% if (session.getAttribute("felhasznalo") == null) { %>
                <h2>Profil</h2>
                <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
                <% } else {%>
                <h1>Profil</h1>
                <h2>Üdvözlünk az oldalon <b><%= session.getAttribute("knev") + " " + session.getAttribute("nev")%>!</b></h2>
                <p>Itt tekintheti meg az ön személyes adatait.</p>
                <div class="panel panel-info">
                    <div class="panel-heading">Név:</div>
                    <div class="panel-body"><%= session.getAttribute("knev") + " " + session.getAttribute("nev")%></div>
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading">Telefonszám:</div>
                    <div class="panel-body"><%= lekerdez.getFelhasznalo().getTel()  %></div>
                </div>
                
                <div class="panel panel-info">
                    <div class="panel-heading">Felvétel dátuma:</div>
                    <div class="panel-body"><%= lekerdez.getFelhasznalo().getDatum()  %></div>
                </div>
                
                <div class="panel panel-info">
                    <div class="panel-heading">Fizetés:</div>
                    <div class="panel-body"><%= lekerdez.getFelhasznalo().getFizu() %> EUR</div>
                </div>
                
                <div class="panel panel-info">
                    <div class="panel-heading">Munkakör:</div>
                    <div class="panel-body"><%= lekerdez.getFelhasznalo().getMunkakor()  %></div>
                </div>
                
                <div class="panel panel-info">
                    <div class="panel-heading">Részleg:</div>
                    <div class="panel-body"><%= lekerdez.getFelhasznalo().getReszleg() %></div>
                </div>
                
                <% }%>
            </article>

            <footer>
                <p>Készítették: Czinkóczi Naómi, Gombos Imre, Nádasy Bendegúz</p>
            </footer>
        </main>
    </body>
</html>
