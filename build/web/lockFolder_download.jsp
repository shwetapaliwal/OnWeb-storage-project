<%@page import="source.DBConnect2"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="source.DBConnect"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% 
             String id=(request.getParameter("id"));
//            String ft = request.getParameter("filetype");
            String name = (String)session.getAttribute("user");
            Blob file1 = null;
            byte[ ] fileData = null ;
          
String ft;
            try
            {    
               Connection con = DriverManager.getConnection(DBConnect2.con,DBConnect2.user, DBConnect2.pass);
            Statement st = con.createStatement();
            
                String sqlString = "SELECT * FROM "+name+" WHERE id = "+id+";";
//                Statement myStatement = conn.createStatement();
                
                ResultSet rs=st.executeQuery(sqlString);
                
                if (rs.next())
                {
                    file1 = rs.getBlob("files");
                    String filename = rs.getString("image_name");
                    ft = rs.getString("ext");
                    fileData = file1.getBytes(1,(int)file1.length());
                    
                } else 
                {
                    out.println("file not found!");
                    return;
                }
                
                if (ft.trim().equalsIgnoreCase("jpg"))
                {
                    response.setContentType("image/jpg");
                }
                else if (ft.trim().equalsIgnoreCase("png"))
                {
                    response.setContentType("image/png");
                }
                else if (ft.trim().equalsIgnoreCase("gif"))
                {
                    response.setContentType("image/gif");
                }
                else if (ft.trim().equalsIgnoreCase("bmp"))
                {
                    response.setContentType("image/bmp");
                }
                else if (ft.trim().equalsIgnoreCase("c"))
                {
                    response.setContentType("text/x-c");
                }
                 else if (ft.trim().equalsIgnoreCase("css"))
                {
                    response.setContentType("text/css");
                }
                  else if (ft.trim().equalsIgnoreCase("class"))
                {
                    response.setContentType("application/java-vm");
                }
                   else if (ft.trim().equalsIgnoreCase("java"))
                {
                    response.setContentType("text/x-java-source,java");
                }
                 else if (ft.trim().equalsIgnoreCase("js"))
                {
                    response.setContentType("application/javascript");
                }  
                 else if (ft.trim().equalsIgnoreCase("jpm"))
                {
                    response.setContentType("video/jpm");
                } 
                 else if (ft.trim().equalsIgnoreCase("jpgv"))
                {
                    response.setContentType("video/jpeg");
                } 
                 else if (ft.trim().equalsIgnoreCase("mp4"))
                {
                    response.setContentType("video/mp4");
                } 
//                  else if (ft.trim().equalsIgnoreCase("aac"))
//                {
//                    response.setContentType("audio/aac");
//                } 
                else if(ft.trim().equalsIgnoreCase("pdf"))
                {
                    response.setContentType("application/pdf");
                }
                else if(ft.trim().equalsIgnoreCase("txt"))
                {
                    response.setContentType("application/octet-stream");
                }
                else if(ft.trim().equalsIgnoreCase("doc")|| ft.trim().equalsIgnoreCase("docx"))
                {
                    response.setContentType("application/msword");
                }
                else if(ft.trim().equalsIgnoreCase("xls")|| ft.trim().equalsIgnoreCase("xlsx"))
                {
                    response.setContentType("application/vnd.ms-excel");
                }
                response.setHeader("Content-Disposition", "attachment; filename=\"" + rs.getString("image_name") + "\"");
                response.setContentLength(fileData.length);
                
                OutputStream output = response.getOutputStream();
                output.write(fileData);
                
                output.flush();
                } catch (Exception ex) {out.print(ex.toString());} 
        %>
    </body>
</html>

