<%-- 
    Document   : test
    Created on : 28.4.2013, 0:10:02
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
            /* Create string of connection url within specified format with machine name, port number and database name. Here machine name id localhost and database name is usermaster. */
//            String connectionURL = "jdbc:mysql://localhost:3306/klinika";
//
//// declare a connection by using Connection interface 
//            Connection connection = null;
//
//// Load JBBC driver "com.mysql.jdbc.Driver"
//            Class.forName("com.mysql.jdbc.Driver").newInstance();
//
//            /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database. */
//            connection = DriverManager.getConnection(connectionURL, "root", "heslo987");
//
//// check weather connection is established or not by isClosed() method 
//            ResultSet vystup = connection.createStatement().executeQuery("Select * from zamestnaneclogin");
        %>
   <center>
        <h1>Očná klinika</h1>
 
        <h2>Prihlasovacie údaje:</h2>
        <form action="LoginCheck.jsp" method="post">
            <br/>Username:<input type="text" name="username">
            <br/>Password:<input type="password" name="password">
            <br/><input type="submit" value="Prihlásenie">
        </form>
        <form action="Register.jsp" method="post">
            <input type="submit" value="Registrácia">
        </form>
    </center>
    <%
        if (session.getAttribute("message") != null) {
    %>   

    <h3> <%= session.getAttribute("message")%> </h3>

    <%        
        session.setAttribute("message", null);
        }
//            connection.close();
    %>
</body>
</html>
