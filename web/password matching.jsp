<%-- 
    Document   : password matching
    Created on : Jan 28, 2016, 12:19:15 PM
    Author     : shweta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="source.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
            Statement st = con.createStatement();
            String ques = request.getParameter("pques");
            
            String ans = request.getParameter("pans");
            ResultSet rs = st.executeQuery("select * from register where pQues = '"+ques+"'");
            while(rs.next())
            {
                String q = rs.getString(6);
                String a = rs.getString(7);
                if((q.equals(ques))&& (a.equals(ans)))
                {
                    String password = rs.getString(5);
                    out.println("<h3>Your password is</h3>" +password);
                }
                else
                {
                  out.println("Sorry, could not find the data"+" please &nbsp<a href='forgot password.jsp'>Try again</a>");  
                }  
            }
           
        %>      
    </body>
</html>
