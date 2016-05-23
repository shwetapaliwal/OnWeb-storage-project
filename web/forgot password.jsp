<%-- 
    Document   : forgot password
    Created on : Jan 28, 2016, 11:49:25 AM
    Author     : shweta
--%>

<%@page import="source.DBConnect"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            background-color: black;
        }
        #heading{
            font-size: 20px;
            color: white;
        }
        #table{
            border-color: white;
            border-width: 20px;
            border-style: double;
            position: absolute;
            top: 150px;
            left: 350px;
            padding: 100px;
            
        }
        #go{
            height: 30px;
            width: 160px;
            font-size: 20px;
            background-color: chartreuse;
        }
        p{
            font-size: 30px;
            color: lightseagreen;
            
        }
        a{
            color: lightseagreen;
            font-size: 20px;
        }
        a:hover{
            color: white;
        }
    </style>
    <body>
        <form action="forgot password.jsp">
      
    <center>
        <a href="first.jsp">Go Back to Login</a>
        <table  id="table">
            <tr>
                <td id="heading">Enter your Email id<br/>
                <input type="email" name="email" placeholder="Enter user name"</td>
            </tr>
            <tr>
                <td id="heading">Select your password Recovery Question?<br/>
                    <select name='pques'>
                        <option>Select your Question</option>
                        <option value="nn">Your nick name</option>
                        <option value="fm">Favorite movie</option>
                        <option value="fs">Favorite sports</option>
                        <option value="fmn">Father's middle name</option>
                    </select></td>
            </tr>
            <tr></tr><tr></tr><tr></tr><tr></tr>
            <tr>
                    <td id="heading">Your Answer <br/><input type="text" name='pans'/></td>
            </tr>
            <tr></tr><tr></tr><tr></tr><tr></tr>
            <tr><td><input type="submit" value="GO" id="go"/></td></tr>
        
             <% 
            Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
            Statement st = con.createStatement();
            String ques = request.getParameter("pques");
            String eid = request.getParameter("email");
            String ans = request.getParameter("pans");
            ResultSet rs = st.executeQuery("select * from register where pQues = '"+ques+"'");
            while(rs.next())
            {
                String id = rs.getString(2);
                String q = rs.getString(4);
                String a = rs.getString(5);
                if((id.equals(eid))&& (q.equals(ques)) && (a.equals(ans)))
                {
                    String password = rs.getString(3);
             %>
             <tr></tr>
            <tr>
                <td><p>Your password is : <%=password%></p></td>
            </tr>
        </table>
        </center>
    </form>
            <br/>
            <%
                }
//                else
//                {
//               out.println("<h3>Sorry, could not find the data"+"please &nbsp<a href='forgot password.jsp'>Try again</a><h3>");
//                }
           }
            %>    
                
                    
    </body>
</html>
