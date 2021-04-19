<%-- 
    Document   : logout
    Created on : 2021.02.26., 9:35:12
    Author     : Kaczur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span> Bejelentkezés</a></li>
                        
                    </ul>
                </div>
            </nav>

            <article>
                <h2>Viszont látásra!</h2>
                <p>Ön sikeresen kijelentkezett!</p>
                <%
                    lekerdez.setLoginOK(false);
                    session.removeAttribute("felhasznalo");
                    session.removeAttribute("nev");
                    session.removeAttribute("knev");
                    session.removeAttribute("reszleg");
                    session.removeAttribute("munkakor");
                    session.invalidate();
                %>
            </article>

            <footer>
                <hr><p>Készítették:<br>Czinkóczi Naómi, Gombos Imre, Nádasy Bendegúz</p>
            </footer>
        </main>
    </body>
</html>
