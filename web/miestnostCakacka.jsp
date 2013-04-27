<%-- 
    Document   : main
    Created on : 26.4.2013, 10:03:45
    Author     : notebook
--%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cakacia listina</title>
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

// check weather connection is established or not by isClosed() method 
            
            String miestnost =request.getParameter("miestnost");
            String stlpce="miestnost.nazov,poznamka,zakrok.nazov";
            String tabulky="cakacia_listina, miestnost,zaznam_cakacka,zakrok";
            String podmienka="(miestnost.id=cakacia_listina.id_miestnost) and (cakacia_listina.id_zaznam_cakacka=zaznam_cakacka.id) and (zaznam_cakacka.id_zakrok=zakrok.id) and id_miestnost="+miestnost;
            ResultSet vystup = connection.createStatement().executeQuery("Select "+stlpce+" from " +tabulky+" where "+podmienka);
        %>
        
<%
while(vystup.next()){
%>
<p>
    <%=vystup.getString(1)%>
    <%=vystup.getString(2)%>
    <%=vystup.getString(3)%>
</p>
<%}
            connection.close();
            %>
    </body>
</html>
