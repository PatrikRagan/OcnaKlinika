<%-- 
    Document   : newjspLogout
    Created on : 28.4.2013, 0:09:02
    Author     : Patres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
 
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.invalidate();
        %>
        <h1>Logout was done successfully.</h1>
         
    </body>
</html>
