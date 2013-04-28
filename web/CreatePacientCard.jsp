<%-- 
    Document   : CreatePacientCard
    Created on : 28.4.2013, 15:09:01
    Author     : Patres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

         <%
        if (session.getAttribute("message") != null) {
    %>   

    <h3> <%= session.getAttribute("message")%> </h3>

    <%        
        session.setAttribute("message", null);
        }
//            connection.close();
    %>
        
        <%//  INSERT INTO `pacient` (`id`, `meno`, `priezvisko`, `rc`, `kontakt`, `poistovna_id`, `bydlisko_id`) VALUES
//(1, 'Janko', 'Hraško', '9010159065', '0901123123', 1, 1);
//  INSERT INTO `poistovna` (`id`, `nazov`) VALUES
//(1, 'Vseobecna');
//            INSERT INTO `bydlisko` (`id`, `ulica`, `cislo`, `mesto`, `psc`) VALUES
//(1, 'Letná', 9, 'Košice', '04001');
        %>
        <h1>Vytvorenie novej zdravotnej karty.</h1>
        <form action="CreatePacientCardCheck.jsp" method="post">
            <p>Údaje
                <br/>Meno:<input type="text" name="meno">
                <br/>Priezvisko:<input type="text" name="priezvisko">
                <br/>Rodné číslo:<input type="text" name="rc" value="0000000000">
                <br/>Kontakt:<input type="text" name="kontakt">
            </p>
            <p>Bydlisko
                <br/>Ulica:<input type="text" name="ulica">
                <br/>Číslo:<input type="text" name="cislo">
                <br/>Mesto:<input type="text" name="mesto">
                <br/>PSČ:<input type="text" name="psc" value="00000">
            </p>
            <p>Poisťovňa                
                <!--<br/>Názov:<input type="text" name="poistovna">-->
                <br/><input type="radio"  name="poistovna" value="vseobecna">Všeobecná
                <br/><input type="radio"  name="poistovna" value="dovera">Dôvera
                <br/><input type="radio"  name="poistovna" value="union">Union
                <br/><input type="radio"  name="poistovna" value="">Iná <input type="text" name="poistovna2">
            </p>
            <br/><input type="submit" value="Potvrdiť">
        </form>

        
    </body>
</html>
