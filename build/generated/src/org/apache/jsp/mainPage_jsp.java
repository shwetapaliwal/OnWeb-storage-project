package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import source.DBConnect1;
import source.DBConnect;
import java.io.FileInputStream;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import org.apache.tomcat.util.http.fileupload.FileItem;
import java.util.Iterator;
import java.util.List;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import java.io.File;
import java.sql.ResultSet;
import java.sql.Statement;
import source.DBConnect;
import java.sql.DriverManager;
import java.sql.Connection;

public final class mainPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("     \n");
      out.write("    \n");
      out.write("\n");
      out.write("    <!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"mainPage_style.css\">\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js\"></script>\n");
      out.write("     <script type=\"text/javascript\" src=\"jquery.js\"></script>\n");
      out.write("     <script type=\"text/javascript\" src=\"login_effect.js\"></script>\n");
      out.write("        <script>\n");
      out.write("        $(document).ready(function() {\n");
      out.write("        $(\"#form\").submit(function() {\n");
      out.write("        $(\"#folder\").hide();\n");
      out.write("    });\n");
      out.write("    $(\"#passwordfolder\").click(function(){\n");
      out.write("        showpassworddiv();\n");
      out.write("    });\n");
      out.write("    $(\"#btnfolder\").click(function(){\n");
      out.write("        \n");
      out.write("        showlocked();\n");
      out.write("        \n");
      out.write("    });\n");
      out.write("    $(\"#passwordForm\").submit(function() {\n");
      out.write("        $(\"#passwordDiv\").hide();\n");
      out.write("    });\n");
      out.write("});\n");
      out.write(" function showpassworddiv()\n");
      out.write(" {\n");
      out.write("   $(\"#passwordDiv\").fadeIn();\n");
      out.write("   $(\"#passwordDiv\").css({\"visibility\":\"visible\",\"display\":\"block\"});  \n");
      out.write(" }\n");
      out.write(" function showlocked()\n");
      out.write(" {\n");
      out.write("     \n");
      out.write("     $(\"#folderpass\").fadeIn();\n");
      out.write("   $(\"#folderpass\").css({\"visibility\":\"visible\",\"display\":\"block\"});\n");
      out.write("   alert('hiii');\n");
      out.write("     \n");
      out.write(" }\n");
      out.write(" function validate(){\n");
      out.write("     document.getElementById(\"span\").innerHTML = \"space not allowed\";\n");
      out.write(" }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("                                              <!--left div body-->\n");
      out.write("        <div id=\"leftdiv\">\n");
      out.write("            <button id=\"btn1\" class=\"button\"><img src=\"images/uparrow.png\">Upload file</button><br/>\n");
      out.write("             <button id='btn2' class=\"button\"><img src=\"images/plus.jpg\"> Create Folder</button><hr>\n");
      out.write("            \n");
      out.write("             <div class=\"menu\">\n");
      out.write("                                                     <!--Logout-->\n");
      out.write("        <div style=\"background-color:cadetblue;position:absolute; right: 100px; top: 40px;\" >\n");
      out.write("            <a href=\"Logout\" class=\"out\">Logout</a>\n");
      out.write("        </div>  \n");
      out.write("                 &nbsp;&nbsp;<img src=\"images/file.png\">&nbsp;&nbsp;<a href=\"uploadFiles.jsp\" target=\"maincontainer\">Files</a><hr>\n");
      out.write("                 &nbsp;&nbsp;<img src=\"images/bluefolder.png\">&nbsp;&nbsp;<a href=\"folderShow.jsp\" target=\"maincontainer\">Folders</a><hr>\n");
      out.write("                 &nbsp;&nbsp;<img src=\"images/lock.png\">&nbsp;&nbsp;<a href=\"lockPassword.jsp\" target=\"maincontainer\">Crypto Folders</a><hr>\n");
      out.write("                 &nbsp;&nbsp;<img src=\"images/trash1.png\">&nbsp;&nbsp;<a href=\"trash_files.jsp\" target=\"maincontainer\"> Trash Files</a><hr>\n");
      out.write("                 &nbsp;&nbsp;<img src=\"images/star.png\">&nbsp;&nbsp;<a href=\"starred.jsp\" target=\"maincontainer\">Important</a><hr>\n");
      out.write("                 \n");
      out.write("             </div>\n");
      out.write("        </div>\n");
      out.write("       \n");
      out.write("                                              <!--upload file window div-->\n");
      out.write("         <div id=\"window\">\n");
      out.write("             <form method=\"post\" action=\"Upload_File\" enctype=\"multipart/form-data\">\n");
      out.write("                 \n");
      out.write("            <center>\n");
      out.write("                <table style=\"padding: 10px;\" width=\"95%\" cellpadding=\"8\" >\n");
      out.write("                    <thead> \n");
      out.write("                    <th colspan=\"6\">Upload File</th>        \n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        <tr>    \n");
      out.write("                            <td>Title : </td>\n");
      out.write("                            <td><input type=\"text\" name=\"title\"  required=\"\"></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Choose File : </td>\n");
      out.write("                            <td><input type=\"file\" name=\"file_uploaded\"  required=\"\"/></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"3\"><center>\n");
      out.write("                                <input type=\"submit\" value=\"Upload\" id=\"fileupload\">\n");
      out.write("                            </center></td>\n");
      out.write("                        </tr>\n");
      out.write("                    </tbody></table></center>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("<br><br>\n");
      out.write("                                    <!--create folder window div-->    \n");
      out.write("        <div id=\"folder\"><br/>\n");
      out.write("            <form action=\"mainFolder.jsp\" target=\"maincontainer\" id=\"form\">\n");
      out.write("                <center><lablel> Enter Folder name :</lablel>\n");
      out.write("                    <input type=\"text\" name=\"folder\" required onkeyup=\"validate();\"/>\n");
      out.write("                    <span id=\"span\" style=\"color: darkred;\"></span><br/></center>\n");
      out.write("                    <center><input type=\"submit\" value=\"create\" style=\"height: 30px; \n");
      out.write("                                                   width: 70px; background-color: black; border-color: black; color: white;\"></center>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        \n");
      out.write("        <div id=\"folderpass\" style=\"height: 140px;\n");
      out.write("       width: 400px;\n");
      out.write("       background-color: lightsalmon;\n");
      out.write("       position: absolute;\n");
      out.write("       top: 200px;\n");
      out.write("       left: 220px;\n");
      out.write("       display: none;   \n");
      out.write("       visibility: hidden;\n");
      out.write("       font-size: 15px;\n");
      out.write("       z-index: 2;\n");
      out.write("       padding: 5px 5px;\"><br/>\n");
      out.write("            <!--<form action=\"\"  >-->\n");
      out.write("                 Enter Folder name : <input type=\"text\" name=\"flder2\" required/>\n");
      out.write("                 <input type=\"submit\" value=\"create\">\n");
      out.write("            <!--</form>-->\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"maindiv\">\n");
      out.write("            <iframe name=\"maincontainer\" src=\"uploadFiles.jsp\" \n");
      out.write("            style=\"width: 100%;height: 900px; box-shadow: 2px 2px 2px gray;\" \n");
      out.write("            frameborder=\"0\">       \n");
      out.write("        </iframe>\n");
      out.write("            </div> \n");
      out.write("            \n");
      out.write("      \n");
      out.write("    </body>\n");
      out.write("    <script type=\"text/javascript\" src=\"mainPage.js\"></script> \n");
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
