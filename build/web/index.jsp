<%-- 
    Document   : index
    Created on : 26.4.2013, 8:28:30
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
            /* Create string of connection url within specified format with machine name, port number and database name. Here machine name id localhost and database name is usermaster. */
            String connectionURL = "jdbc:mysql://localhost:3306/klinika";

// declare a connection by using Connection interface 
            Connection connection = null;

// Load JBBC driver "com.mysql.jdbc.Driver"
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database. */
            connection = DriverManager.getConnection(connectionURL, "root", "heslo987");

// check weather connection is established or not by isClosed() method 
            ResultSet vystup = connection.createStatement().executeQuery("Select * from miestnost");
        %>
        <form action="index.jsp" method="POST">
            <%
                while (vystup.next()) {
            %>
            <select name="miestnost"> <option value="<%=vystup.getString(1)%>"> <%=vystup.getString(2)%><option> </select>
            <%
                }
            %>
            <input type="submit" value="zobraz">
        </form>
        <%  if (request != null) {
                String miestnost = request.getParameter("miestnost");
                String stlpce = "miestnost.nazov,poznamka,zakrok.nazov";
                String tabulky = "cakacia_listina, miestnost,zaznam_cakacka,zakrok";
                String podmienka = "(miestnost.id=cakacia_listina.id_miestnost) and (cakacia_listina.id_zaznam_cakacka=zaznam_cakacka.id) and (zaznam_cakacka.id_zakrok=zakrok.id) and id_miestnost=" + miestnost;
                ResultSet odpoved = connection.createStatement().executeQuery("Select " + stlpce + " from " + tabulky + " where " + podmienka);
                while (odpoved.next()) {
        %>
        <p>
            <%=odpoved.getString(1)%>
            <%=odpoved.getString(2)%>
            <%=odpoved.getString(3)%>
        </p>

        <%
                }
            }
            connection.close();
        %>
        </font>

    </body>
</html>
