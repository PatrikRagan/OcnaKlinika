<%-- 
    Document   : PatientCheck
    Created on : 28.4.2013, 13:46:30
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

            String meno = request.getParameter("meno");
            String priezvisko = request.getParameter("priezvisko");
            String narodenie = request.getParameter("narodenie");
            String rc = request.getParameter("rc");
            String poistovna = request.getParameter("poistovna");
            String dotaz = "SELECT * FROM ";
            String tabulky = "pacient ";
            String podmienka = "WHERE ";
            if (meno.length() > 0) {
                podmienka = podmienka.concat("meno='" + meno + "' ");
            }
            if ((priezvisko.length() > 0) && (meno.length() > 0)) {
                podmienka = podmienka.concat("and priezvisko='" + priezvisko + "' ");
            }
            if ((priezvisko.length() > 0) && (meno.length() == 0)) {
                podmienka = podmienka.concat("priezvisko='" + priezvisko + "' ");
            }
            if ((narodenie.length() > 0) && ((meno.length() > 0) || (priezvisko.length() > 0))) {
                podmienka = podmienka.concat("and narodenie='" + narodenie + "' ");
            }
            if ((narodenie.length() > 0) && !((meno.length() > 0l) || (priezvisko.length() > 0))) {
                podmienka = podmienka.concat("narodenie='" + narodenie + "' ");
            }
            if ((rc.length() > 0) && ((meno.length() > 0) || (priezvisko.length() > 0) || (narodenie.length() > 0))) {
                podmienka = podmienka.concat("and rc='" + rc + "' ");
            }
            if ((rc.length() > 0) && !((meno.length() > 0) || (priezvisko.length() > 0) || (narodenie.length() > 0))) {
                podmienka = podmienka.concat("rc='" + rc + "' ");
            }
            if ((poistovna.length() > 0) && ((meno.length() > 0) || (priezvisko.length() > 0) || (narodenie.length() > 0) || (rc.length() > 0))) {
                podmienka = podmienka.concat("and (klinika.poistovna.id=klinika.pacient.poistovna_id) and poistovna.nazov='" + poistovna + "' ");
                tabulky = tabulky.concat(",poistovna ");
            }
            if ((poistovna.length() > 0) && !((meno.length() > 0) || (priezvisko.length() > 0) || (narodenie.length() > 0) || (rc.length() > 0))) {
                podmienka = podmienka.concat("and (klinika.poistovna.id=klinika.pacient.poistovna_id)and poistovna.nazov='" + poistovna + "' ");
                tabulky = tabulky.concat(",poistovna ");
            }
            dotaz = dotaz + tabulky + podmienka;
            System.out.println("-----------------------------------------------------------------------------");
            System.out.println(">" + priezvisko + "<");
            System.out.println(dotaz);
            ResultSet vystup = connection.createStatement().executeQuery(dotaz);
        %>
        <p>Výsledok:</p>
        <table border="1">             

            <tr>
                <td>meno</td>
                <td>priezvisko</td>
                <td>rodné číslo</td>
                <td>kontakt</td>
                <td>dátum narodenia</td>

            </tr>

            <%
                while (vystup.next()) {
                    String dot ="Select * from poistovna where id='"+vystup.getString(6)+"'";
                    ResultSet poistov= connection.createStatement().executeQuery(dot);
            %> <tr>
                <td><a href="popis.jsp"><%=vystup.getString(2)%></a></td>
                <td><a href="popis.jsp"><%=vystup.getString(3)%></a></td>
                <td><a href="popis.jsp"><%=vystup.getString(4)%></a></td>
                <td><a href="popis.jsp"><%=vystup.getString(5)%></a></td>
                <td><a href="popis.jsp"><%=vystup.getString(9)%></a></td>
            </tr>
            <%
                }
            
                connection.close();
            %>
        </table>
    </body>
</html>

