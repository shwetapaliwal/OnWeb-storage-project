<%@page import="source.DBConnect2"%>
<%@page import="source.DBConnect1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="source.DBConnect"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locked Files</title>
        <link rel="stylesheet" type="text/css" href="mainPage_style.css">
        <script type="text/javascript" src="jquery.js"></script>
     <script type="text/javascript" src="login_effect.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
     <script type="text/javascript" src="jquery-latest.js"></script> 
         <style>
                
    #btn{
       height: 40px;
       width: 230px;
       background-color: midnightblue;
       color: lightblue;
       font-size: 20px;
       border-color: midnightblue;
        border-radius: 10px 10px 10px 10px;
        
        margin: 4px;
   }
   #btn:hover{
       background-color: lightslategrey;
   }
        </style>
        <script>
           $(document).ready(function(){
               
               $("#btn").click(function(){
                   windowshow();
               });
           });
           function windowshow()
           {
               $("#window").fadeIn();
                $("#window").css({"visibility":"visible","display":"block"});
           }
           
        </script>
    </head>
    <body>
                                    <!--upload file button-->
         <% 
            String name = (String)session.getAttribute("user");
//            out.print(name);
            %> 
         
            <button id="btn">Click here to Upload <img src="images/arrow1.png"></button><br/><br/><br/>
             
                                    
            <div id="window">
             <form method="post" action="Lock_Folder" enctype="multipart/form-data">
                 
            <center>
                <table  cellpadding ="8" id="mytable">
                    <thead> 
                    <th colspan="6">Upload File</th>        
                    </thead>
                    <tbody>
                        <tr>    
                            <td >Title : </td>
                            <td><input type="text" name="title"  required=""></td>
                        </tr>
                        <tr>
                            <td>Choose File : </td>
                            <td><input type="file" name="file_uploaded"  required=""/></td>
                        </tr>
                       
                        <tr>
                            <td colspan="3"><center><input type="submit" value="Upload" id="upload"></center></td>
                        </tr>
                    </tbody></table></center>
             </form>
        </div>
                                            <!--display files table-->
           <div>
            <table  width="75%" cellpadding="5" id="mytable" border="1">
            <thead>
            <tr>
                
                <th onclick="sort_table(tbody, 1, asc1); asc1 *= -1; asc2 = 1; asc3 = 1;"><center>
                <img src="images/arrow1.png">&nbsp;<b>File name</b></center></th>
                <th><center><b>File type</b></center></th><th><center><b>Size</b></center></th>
                <th><center><b>Date and time of creating file</b></center></th><th><center><b>File</b></center></th>
                
                    </tr>
            </thead>
            <tbody id="tbody">
                <%
                    
                    try
                    {
                        Connection con = DriverManager.getConnection(DBConnect2.con,DBConnect2.user, DBConnect2.pass);
                        String sql = "SELECT * FROM "+name+";";
                        Statement st = con.createStatement();
                        ResultSet rs=st.executeQuery(sql);
                                
                        if(!rs.isBeforeFirst())
                        {
                %>
                        <tr>
                            <td colspan="6"><center><%out.print("No Files!"); %></center></td>
                        </tr>
                <%
                        }    
                        while(rs.next())
                        {  
                %>
                        <tr>
                            
                            <td><center><%out.print(rs.getString("image_name")); %></center></td>
                            
                            <%
                                String ext = rs.getString("ext");
                                if(ext.equals("jpg")||ext.equals("jpeg")||ext.equals("png")||ext.equals("bmp")||ext.equals("gif"))
                                {
                                    out.print("<td><center>Image File</center></td>");    
                                }
                                else if(ext.equals("pdf")){
                                    out.print("<td><center>PDF File</center></td>"); 
                                }
                                else if(ext.equals("doc")||ext.equals("docx")){
                                    out.print("<td><center>Document File</center></td>"); 
                                }
                                else if(ext.equals("txt")){
                                    out.print("<td><center>Text File</center></td>"); 
                                }
                                else if(ext.equals("mp3")){
                                    out.print("<td><center>Music File</center></td>"); 
                                }
                                else if(ext.equals("mp4")||ext.equals("jpm")||ext.equals("jpgv")){
                                    out.print("<td><center>Video File</center></td>"); 
                                }
                                else if(ext.equals("xls")||ext.equals("xlsx")){
                                    out.print("<td><center>ms-excel File</center></td>"); 
                                }
                                else{
                                    out.print("<td><center>----</center></td>");
                                }
                            %>
                            <td><center><%out.print(rs.getString("size")); %>KB</center></td>
                            <td><center><%out.print(rs.getString("date_time")); %></center></td>
            <td style="background-color:white;" >
                        <acronym title="View File"> <a href="lock_viewfile.jsp?id=<%out.print(rs.getString("id"));%>"><img src="images/view.png"></a></acronym>&nbsp;
                        <acronym title="Download File"><a href="lockFolder_download.jsp?id=<%out.print(rs.getString("id"));%>"><img src="images/download.png"></a></acronym>&nbsp;
                        <acronym title="Delete File"><a href="locked_delete?id=<%out.print(rs.getString("id"));%>"><img src="images/delete.png"></a></acronym>
                            </td>
                            
                        </tr>
                <%
                        }
                %>
            </tbody></table>
            
                <%
                    
                        rs.close();
                        st.close();
                        con.close();
                        }catch(Exception e){e.printStackTrace();}    
                %>          
        </div>        
         
         
        
    </body>
</html>

