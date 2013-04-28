<%-- 
    Document   : PolohaPacienta
    Created on : 28.4.2013, 21:41:29
    Author     : notebook
--%>
<%@page import="javassist.compiler.ast.Symbol"%>
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
            String login = (String) session.getAttribute("username");
            String dotaz = "select * from klinika.zamestnaneclogin where login='" + login + "'";
            System.out.println("VYPIS>" + dotaz);
            ResultSet vystup = connection.createStatement().executeQuery(dotaz);
            String id_zamestnanca;
            while (vystup.next()) {
                id_zamestnanca = vystup.getString("id");
            }
            ResultSet miestnosti = connection.createStatement().executeQuery("Select * from miestnost");

        %>
        <form action="savePacientPoloha.jsp?name=<%=request.getParameter("name") %>" method="post">
            Miestnosť:
            <%
                while (miestnosti.next()) {
            %>
            <select name="miestnost"> <option value="<%=miestnosti.getString("id")%>"> <%=miestnosti.getString("nazov")%><option> </select>
            <%
                }
            %>
            <input type="submit" value="uloz">
        </form>
            Ste prihlasený ako:
        <%String p = (String) session.getAttribute("username");%>
        <p><%=p%></p>
    </body>

    <%              connection.close();
    %>
</html>
