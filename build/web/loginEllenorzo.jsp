<%-- 
    Document   : loginEllenorzo
    Created on : 2021.02.26., 8:50:53
    Author     : Kaczur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Oracle HR lekérdező 1.0</title>
    </head>
    <body>
        <h2>Ezt sosem láthatja senki.</h2>
        <% if (request.getParameter("username") == null) { %>
        <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
        <p><a href="index.jsp">Címlap</a></p>
        <% } else {
          String felhasznalonev=request.getParameter("username");
          String jelszo=request.getParameter("password");
          if(lekerdez.bejelentkezesEllenorzes(felhasznalonev, jelszo)) { 
            lekerdez.setLoginOK(true);
            session.setAttribute("felhasznalo", felhasznalonev);
            session.setAttribute("nev", lekerdez.getFelhasznalo().getVnev());
            session.setAttribute("knev", lekerdez.getFelhasznalo().getKnev());
            /*session.setAttribute("tel", lekerdez.getFelhasznalo().getTel());
            session.setAttribute("datum", lekerdez.getFelhasznalo().getDatum());
            session.setAttribute("fizu", lekerdez.getFelhasznalo().getFizu());  */
            session.setAttribute("reszleg", lekerdez.getFelhasznalo().getReszleg());
            session.setAttribute("munkakor", lekerdez.getFelhasznalo().getMunkakor());
            response.sendRedirect("loginOK.jsp");
          } else {
            lekerdez.setLoginOK(false);
            response.sendRedirect("loginHiba.jsp");
          }
      
        } %>
    </body>
</html>
