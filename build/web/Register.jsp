<%-- 
    Document   : Register
    Created on : 28.4.2013, 11:26:40
    Author     : Patres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
        <h1>Registrácia</h1>
        
        <h2>Registračné údaje:</h2>
        <form action="RegisterCheck.jsp" method="post">
            <br/>Login:<input type="text" name="username">
            <br/>Password:<input type="password" name="password">
            <br/><input type="submit" value="Registrácia">
        </form>
        </center>

    </body>
</html>
