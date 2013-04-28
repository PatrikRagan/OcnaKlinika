<%-- 
    Document   : popis.jsp
    Created on : 28.4.2013, 15:27:37
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

            String dotaz = "select * from pacient where id='" + request.getParameter("name") + "'";
            System.out.println("VYPIS>" + dotaz);
            ResultSet vystup = connection.createStatement().executeQuery(dotaz);
            while (vystup.next()) {

        %>
        <form action="PacientUpdate.jsp?name=<%=vystup.getString("id")%>&byt=<%=vystup.getString("id_bydlisko")%>" method="post">
            Meno:<input type="text" name="meno" value="<%=vystup.getString("meno")%>">
            <br/>Priezvisko:<input type="text" name="priezvisko" value="<%=vystup.getString("priezvisko")%>">
            <br/>Datum narodenia:<input type="text" name="narodenie" value="<%=vystup.getString("narodenie")%>">
            <br/>Rodné číslo:<input type="text" name="rc" value="<%=vystup.getString("rc")%>">
            <br/>Kontakt:<input type="text" name="kontakt" value="<%=vystup.getString("kontakt")%>">
            <br/>Zdravotna poisťovňa:
            <%ResultSet poistovne = connection.createStatement().executeQuery("select * from poistovna;");

                while (poistovne.next()) {
                    if (poistovne.getString("id") == vystup.getString("id_poistovna")) {%>
            <br/> <input type="radio" name="poistovna" checked="true" value="<%=poistovne.getString("id")%>"><%=poistovne.getString("nazov")%>
            <%} else {%>
            <br/> <input type="radio" name="poistovna" value="<%=poistovne.getString("id")%>"><%=poistovne.getString("nazov")%>
            <%
                    }
                }
            %>
            <%ResultSet bydlisko = connection.createStatement().executeQuery("select * from bydlisko where id=" + vystup.getString("id_bydlisko"));

                while (bydlisko.next()) {
            %>
            <br/>Ulica:<input type="text" name="ulica" value="<%=bydlisko.getString("ulica")%>">
            <br/>Čislo:<input type="text" name="cislo" value="<%=bydlisko.getString("cislo")%>">
            <br/>Mesto:<input type="text" name="mesto" value="<%=bydlisko.getString("mesto")%>">
            <br/>PSČ:<input type="text" name="psc" value="<%=bydlisko.getString("psc")%>">
            <%}%>
            <br/>Pohlavie: 
            <%if (vystup.getString("pohlavie").equals("M")) {%>
            <input type="radio" name="pohlavie" value="M" checked="true">muž
            <input type="radio" name="pohlavie" value="F">žena
            <%} else {%>
            <input type="radio" name="pohlavie" value="M">muž
            <input type="radio" name="pohlavie" value="F" checked="true">žena
            <%}%>
             <br/><input type="submit" value="Ulož">
        </form>
        <%
            }%>
            
    </body>
</html>
