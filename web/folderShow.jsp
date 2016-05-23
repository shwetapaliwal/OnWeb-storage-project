<%-- 
    Document   : folderMain
    Created on : Apr 10, 2016, 2:59:11 AM
    Author     : shweta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="source.DBConnect1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <body><form action="newjsp1.jsp">
            <table border="1" width="75%" cellpadding="5" id="mytable">    
                <thead>
                <th>Folders</th>
                <th>Create Time</th>
                
                </thead> 
                <%
                    String fName = request.getParameter("folder");
                     
                    session.setAttribute("UserName",fName);
//                    out.print(UserName);
    
                    try
                    {
                        Connection con = DriverManager.getConnection(DBConnect1.con,DBConnect1.user, DBConnect1.pass);
                       
                         Statement st = con.createStatement();
                    String sql1 = "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_schema = 'webfolders' order by CREATE_TIME desc;";
                    ResultSet rs = st.executeQuery(sql1);
                    while(rs.next()){

                        %>
                
                        <tr>
                        <td><input type="submit" id="image" name="submit" value="<%out.print(rs.getString(3));%>"></td>
                        <td><%out.print(rs.getString("CREATE_TIME"));%></td>
                        
                                                
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
