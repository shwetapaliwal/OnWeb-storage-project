package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import source.DBConnect;
import java.sql.DriverManager;
import java.sql.Connection;

public final class trash_005ffiles_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <script>\n");
      out.write("            function loadContactRecordByName()\n");
      out.write("            {\n");
      out.write("                var xmlhttp;\n");
      out.write("                if (window.XMLHttpRequest)\n");
      out.write("                {\n");
      out.write("                    xmlhttp=new XMLHttpRequest();\n");
      out.write("                }\n");
      out.write("                else\n");
      out.write("                {\n");
      out.write("                    xmlhttp=new ActiveXObject(\"Microsoft.XMLHTTP\");\n");
      out.write("                }\n");
      out.write("                var fName = document.getElementById('fName').value.trim();\n");
      out.write("                xmlhttp.open(\"POST\",\"SearchTrash.jsp?fName=\"+fName,true);\n");
      out.write("                xmlhttp.send();\n");
      out.write("                xmlhttp.onreadystatechange=function()\n");
      out.write("                {\n");
      out.write("                    if(xmlhttp.readyState===4 && xmlhttp.status===200)\n");
      out.write("                    {\n");
      out.write("                        document.getElementById(\"ContactView\").innerHTML = xmlhttp.responseText;\n");
      out.write("                    }\n");
      out.write("                };\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </script>\n");
      out.write("       <style>\n");
      out.write("       #ContactView{\n");
      out.write("       position: absolute;\n");
      out.write("       /*background-color: white;*/\n");
      out.write("       top: 50px;\n");
      out.write("       left: 20px;\n");
      out.write("       height: 40cm;\n");
      out.write("       /*width: 35cm;*/\n");
      out.write("       z-index: 10;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("            .btn{\n");
      out.write("                background-color: midnightblue;\n");
      out.write("                text-align: center;\n");
      out.write("                color: lightblue;\n");
      out.write("                padding: 5px 5px;\n");
      out.write("                margin: 4px 2px;\n");
      out.write("                font-size: 16px;\n");
      out.write("                border-color: midnightblue;\n");
      out.write("                 /*background-color: #3498DB;*/\n");
      out.write(" \n");
      out.write("            }\n");
      out.write("            .btn:hover{\n");
      out.write("                background-color: lightslategrey;\n");
      out.write("            }\n");
      out.write("            #view{\n");
      out.write("                background-color: white;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("                                            <!--Search Files-->\n");
      out.write("        <div style=\"position: absolute; top: 10px; left: 300px\">\n");
      out.write("            <input id=\"fName\" class=\"in\" placeholder=\"Search by file name\" onkeyup=\"loadContactRecordByName();\"/>\n");
      out.write("            <div id=\"ContactView\"></div>\n");
      out.write("        </div>\n");
      out.write("<br/><br/><br/>\n");
      out.write(" \n");
      out.write("        <button id=\"delete-list\" class=\"btn\"> Multi Delete Files</button>\n");
      out.write("        <div id=\"view\"></div>\n");
      out.write("\n");
      out.write("        <table border=\"1\" width=\"75%\" cellpadding=\"5\" id='mytable'>\n");
      out.write("        <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><center><b>Select</b></center><td><center><b>Id</b></center></td>\n");
      out.write("                        <td><center><b>Filename</b></center></td><td><center><b>File Size</b></center></td>\n");
      out.write("                        <td><center><b>Date</b></center></td><td><center><b>Date</b></center></td>\n");
      out.write("                    </tr>\n");
      out.write("        </thead>  \n");
      out.write("                <tbody id=\"tbody\">\n");
      out.write("                    ");

                        try
                        {
//                                
                                Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
                                String sql = "SELECT * FROM trash ;";
                                Statement st = con.createStatement();
                                ResultSet rs=st.executeQuery(sql);
                                
                                if(!rs.isBeforeFirst())
                                {
                                    
      out.write("\n");
      out.write("                                        <tr>\n");
      out.write("                                        <td colspan=\"6\"><center>");
out.print("No Files!"); 
      out.write("</center></td>\n");
      out.write("                                        </tr>\n");
      out.write("                                    ");

                                }    
                                
                                while(rs.next())
                                {  
                                String fileId = rs.getString("id");
                
      out.write("\n");
      out.write("                            %>\n");
      out.write("                            <tr>\n");
      out.write("                                 <td><center><input type=\"checkbox\" value=\"");
      out.print(fileId);
      out.write("\" class=\"delete-checkbox\" name=\"chk\"/><img src=\"\" id=\"img\"></center></td>\n");
      out.write("                                <td><center>");
out.print(rs.getString("id")); 
      out.write("</center></td>\n");
      out.write("                                <td><center>");
out.print(rs.getString("image_name")); 
      out.write("</center></td>\n");
      out.write("\n");
      out.write("                                <td><center>");
out.print(rs.getString("size")); 
      out.write("</center></td>\n");
      out.write("                                <td><center>");
out.print(rs.getString("date_time")); 
      out.write("</center></td>\n");
      out.write("                                 <td style=\"background-color:white;\" >\n");
      out.write("                        <acronym title=\"Restore File\"><a href=\"Restore?id=");
out.print(rs.getString("id"));
      out.write("\"><img src=\"images/restore3.gif\"></a> </acronym>&nbsp;\n");
      out.write("                   \n");
      out.write("                        <acronym title=\"Delete File\"> <a href=\"final_delete?id=");
out.print(rs.getString("id"));
      out.write("\" \n");
      out.write("                                onclick=\"return confirm('Are you sure you want to delete file permanently?')\"><img src=\"images/delete.png\"></a></acronym>\n");
      out.write("                            </td>\n");
      out.write("                                        \n");
      out.write("                                       \n");
      out.write("                                    \n");
      out.write("                               \n");
      out.write("                           </tr>\n");
      out.write("                                  \n");
      out.write("                            ");


                                }

                            
      out.write("\n");
      out.write("                            \n");
      out.write("                </tbody> \n");
      out.write("        </table>\n");
      out.write("                 \n");
      out.write("                            ");

                                rs.close();
                                st.close();
                                con.close();
                        }catch(Exception e){e.printStackTrace();}    
                        
                    
      out.write(" \n");
      out.write("                     <script type=\"text/javascript\" src=\"mainPage.js\"></script> \n");
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
