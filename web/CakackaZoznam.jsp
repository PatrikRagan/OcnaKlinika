<%-- 
    Document   : CakackaZoznam
    Created on : 28.4.2013, 23:44:43
    Author     : notebook
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>

        <%
            session.setAttribute("show", "true");
            response.sendRedirect("Listina.jsp");
        %>

    </body>
</html>
