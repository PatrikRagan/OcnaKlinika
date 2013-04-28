<%-- 
    Document   : LoginCheck
    Created on : 28.4.2013, 0:08:20
    Author     : Patres
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            Boolean succes = false;
        %>

        <%
            /* Create string of connection url within specified format with machine name, port number and database name. Here machine name id localhost and database name is usermaster. */
            String connectionURL = "jdbc:mysql://localhost:3306/klinika";

// declare a connection by using Connection interface 
            Connection connection = null;

// Load JBBC driver "com.mysql.jdbc.Driver"
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database. */
            connection = DriverManager.getConnection(connectionURL, "root", "heslo987");

// check weather connection is established or not by isClosed() method 
            ResultSet vystup = connection.createStatement().executeQuery("Select * from zamestnaneclogin");
        %>

        <%
            while (vystup.next()) {

                if (username.equals(vystup.getString("login")) && password.equals(vystup.getString("password"))) {
                    succes = true;
                    session.setAttribute("username", username);
                }
            }
            if (succes == true) {

                response.sendRedirect("Home.jsp");
            } else {
                response.sendRedirect("Login.jsp");
                session.setAttribute("message", "Nesprávny login");
            }

        %>
    </body>
</html>
