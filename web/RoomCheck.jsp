<%-- 
    Document   : RoomCheck
    Created on : 28.4.2013, 22:52:07
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
            Integer respMiestnost = -1;
            Integer respCakacka = -1;
            Integer respZakrok = -1;
            String datum = request.getParameter("datum");
            String poznamka = request.getParameter("poznamka");
            String miestnost = request.getParameter("miestnost");
            String nazov = request.getParameter("nazov");
            String zakrok = request.getParameter("zakrok");
            String sql = "Insert into klinika.zaznam_cakacka (`datetime`, `poznamka`, `id_pacient`, `id_zakrok`, `id_autor`, `id_vykonal`, `id_miestnost`) VALUES('2013-04-25 15:14:13', 'asda' ,'1','1','1','1','1')";
// check weather connection is established or not by isClosed() method 
//            ResultSet vystup = connection.createStatement().executeQuery("Select * from zamestnaneclogin");
            Statement statement = connection.createStatement();
            if (miestnost != null) {
                respMiestnost = statement.executeUpdate("INSERT INTO klinika.miestnost (`nazov`) VALUES('" + miestnost + "')");
            }
            if (zakrok != null) {
                respZakrok = statement.executeUpdate("INSERT INTO klinika.zakrok (`nazov`) VALUES('" + zakrok + "')");
            }
            if (datum != null) {
                respCakacka = statement.executeUpdate("Insert into klinika.zaznam_cakacka (`datetime`, `poznamka`, `id_pacient`, `id_zakrok`, `id_autor`, `id_vykonal`, `id_miestnost`) VALUES('" + datum + "', '"+poznamka+"' ,'1','1','1','1','1')");
//                respCakacka = statement.executeUpdate(sql);
            }
            if (respCakacka != -1 ) {
//                connection.close();
                response.sendRedirect("Home.jsp");
                session.setAttribute("flash", "Úspešne pridaná položka do čakacej listiny.");
            } else {
                response.sendRedirect("Room.jsp");
                session.setAttribute("message", "Neúspešne pridaná položka do čakacej listiny");
            }


        %>

        <%//             INSERT INTO `miestnost` (`id`, `nazov`) VALUES
//(1, 'Operacka');
//            INSERT INTO `zaznam_cakacka` (`id`, `datetime`, `poznamka`, `id_pacient`, `id_zakrok`, `id_autor`, `id_vykonal`, `id_miestnost`) VALUES
//(1, '2013-04-25 15:14:13', 'Doniesť skalpel', 1, 1, 1, NULL, 1),
//(3, '2013-04-17 05:01:00', 'Pokus', 1, 1, 1, NULL, 1);
//            INSERT INTO `zakrok` (`id`, `nazov`) VALUES
//(1, 'Transplantácia očnej rohovky');
        %>

    </body>
</html>
