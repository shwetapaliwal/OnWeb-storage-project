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
    background: white url('images/folder.png') no-repeat top left;
    padding-left: 46px;
    height: 40px;
    width: 150px;
}
        </style>
       
    </head>
    <body><form action="newjsp1.jsp">
            <table>    
                <thead>
                <th>Folders</th>
                </thead>
                <%
                    try
                    {
                        Connection con = DriverManager.getConnection(DBConnect1.con,DBConnect1.user, DBConnect1.pass);
                    Statement st = con.createStatement();
                    String sql1 = "show tables from webfolders;";
                    ResultSet rs = st.executeQuery(sql1);
                    while(rs.next()){

                        %>
                        
                        <tr>
                            <td><input type="submit" id="image" name="submit" value="<%out.print(rs.getString(1));%>"></td>
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

