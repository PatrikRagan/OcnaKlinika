<%-- 
    Document   : Room
    Created on : 28.4.2013, 22:04:49
    Author     : Patres
--%>
<%@page import="java.sql.Statement"%>
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

            /* Create string of connection url within specified format with machine name, port number and database name. Here machine name id localhost and database name is usermaster. */
            String connectionURL = "jdbc:mysql://localhost:3306/klinika";

// declare a connection by using Connection interface 
            Connection connection = null;

// Load JBBC driver "com.mysql.jdbc.Driver"
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database. */
            connection = DriverManager.getConnection(connectionURL, "root", "heslo987");
//            Integer resp = -1;
//            Statement statement = connection.createStatement();

            ResultSet vystup = connection.createStatement().executeQuery("Select nazov From klinika.miestnost");

        %>

        <h1>Čakacia listina pre miestnosť</h1>



        <form action="RoomCheck.jsp" method="post">
            <p>Údaje
                <br/>Dátum:<input type="datetime" name="datum">
                <br/>Poznamka:<input type="text" name="poznamka">
                <br/><select name="miestnost"> 
                    <%
                        while (vystup.next()) {
                    %>

                    <option value="<%=vystup.getString("nazov")%>"><%=vystup.getString("nazov")%><option> 

                        <%
                     
                            }
                        %>
                </select>
                <!--<br/>Názov miestnosti:<input type="text" name="miestnost">-->
                <br/>Zákrok:<input type="text" name="zakrok">
            </p>
            <br/><input type="submit" value="Potvrdiť">
            <input type="submit" value="Návrat" formaction="Home.jsp">
        </form>
    </body>
</html>
