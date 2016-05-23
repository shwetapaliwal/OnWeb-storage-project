package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import source.DBConnect;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import source.DBConnect;
import java.sql.DriverManager;
import java.sql.Connection;

public final class first_005fRegister_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/header.jsp");
  }

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
      out.write("\n");
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
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"mainPage_style.css\">\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js\"></script>\n");
      out.write("     <script type=\"text/javascript\" src=\"jquery.js\"></script>\n");
      out.write("     <script type=\"text/javascript\" src=\"login_effect.js\"></script>\n");
      out.write("        <style>\n");
      out.write("             #div1{\n");
      out.write("                   background-size: 50%;\n");
      out.write("                   background-color: cadetblue;\n");
      out.write("             }\n");
      out.write("             h1{\n");
      out.write("            display: inline;\n");
      out.write("            color: darkred;\n");
      out.write("            /*font-family: cursive;*/\n");
      out.write("            font-size: 40px;\n");
      out.write("            }\n");
      out.write("            h3{\n");
      out.write("            color: white;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"div1\"> <h1>On Web Storage</h1><hr/>\n");
      out.write("        </div>\n");
      out.write("        <script type=\"text/javascript\" src=\"MainPage.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    \n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"firstRegisterStyle.css\">\n");
      out.write("        <title>Register yourself</title>\n");
      out.write("         \n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("//                                              validations\n");
      out.write("            function chkSubmit(){\n");
      out.write("\n");
      out.write("                event.preventDefault();\n");
      out.write("               var email =  chkEmail();\n");
      out.write("               var repeat = chkRepeat();\n");
      out.write("               if(email && repeat){\n");
      out.write("                   document.getElementById(\"myform\").submit();\n");
      out.write("               }else{\n");
      out.write("                   alert(\"check pwd and email\");\n");
      out.write("               }\n");
      out.write("           }\n");
      out.write("       \n");
      out.write("            function chkPassword()\n");
      out.write("            {\n");
      out.write("                var pass = document.getElementById(\"txt2\").value;\n");
      out.write("                var show = document.getElementById(\"show\");\n");
      out.write("                var arr = new Array();\n");
      out.write("               \n");
      out.write("                arr[0] = \"weak\";\n");
      out.write("               \n");
      out.write("                arr[1] = \"medium\";\n");
      out.write("                arr[2] = \"Strong\";\n");
      out.write("                arr[3] = \"very strong\";\n");
      out.write("                \n");
      out.write("                var score = 0;\n");
      out.write("                if(pass.length > 8)\n");
      out.write("                    score++;\n");
      out.write("                \n");
      out.write("                if((pass.match(/[a-z]/)) && (pass.match(/[A-Z]/)))\n");
      out.write("                    score++;\n");
      out.write("                \n");
      out.write("                if(pass.match(/\\d+/))\n");
      out.write("                    score++;\n");
      out.write("                \n");
      out.write("                if(pass.match(/.[!,@,#,$,%,^,&,*,~,?,(,),_,-]/))\n");
      out.write("                    score++;\n");
      out.write("                \n");
      out.write("                if(pass.length > 12)\n");
      out.write("                    score++;\n");
      out.write("                \n");
      out.write("                show.innerHTML = arr[score];\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            function chkRepeat()\n");
      out.write("            {\n");
      out.write("                var pwd = document.getElementById(\"txt2\").value;\n");
      out.write("                var cpwd = document.getElementById(\"txt3\").value;\n");
      out.write("                var check = document.getElementById(\"check\");\n");
      out.write("                if((pwd==cpwd)){\n");
      out.write("                    return true;\n");
      out.write("                }\n");
      out.write("                else{\n");
      out.write("                    check.innerHTML = \"Password not match\";\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            function free(){\n");
      out.write("//                var check = document.getElementById(\"check\");\n");
      out.write("                var show = document.getElementById(\"show\");\n");
      out.write("                show.innerHTML = \"\";\n");
      out.write("//                check.innerHTML = \"\";\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            function chkEmail(){\n");
      out.write("                var msg = document.getElementById(\"msg\");\n");
      out.write("                var email = document.getElementById(\"txt1\").value;\n");
      out.write("                 var atpos = email.indexOf(\"@\");\n");
      out.write("                 var dotpos = email.lastIndexOf(\".\");\n");
      out.write("                 if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) {\n");
      out.write("                    msg.innerHTML=\"Not a valid e-mail address\";\n");
      out.write("                 return false;\n");
      out.write("                }\n");
      out.write("                else{\n");
      out.write("                    return true;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write(" \n");
      out.write("         \n");
      out.write("        </script>\n");
      out.write("       \n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("      \n");
      out.write("       \n");
      out.write("        \n");
      out.write("        <!--Designing....-->\n");
      out.write("        <form action=\"registerdb.jsp\" onsubmit=\"chkSubmit();\" id=\"myform\">\n");
      out.write("        <div>\n");
      out.write("        <center> \n");
      out.write("        \n");
      out.write("        <h2>Create an Account</h2>\n");
      out.write("    \n");
      out.write("        <table class=\"table\">\n");
      out.write("            <tr>\n");
      out.write("                <td><label id=\"label1\">Name </label><br/>\n");
      out.write("                    <input type=\"text\" name=\"fname\" placeholder=\"Enter first name\" id=\"txt\" required>\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("                <td><label id=\"label1\">Email Id </label> <br/>\n");
      out.write("                    <input type=\"email\" name=\"email\" placeholder=\"Enter user name\" id=\"txt1\" required onblur=\"chkEmail();\">\n");
      out.write("                    <span id=\"msg\" style=\"color: red ; font-size: 20px;\"/>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            <tr></tr><tr></tr><tr></tr>\n");
      out.write("            \n");
      out.write("            <tr>\n");
      out.write("                \n");
      out.write("                <td>\n");
      out.write("                     \n");
      out.write("                    <label id=\"label1\">Password </label><br/>\n");
      out.write("                    <input type=\"password\" name=\"pwd\" placeholder=\"*****\" id=\"txt2\" required \n");
      out.write("                           onkeyup=\"chkPassword();\" onmouseout=\"free();\">\n");
      out.write("                    <span id=\"show\" style=\"color:red; font-size: 20px;\" />\n");
      out.write("                </td>\n");
      out.write("              \n");
      out.write("                <td><label id=\"label1\">Re-enter Password</label><br/>\n");
      out.write("                    <input type=\"password\" name=\"cpwd\" placeholder=\"*****\" id=\"txt3\" required \n");
      out.write("                           onblur=\"chkRepeat();\">\n");
      out.write("                    <span id=\"check\" style=\"color:red; font-size: 20px;\" />\n");
      out.write("                </td>\n");
      out.write("                \n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            <tr></tr><tr></tr><tr></tr>\n");
      out.write("            \n");
      out.write("            <tr>\n");
      out.write("                <td><label id=\"label1\">Password recovery questions</label><br/>\n");
      out.write("                    <select name='pQues' id=\"txt1\">\n");
      out.write("                        <option>Select your Question</option>\n");
      out.write("                        <option value=\"nn\">Your nick name</option>\n");
      out.write("                        <option value=\"fm\">Favorite movie</option>\n");
      out.write("                        <option value=\"fs\">Favorite sports</option>\n");
      out.write("                        <option value=\"fmn\">Father's middle name</option>\n");
      out.write("                    </select>\n");
      out.write("                </td>\n");
      out.write("                \n");
      out.write("                <td><label id=\"label1\">Your Answer </label><br/>\n");
      out.write("                    <input type=\"text\" name='pans' id=\"txt1\" required/>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("          </table>   \n");
      out.write("           \n");
      out.write("        <input type=\"submit\" value=\"Register for new account\" id=\"button\"/>\n");
      out.write("            \n");
      out.write("        </center>\n");
      out.write("    </div>\n");
      out.write("    </form>\n");
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
