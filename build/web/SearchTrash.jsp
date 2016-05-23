<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="source.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
   Connection con = null;
   Statement st = null;
   ResultSet rs = null;

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Customer Process </title>
        <style>
            #btn{
                background-color: white;
                width: 2cm;
                height: 1cm;
            }
            #btn1{
                background-color: white;
                width: 2cm;
                height: 1cm;
            }
        </style>

    </head>
    <body>
    <% 
        Blob file1 = null;
            byte[ ] fileData = null ;
       try
        {
            String fName = request.getParameter("fName");
            con = DriverManager.getConnection( DBConnect.con, 
                    DBConnect.user, DBConnect.pass);
            st = con.createStatement();
            String query = null, finalString = "%"+fName+"%";

            if(fName == null )
            {
                query = "Select * from trash;";
            }
            else
            {
                query = "Select * from trash where image_name like '"+finalString+"';";
            }
            rs = st.executeQuery(query);
            out.print("<table border='1' bgcolor='white' style='width:15cm;' >");
            out.print("<tr style='background-color:white; color:black;'>");
            out.print("<th>File name</th><th>File</th>");
            out.print("</tr>");
           
            while(rs.next())
            {
                out.print("<tr style=color:black;>");
               
                out.print("<td>"+rs.getString(2)+"</td>");

               %>
               <td style="background-color:white;" >
                        <acronym title="Restore File"><a href="Restore?id=<%out.print(rs.getString("id"));%>"><img src="images/restore3.gif"></a> </acronym>&nbsp;
                   
                        <acronym title="Delete File"> <a href="final_delete?id=<%out.print(rs.getString("id"));%>" 
                                onclick="return confirm('Are you sure you want to delete file permanently?')"><img src="images/delete.png"></a></acronym>
                            </td>
                <%
                out.print("</tr>");
            }
            con.close();
            out.print("</table>");
        }
        catch(Exception ex)
        {
            out.println( ex.toString() );
        }    
   %>
    </body>
</html>

