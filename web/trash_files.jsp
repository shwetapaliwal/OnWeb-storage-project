<%-- 
    Document   : trash_files
    Created on : Mar 10, 2016, 3:44:36 PM
    Author     : shweta
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="source.DBConnect"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainPage_style.css">
        <title>JSP Page</title>
        <script>
            function loadContactRecordByName()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                var fName = document.getElementById('fName').value.trim();
                xmlhttp.open("POST","SearchTrash.jsp?fName="+fName,true);
                xmlhttp.send();
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState===4 && xmlhttp.status===200)
                    {
                        document.getElementById("ContactView").innerHTML = xmlhttp.responseText;
                    }
                };
            }
           
        </script>
       <style>
       #ContactView{
       position: absolute;
       /*background-color: white;*/
       top: 50px;
       left: 20px;
       height: 40cm;
       /*width: 35cm;*/
       z-index: 10;
        }

            .btn{
                background-color: midnightblue;
                text-align: center;
                color: lightblue;
                padding: 5px 5px;
                margin: 4px 2px;
                font-size: 16px;
                border-color: midnightblue;
                 /*background-color: #3498DB;*/
 
            }
            .btn:hover{
                background-color: lightslategrey;
            }
           
            

        </style>
    </head>
    
    <body>
                                            <!--Search Files-->
        <div style="position: absolute; top: 10px; left: 300px">
            <input id="fName" class="in" placeholder="Search by file name" onkeyup="loadContactRecordByName();"/>
            <div id="ContactView"></div>
        </div>
<br/><br/><br/>
 
       

        <table border="1" width="75%" cellpadding="5" id='mytable'>
        <thead>
                    <tr>
                        
                        <td><center><b>Filename</b></center></td><td><center><b>File Size</b></center></td>
                        <td><center><b>Date</b></center></td><td><center><b>File</b></center></td>
                    </tr>
        </thead>  
                <tbody id="tbody">
                    <%
                        try
                        {
//                                
                                Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
                                String sql = "SELECT * FROM trash ;";
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

                                <td><center><%out.print(rs.getString("size")); %></center></td>
                                <td><center><%out.print(rs.getString("date_time")); %></center></td>
                                 <td style="background-color:white;" >
                        <acronym title="Restore File"><a href="Restore?id=<%out.print(rs.getString("id"));%>"><img src="images/restore3.gif"></a> </acronym>&nbsp;
                   
                        <acronym title="Delete File"> <a href="final_delete?id=<%out.print(rs.getString("id"));%>" 
                                onclick="return confirm('Are you sure you want to delete file permanently?')"><img src="images/delete.png"></a></acronym>
                            </td>
                                        
                                       
                                    
                               
                           </tr>
                                  
                            <%

                                }

                            %>
                            
                </tbody> 
        </table>
                 
                            <%
                                rs.close();
                                st.close();
                                con.close();
                        }catch(Exception e){e.printStackTrace();}    
                        
                    %> 
                     <script type="text/javascript" src="mainPage.js"></script> 
    </body>
</html>
