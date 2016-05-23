<%-- 
    Document   : SearchList
    Created on : Mar 4, 2016, 2:01:46 PM
    Author     : shweta
--%>

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
        <title>Search Files </title>
        <style>
            #btn{
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
                query = "Select * from images;";
            }
            else
            {
                query = "Select * from images where image_name like '"+finalString+"';";
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
                        <acronym title="View File"> <a href="viewfile.jsp?id=<%out.print(rs.getString("id"));%>"><img src="images/view.png"></a></acronym>&nbsp;
                        <acronym title="Download File"><a href="download.jsp?id=<%out.print(rs.getString("id"));%>"><img src="images/download.png"></a></acronym>&nbsp;
                        <acronym title="Delete File"><a href="delete?id=<%out.print(rs.getString("id"));%>"><img src="images/delete.png"></a></acronym>
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
