<%-- 
    Document   : index
    Created on : Jan 25, 2016, 10:12:54 AM
    Author     : shweta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="source.DBConnect"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
   
    <head>
         <link rel="stylesheet" type="text/css" href="first_LoginStyle.css">
     <script type="text/javascript" src="jquery.js"></script>
     <script type="text/javascript" src="login_effect.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <title>Login Page</title>
        <script>
            $(document).ready(function(){
            
            $("#login_btn").click(function(){
            showpopup();
            });
        });

            function showpopup()
            {
                $("#loginform").fadeIn();
                $("#loginform").css({"visibility":"visible","display":"block"});
            }
        </script> 
    </head>
    
    <body>
                                                 <!-- top heading-->
        <div class="div1">
            <h1>OnWeb Storage</h1>
             <button id="login_btn">Log In</button>  
            <hr/>
        </div>
            <br/><br/>
                                                <!--center headings-->
        <div class="div2">
            <h2 style="font-size:50px; color: white;">Your personal and private Storage Space</h2>
            <h3 style="color: white;">Get to your files from anywhere, 
                on any device, with OnWeb Storage.<br/> 
                Share and work together with anyone in your work and life.</h3><br/>
                                
                                                <!--Sign Up button-->
                <input type=submit 
                   onClick=window.open('first_Register.jsp','Ratting',"width=1070,height=970,left=50,top=100,toolbar=0,status=0,"); 
                   name="signup" value="Sign Up Now" id="sign"/>
        </div>
            
                                                   <!--log in window-->
        
        <div id = "loginform">
            <form action="" name="loggedform">
            <a href="first.jsp"><input type="image" class="close" src="images/close.png"></a>
            <center>
                <h2 style="color: black;">Log In to your account..</h2>
                <table cellspacing="2" class="table">
                    <tr>
                        <td><input type="email" name="email" placeholder="Enter Email Id" id="uid" /></td>
                    </tr>
            
                    <tr>
                        <td><input type="password" name="pwd" placeholder="*****" id="uid"/></td>
                    </tr>
                </table>
               
                 <%   
                    Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
                    Statement st = con.createStatement();
                    String eid = request.getParameter("email");
                    String pass = request.getParameter("pwd");
            
                    ResultSet rs = st.executeQuery("select * from register where uname = '"+eid+"'");
                    while(rs.next())
                    {
                        String id = rs.getString(2);
                        String p = rs.getString(3);
                        if((id.equals(eid))&& (p.equals(pass)))
                        {
                            response.sendRedirect("mainPage.jsp");
                        }
                        else{
                            out.print("<script>alert('The Email address or/and password you specified is not correct');window.location('first.jsp');</script>");               
                        }
                    }
                %>
                
                <div>
                    <input type="submit" value="Log In" id="login"/>
                    <label>Need an Account?? &nbsp;<a href="first_Register.jsp">Sign Up</a></label>
                    <a href="forgot password.jsp" class="fpassword"> Forgot your Password?</a>
                </div>
            </center>
            </form>
        </div>
      
    </body>
</html>
