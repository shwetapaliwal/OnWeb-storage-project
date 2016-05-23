<%-- 
    Document   : starred
    Created on : Mar 28, 2016, 10:55:58 AM
    Author     : shweta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        <style>
            
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
        
        </style>
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
                xmlhttp.open("POST","SearchStarred.jsp?fName="+fName,true);
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
    </head>
    <body>
                                    <!--Search Files-->
        <div style="position: absolute; top: 10px; left: 300px">
            <input id="fName" class="in" placeholder="Search by file name" onkeyup="loadContactRecordByName();"/>
            <div id="ContactView"></div>
        </div>
<br/><br/><br/>

       
        <table border="1" width="75%" cellpadding="5" id="mytable">
            
                <thead>
                    <tr>
                        
                        <th onclick="sort_table(tbody, 1, asc1); asc1 *= -1; asc2 = 1; asc3 = 1;"><center>
                        <acronym title="click to sort"><img src="images/arrow1.png"></acronym>&nbsp;<b>File name</b></center></th>
                        <th><center><b>File type</b></center></th><th><center><b>File Size</b></center></th>
                        <th><center><b>Date and time of creating file</b></center></th><th><center><b>File</b></center></th>
                    </tr>
                </thead><tbody>   
                    <%
                        try
                        {
//                               
                                Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
                                String sql = "SELECT * FROM starred ;";
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
                                
                                <td><center><%out.print(rs.getString("ext")); %></center></td>
                                <td><center><%out.print(rs.getString("size")); %>MB</center></td>
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
                            
                </tbody> 
        </table>
                 
                            <%
                                rs.close();
                                st.close();
                                con.close();
                        }catch(Exception e){e.printStackTrace();}    
                        
                    %> 
                    
                   
    </body>
</html>
