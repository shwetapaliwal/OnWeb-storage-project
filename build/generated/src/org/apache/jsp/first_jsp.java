package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import source.DBConnect;
import java.sql.DriverManager;
import java.sql.Connection;

public final class first_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("   \n");
      out.write("    <head>\n");
      out.write("         <link rel=\"stylesheet\" type=\"text/css\" href=\"first_LoginStyle.css\">\n");
      out.write("     <script type=\"text/javascript\" src=\"jquery.js\"></script>\n");
      out.write("     <script type=\"text/javascript\" src=\"login_effect.js\"></script>\n");
      out.write("     <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js\"></script>\n");
      out.write("        <title>Login Page</title>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function(){\n");
      out.write("            \n");
      out.write("            $(\"#login_btn\").click(function(){\n");
      out.write("            showpopup();\n");
      out.write("            });\n");
      out.write("        });\n");
      out.write("\n");
      out.write("            function showpopup()\n");
      out.write("            {\n");
      out.write("                $(\"#loginform\").fadeIn();\n");
      out.write("                $(\"#loginform\").css({\"visibility\":\"visible\",\"display\":\"block\"});\n");
      out.write("            }\n");
      out.write("        </script> \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("                                                 <!-- top heading-->\n");
      out.write("        <div class=\"div1\">\n");
      out.write("            <h1>OnWeb Storage</h1>\n");
      out.write("             <button id=\"login_btn\">Log In</button>  \n");
      out.write("            <hr/>\n");
      out.write("        </div>\n");
      out.write("            <br/><br/>\n");
      out.write("                                                <!--center headings-->\n");
      out.write("        <div class=\"div2\">\n");
      out.write("            <h2 style=\"font-size:50px; color: white;\">Your personal and private Storage Space</h2>\n");
      out.write("            <h3 style=\"color: white;\">Get to your files from anywhere, \n");
      out.write("                on any device, with OnWeb Storage.<br/> \n");
      out.write("                Share and work together with anyone in your work and life.</h3><br/>\n");
      out.write("                                \n");
      out.write("                                                <!--Sign Up button-->\n");
      out.write("                <input type=submit \n");
      out.write("                   onClick=window.open('first_Register.jsp','Ratting',\"width=1070,height=970,left=50,top=100,toolbar=0,status=0,\"); \n");
      out.write("                   name=\"signup\" value=\"Sign Up Now\" id=\"sign\"/>\n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("                                                   <!--log in window-->\n");
      out.write("        \n");
      out.write("        <div id = \"loginform\">\n");
      out.write("            <form action=\"\" name=\"loggedform\">\n");
      out.write("            <a href=\"first.jsp\"><input type=\"image\" class=\"close\" src=\"images/close.png\"></a>\n");
      out.write("            <center>\n");
      out.write("                <h2 style=\"color: black;\">Log In to your account..</h2>\n");
      out.write("                <table cellspacing=\"2\" class=\"table\">\n");
      out.write("                    <tr>\n");
      out.write("                        <td><input type=\"email\" name=\"email\" placeholder=\"Enter Email Id\" id=\"uid\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("            \n");
      out.write("                    <tr>\n");
      out.write("                        <td><input type=\"password\" name=\"pwd\" placeholder=\"*****\" id=\"uid\"/></td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("               \n");
      out.write("                 ");
   
                    Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
                    Statement st = con.createStatement();
                    String eid = request.getParameter("email");
                    String pass = request.getParameter("pwd");
            
                    ResultSet rs = st.executeQuery("select * from register where uname = '"+eid+"'");
                    while(rs.next())
                    {
                        String id = rs.getString(2);
                        String p = rs.getString(3);
                        if((id.equals(eid))&& (p.equals(pass)))
                        {
                            response.sendRedirect("mainPage.jsp");
                        }
                        else{
                            out.print("<script>alert('The Email address or/and password you specified is not correct');window.location('first.jsp');</script>");               
                        }
                    }
                
      out.write("\n");
      out.write("                \n");
      out.write("                <div>\n");
      out.write("                    <input type=\"submit\" value=\"Log In\" id=\"login\"/>\n");
      out.write("                    <label>Need an Account?? &nbsp;<a href=\"first_Register.jsp\">Sign Up</a></label>\n");
      out.write("                    <a href=\"forgot password.jsp\" class=\"fpassword\"> Forgot your Password?</a>\n");
      out.write("                </div>\n");
      out.write("            </center>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("      \n");
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
