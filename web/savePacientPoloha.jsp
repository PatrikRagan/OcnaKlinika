<%-- 
    Document   : savePacientPoloha
    Created on : 28.4.2013, 22:07:15
    Author     : notebook
--%>
<%@page import="java.sql.Date"%>
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
            String id_zamestnanca=null;
            while (vystup.next()) {
                id_zamestnanca = vystup.getString("id");
            }
            String miestnost = request.getParameter("miestnost");
            String pacient = request.getParameter("name");
            String poloha="insert into klinika.zaznam_pobyt (datetime,id_zamestnanec,id_miestnost,id_pacient) values (now(),'"+id_zamestnanca+"','"+request.getParameter("miestnost")+"','"+pacient+"')";
            System.out.println("POLOHA>"+poloha);
            connection.createStatement().execute(poloha);

        %>
        <h1>Uložené<h1>
    </body>
</html>
