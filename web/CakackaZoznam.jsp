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
    <%
            /* Create string of connection url within specified format with machine name, port number and database name. Here machine name id localhost and database name is usermaster. */
            String connectionURL = "jdbc:mysql://localhost:3306/klinika";

// declare a connection by using Connection interface
            Connection connection = null;

// Load JBBC driver "com.mysql.jdbc.Driver"
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database. */
            connection = DriverManager.getConnection(connectionURL, "root", "heslo987");

// check weather connection is established or not by isClosed() method 
            ResultSet vystup = connection.createStatement().executeQuery("Select * from zaznam_cakacka");
        %>
    <body>
        <table border="1">
            <tr>
                <td>Čas</td>
                <td>poznamka</td>
                <td>zákrok</td>
                <td>rezervoval</td>
            </tr>
        <%
while(vystup.next()){
        %><tr>
            <td><%=vystup.getString("datetime")%></td>
            <td><%=vystup.getString("poznamka")%></td>
            <%
            ResultSet zakrok = connection.createStatement().executeQuery("select nazov from zakrok where id='"+vystup.getString("id_zakrok")+"'");
String zak=null;            
while(zakrok.next()){zak=zakrok.getString("nazov");}            
%>
       <td><%=zak%></td>
       <%
            ResultSet zadavatel = connection.createStatement().executeQuery("select * from zamestnanec where id='"+vystup.getString("id_autor")+"'");
            String zadal=null;            
    while(zadavatel.next()){zadal=zadavatel.getString("meno")+" "+zadavatel.getString("priezvisko");}            
%>
        <td><%=zadal%></td>
        </tr>
        <%
}        
%>
        
        </table>
    </body>
</html>
