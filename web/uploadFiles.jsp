<%-- 
    Document   : uploadFiles
    Created on : Mar 26, 2016, 4:17:46 PM
    Author     : shweta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="source.DBConnect"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<script type="text/javascript" src="jquery.js"></script>
     <script type="text/javascript" src="login_effect.js"></script>
     
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="mainPage_style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <style>
            /*delete multiple file button*/
            .btn{
        background-color: midnightblue;
        text-align: center;
        color: lightblue;
        padding: 5px 5px;
        margin: 4px 2px;
        font-size: 16px;
        border-color: midnightblue;       
        }
    .btn:hover{
         background-color: lightslategrey;
        }
            #view{
                background-color: lightslategray;
                color: white;
                font-size: 20px;
                position: absolute;
                top: 70px;
                left: 340px;
                width: 230px;
                height: 30px;
            }
           
           
        </style>
        
       
   </head>
    <body>
          
                                            
                                            <!--Search file-->
        <div style="position: absolute; top: 10px; left: 300px">
            <input id="fName" class="in" placeholder="Search by file name" onkeyup="loadContactRecordByName();"/>
            <div id="ContactView"></div>
        </div>
<br/><br/><br/>
                                            <!--Display Table-->
        <button id="delete-list" class="btn">Delete Files</button>
        <button id="starred" class="btn">Important Files</button>
            <div id="view"></div>
           
            
                
            <table border="1" width="75%" cellpadding="5" id="mytable">
            <thead>
            <tr>
                <th>Select</th>
            
                <th onclick="sort_table(tbody, 1, asc1); asc1 *= -1; asc2 = 1; asc3 = 1;"><center>
                <acronym title="click to sort"><img src="images/arrow1.png"></acronym>&nbsp;<b>File name</b></center></th>
                <th><center><b>File type</b></center></th><th><center><b>Size</b></center></th>
                <th><center><b>Date and time of creating file</b></center></th><th><center><b>File</b></center></th>
                <!--<th><center><b></b></center></th>-->
                    </tr>
            </thead>
            <tbody id="tbody">
                <%
                    try
                    {
                        Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
                        String sql = "SELECT * FROM Files";
                        Statement st = con.createStatement();
                        ResultSet rs=st.executeQuery(sql);
//                         StringBuilder id = new StringBuilder();       
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
                            String fileId = rs.getString("id");
                %>
                <tr class="bottom row">
                            
                    <td><center><input type="checkbox" value="<%=fileId%>" class="delete-checkbox" name="chk"/><img src="" id="img"></center></td>
                    
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
                        <acronym title="View File"> <a href="viewfile.jsp?id=<%out.print(rs.getString("id"));%>"><img src="images/view.png"></a></acronym>&nbsp;
                        <acronym title="Download File"><a href="download.jsp?id=<%out.print(rs.getString("id"));%>"><img src="images/download.png"></a></acronym>&nbsp;
                        <acronym title="Delete File"><a href="delete?id=<%out.print(rs.getString("id"));%>"><img src="images/delete.png"></a></acronym>
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
            
             <script type="text/javascript" src="mainPage.js"></script> 
    </body>
</html>
