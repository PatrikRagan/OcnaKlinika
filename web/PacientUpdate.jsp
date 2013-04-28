<%-- 
    Document   : PacientUpdate
    Created on : 28.4.2013, 19:43:20
    Author     : notebook
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
            
            String connectionURL = "jdbc:mysql://localhost:3306/klinika";


            Connection connection = null;


            Class.forName("com.mysql.jdbc.Driver").newInstance();

            System.out.println("KONTROLA1");
            connection = DriverManager.getConnection(connectionURL, "root", "heslo987");
            String seter= "ulica='"+ulica+"', cislo='"+cislo+"', mesto='"+mesto+"', psc='"+psc+"' ";
            String updateBydlisko = "UPDATE klinika.bydlisko set "+seter+"where id='"+request.getParameter("byt")+"'";
          System.out.println("KONTROLA2>"+updateBydlisko);
            Statement statement = connection.createStatement();
            statement.execute(updateBydlisko);
          System.out.println("KONTROLA3");  
            String seter2="set meno='"+meno+"', priezvisko='"+priezvisko+"', rc='"+rc+"', kontakt='"+kontakt+"', id_poistovna='"+poistovna+"'";
            String updateUdaje ="UPDATE klinika.pacient "+seter2+" WHERE id='"+request.getParameter("name")+"'";
            
            System.out.println("KONTROLA4>"+updateUdaje);
            statement.execute(updateUdaje);
         System.out.println("KONTROLA5");   
       
          connection.close();         
    %>
        <h1>Uložené</h1>
        
    </body>
</html>
