<%-- 
    Document   : Home
    Created on : 28.4.2013, 0:08:46
    Author     : Patres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>      
        <br/><br/><br/><br/><br/>
    <center>
        <h2>
            <%
                String login = session.getAttribute("username").toString();
                out.println("Vitaj  " + login + " v rozhrani OcnaKlinikaIS.");
            %>
        </h2>
        <form method="post">
            <!--            <br/>Username:<input type="text" name="username">
                        <br/>Password:<input type="password" name="password">-->
            Elektronická Zdravotná karta:
            <br/><input type="submit" value="Vytvoriť" formaction="CreatePacientCard.jsp">
            <br/><input type="submit" value="Vyhľadať" formaction="SearchPacientCard.jsp">
        </form>
        <br/>
        <br/>
        <br/><br/><br/><br/><br/>
        
    <%
        if (session.getAttribute("flash") != null) {
    %>   

    <h3> <%= session.getAttribute("flash")%> </h3>

    <%        
        session.setAttribute("flash", null);
        }
//            connection.close();
    %>

        <a href="Logout.jsp">Logout</a>
    </center>


</body>
</html>
