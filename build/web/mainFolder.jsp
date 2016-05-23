<%-- 
    Document   : mainFolder
    Created on : Mar 13, 2016, 4:52:59 PM
    Author     : shweta
--%>

<%@page import="source.DBConnect1"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <title>JSP Page</title>
        <style>
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
                                        <!--display folders-->
        <form action="newjsp1.jsp">
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
                        String sql = "create table "+fName+"(id int auto_increment primary key,image_name varchar(20),ext varchar(10),files longblob,size long,date_time timestamp default current_timestamp);";
                        PreparedStatement pst = con.prepareStatement(sql);
                        pst.executeUpdate(sql);
                         Statement st = con.createStatement();
                    String sql1 = "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_schema = 'webfolders' order by CREATE_TIME desc;";
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
