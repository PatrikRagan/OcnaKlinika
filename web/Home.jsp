<%-- 
    Document   : Home
    Created on : 28.4.2013, 0:08:46
    Author     : Patres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="Error.jsp"%>
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
            String a=session.getAttribute("username").toString();
            out.println("Vitaj  "+a +" v rozhrani OcnaKlinikaIS.");
            %>
            </h2>
            <br/>
            <br/>
            <br/><br/><br/><br/><br/>
        <a href="Logout.jsp">Logout</a>
        </center>
    
 
    </body>
</html>