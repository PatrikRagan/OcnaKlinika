package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            /* Create string of connection url within specified format with machine name, port number and database name. Here machine name id localhost and database name is usermaster. */
            String connectionURL = "jdbc:mysql://localhost:3306/klinika";

// declare a connection by using Connection interface 
            Connection connection = null;

// Load JBBC driver "com.mysql.jdbc.Driver"
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database. */
            connection = DriverManager.getConnection(connectionURL, "root", "heslo987");

// check weather connection is established or not by isClosed() method 
            ResultSet vystup = connection.createStatement().executeQuery("Select * from miestnost");
        
      out.write("\n");
      out.write("        <form action=\"index.jsp\" method=\"POST\">\n");
      out.write("            ");

                while (vystup.next()) {
            
      out.write("\n");
      out.write("            <select name=\"miestnost\"> <option value=\"");
      out.print(vystup.getString(1));
      out.write("\"> ");
      out.print(vystup.getString(2));
      out.write("<option> </select>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("            <input type=\"submit\" value=\"zobraz\">\n");
      out.write("        </form>\n");
      out.write("        ");
  if (request != null) {
                String miestnost = request.getParameter("miestnost");
                String stlpce = "miestnost.nazov,poznamka,zakrok.nazov";
                String tabulky = "cakacia_listina, miestnost,zaznam_cakacka,zakrok";
                String podmienka = "(miestnost.id=cakacia_listina.id_miestnost) and (cakacia_listina.id_zaznam_cakacka=zaznam_cakacka.id) and (zaznam_cakacka.id_zakrok=zakrok.id) and id_miestnost=" + miestnost;
                ResultSet odpoved = connection.createStatement().executeQuery("Select " + stlpce + " from " + tabulky + " where " + podmienka);
                while (odpoved.next()) {
        
      out.write("\n");
      out.write("        <p>\n");
      out.write("            ");
      out.print(odpoved.getString(1));
      out.write("\n");
      out.write("            ");
      out.print(odpoved.getString(2));
      out.write("\n");
      out.write("            ");
      out.print(odpoved.getString(3));
      out.write("\n");
      out.write("        </p>\n");
      out.write("\n");
      out.write("        ");

                }
            }
            connection.close();
        
      out.write("\n");
      out.write("        </font>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
