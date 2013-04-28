<%-- 
    Document   : CreatePacientCardCheck
    Created on : 28.4.2013, 15:34:59
    Author     : Patres
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%            
            String meno = request.getParameter("meno");
            String priezvisko = request.getParameter("priezvisko");
            String rc = request.getParameter("rc");
            String kontakt = request.getParameter("kontakt");
            String ulica = request.getParameter("ulica");
            String cislo = request.getParameter("cislo");
            String mesto = request.getParameter("mesto");
            String psc = request.getParameter("psc");
            String poistovna = request.getParameter("poistovna");
            String poistovna2 = request.getParameter("poistovna2");
//            Enumeration<String> plist = request.getParameterNames();
//            while (plist.hasMoreElements()) {
//                out.print(plist.nextElement() + " ");
//            }
//            x=request.getParameterNames();
//            out.print(poistovna);

            /* Create string of connection url within specified format with machine name, port number and database name. Here machine name id localhost and database name is usermaster. */
            String connectionURL = "jdbc:mysql://localhost:3306/klinika";

// declare a connection by using Connection interface 
            Connection connection = null;

// Load JBBC driver "com.mysql.jdbc.Driver"
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database. */
            connection = DriverManager.getConnection(connectionURL, "root", "heslo987");

// check weather connection is established or not by isClosed() method 
            Integer respPoistovna = -1;
            Integer respPacient = -1;
            Integer respBydlisko = -1;
            String sqlPoistovna = "INSERT INTO klinika.poistovna (`nazov`) VALUES ('" + poistovna + "')";
            String sqlPoistovna2 = "INSERT INTO klinika.poistovna (`nazov`) VALUES ('" + poistovna2 + "')";
            String sqlBydlisko = "INSERT INTO klinika.bydlisko (`ulica`, `cislo`, `mesto`, `psc`) VALUES"
                    + "('" + ulica + "', " + cislo + ", '" + mesto + "', '" + psc + "')";
            Statement statement = connection.createStatement();
            if (poistovna != "") {
                respPoistovna = statement.executeUpdate(sqlPoistovna);
            } else if (poistovna == "" || poistovna == null) {
//                respPoistovna = statement.executeUpdate(sqlPoistovna2);
            }
            if (ulica != null && cislo != null && mesto != null && psc != null) {
                respBydlisko = statement.executeUpdate(sqlBydlisko);
            }
            
            String sqlIdPoistovna = "SELECT DISTINCT id FROM klinika.poistovna WHERE nazov = '" + poistovna + "'";
            String sqlIdBydlisko = "SELECT DISTINCT id FROM klinika.bydlisko WHERE ulica = '" + ulica + "' AND mesto = '" + mesto + "' AND cislo = '" + cislo + "' ";
            ResultSet vystupPoistovna = connection.createStatement().executeQuery(sqlIdPoistovna);
            ResultSet vystupBydlisko = connection.createStatement().executeQuery(sqlIdBydlisko);
            vystupBydlisko.next();
            vystupPoistovna.next();
            
            String sqlPacient = "INSERT INTO klinika.pacient (`meno`, `priezvisko`, `rc`, `kontakt`, `poistovna_id`, `bydlisko_id`) VALUES"
                    + "('" + meno + "', '" + priezvisko + "', '" + rc + "', '" + kontakt + "', " + vystupPoistovna.getString("id") + ", " + vystupBydlisko.getString("id") + ") ";
            if (meno != "" && priezvisko != "" && rc != "" && kontakt != "") {
                respPacient = statement.executeUpdate(sqlPacient);
            }
            if (respPoistovna == -1) {
                response.sendRedirect("CreatePacientCard.jsp");
                session.setAttribute("message", "Chyba pri vlkladani poistovne.");
            } else if (respBydlisko == -1) {
                response.sendRedirect("CreatePacientCard.jsp");
                session.setAttribute("message", "Chyba pri vlkladani bydliska.");
            } else if (respPacient == -1) {
                response.sendRedirect("CreatePacientCard.jsp");
                session.setAttribute("message", "Chyba pri vlkladani pacienta.");
            } else {
                response.sendRedirect("Home.jsp");
                session.setAttribute("flash", "Pacient bol uspesne vytvoreny.");
            }


//  INSERT INTO `pacient` (`id`, `meno`, `priezvisko`, `rc`, `kontakt`, `poistovna_id`, `bydlisko_id`) VALUES
//(1, 'Janko', 'Hraško', '9010159065', '0901123123', 1, 1);
//  INSERT INTO `poistovna` (`id`, `nazov`) VALUES
//(1, 'Vseobecna');
//            INSERT INTO `bydlisko` (`id`, `ulica`, `cislo`, `mesto`, `psc`) VALUES
//(1, 'Letná', 9, 'Košice', '04001');

        %>

    </body>
</html>
