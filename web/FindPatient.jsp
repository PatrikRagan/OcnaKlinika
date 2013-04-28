<%-- 
    Document   : FindPatient
    Created on : 28.4.2013, 13:38:47
    Author     : notebook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vyhľadanie pacienta</title>
    </head>
    <body>
        <form action="PatientCheck.jsp" method="post">
            Meno:<input type="text" name="meno">
            <br/>Priezvisko:<input type="text" name="priezvisko">
            <br/>Dátum narodenia:<input type="text" name="narodenie">
            <br/>Rodné číslo:<input type="text" name="rc">
            <br/>Zdravotná poisťovňa:<input type="text" name="poistovna">
            <br/><input type="submit" value="Vyhľadaj">
            <input type="submit" value="Návrat" formaction="Home.jsp">
        </form>
    </body>
</html>
