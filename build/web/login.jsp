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
                    </ul>
                    <ul class="nav navbar-nav navbar-right">

                        <% if (!lekerdez.isLoginOK()) { %>
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span> Bejelentkezés</a></li>
                            <% } else {%>
                        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Kijelentkezés</a></li>
                            <% }%>
                    </ul>
                </div>
            </nav>

            <article>
                <h1>Bejelentkezés</h1>
                <form action="loginEllenorzo.jsp" method="post">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="username" type="text" class="form-control" name="username" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password" type="password" class="form-control" name="password" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-success" value="Belépés">
                    </div>
                </form>
            </article>

            <footer>
                <p>Készítették: Czinkóczi Naómi, Gombos Imre, Nádasy Bendegúz</p>
            </footer>
        </main>
    </body>
</html>
