<%-- 
    Document   : lockedFolders
    Created on : Apr 6, 2016, 3:17:27 AM
    Author     : shweta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="source.DBConnect2"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="mainPage_style.css">
        <script>
            $(document).ready(function(){
               $("#createfolder").click(function(){
                    
                    showFolder();
                });
            });
            function showFolder()
            {
                 $("#lockfolder").fadeIn();
                $("#lockfolder").css({"visibility":"visible","display":"block"});
            }
        </script>
        <style>
            .txt_style{
                color: white;
                font-size: 20px;
            }
            .input{
                height: 30px;
                width: 350px;
            }
             #image{
   background: lightslategray url('images/folder.png') no-repeat top left;
    border-color: lightslategray;
    padding-left: 46px;
    height: 40px;
    width: 150px;
    text-decoration: underline;
}
#image:hover{
    background-color: white;
}
#mytable{
       background-color: transparent;
       border: 5px solid white;
       border-bottom: 0;
       border-right: 0;
       border-left: 0;
       border-top: 0;
   }
   thead{
       font-size: 15px;
       color: lightblue;
       background-color: midnightblue;
   }
   tbody{
       color: white;
   }
            
        </style>
    </head>
    <body>
                                    <!--create folder-->
        <div id="lockfolder"><br/>
            <form action="FolderLock" target="maincontainer" id="form">
                <label class="txt_style">Enter Folder name :</label>
                <input type="text" name="folder" class="input" required/>
                <input type="submit" value="create" class="button">
            </form>
        </div>
                                   <!--display folder table-->
        <form action="newjsp2.jsp">
            <table border="1" width="75%" cellpadding="5" id="mytable">    
                <thead>
                <th>Folders</th>
                <th>Create Time</th>
<!--                <th>Update Time</th>-->
                </thead> 
                <%
                   
    
                    try
                    {
                        Connection con = DriverManager.getConnection(DBConnect2.con,DBConnect2.user, DBConnect2.pass);
                       
                         Statement st = con.createStatement();
                    String sql1 = "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_schema = 'lockedfolder' order by CREATE_TIME desc;";
                    ResultSet rs = st.executeQuery(sql1);
                    if(!rs.isBeforeFirst())
                        {
                %>
                        <tr>
                            <td colspan="6"><center><%out.print("No Files!"); %></center></td>
                        </tr>
                <%
                        }  
                    while(rs.next()){

                        %>
                
                        <tr>
                        <td><input type="submit" id="image" name="submit" value="<%out.print(rs.getString(3));%>"></td>
                        <td><%out.print(rs.getString("CREATE_TIME"));%></td>
<!--                        <td><out.print(rs.getString("UPDATE_TIME"));%></td>-->
                        </tr>
                     
                        <%
                            
                            }
con.close();
                    }
                    catch(Exception e){
                        out.print(e);
                    }
                  %>

                   
                    </table>
        </form>     
    </body>
</html>
