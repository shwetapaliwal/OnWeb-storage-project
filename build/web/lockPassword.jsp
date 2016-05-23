<%-- 
    Document   : lockPassword
    Created on : Apr 6, 2016, 2:54:53 AM
    Author     : shweta
--%>

<%@page import="source.DBConnect2"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="source.DBConnect1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="lockpassword_style.css">
    </head>
    <body>
        <div id="passwordDiv" >
            <center><h2>Unlock your folder</h2></center>
            <form action="lockedFolders.jsp" target="maincontainer" > 
                <label class="txt_style">Enter your password :</label>
             <input type="password" placeholder="****" name="pass" class="input"/><br/><br/>
            <%
                 Connection con = DriverManager.getConnection(DBConnect2.con,DBConnect2.user, DBConnect2.pass);
                    Statement st = con.createStatement();
//                    String eid = request.getParameter("email");
                    String pass = request.getParameter("pass");
            
                    ResultSet rs = st.executeQuery("select * from passwords;");
                    while(rs.next())
                    {
                        
                        String password = rs.getString("pwd");
                        if((password.equals(pass)))
                        {
                           
                            out.print("<script>alert('Your password is set');</script>");
                        }
                       
                    }
                %>
                
                     <center><input type="submit" value="Go" id="btn"></center><br/><br/>
                    <label class="txt_style">Have not create password?? &nbsp;<a href="createPassword.jsp" target="maincontainer">Create Here</a></label><br/>
                    
               </form>
        </div>
    </body>
</html>
