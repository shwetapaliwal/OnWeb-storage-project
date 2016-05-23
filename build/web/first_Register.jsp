<%-- 
    Document   : register
    Created on : Jan 18, 2016, 7:57:38 PM
    Author     : shweta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="source.DBConnect"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>



<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="firstRegisterStyle.css">
        <title>Register yourself</title>
         
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script>
//                                              validations
            function chkSubmit(){

                event.preventDefault();
               var email =  chkEmail();
               var repeat = chkRepeat();
               if(email && repeat){
                   document.getElementById("myform").submit();
               }else{
                   alert("check pwd and email");
               }
           }
       
            function chkPassword()
            {
                var pass = document.getElementById("txt2").value;
                var show = document.getElementById("show");
                var arr = new Array();
               
                arr[0] = "weak";
               
                arr[1] = "medium";
                arr[2] = "Strong";
                arr[3] = "very strong";
                
                var score = 0;
                if(pass.length > 8)
                    score++;
                
                if((pass.match(/[a-z]/)) && (pass.match(/[A-Z]/)))
                    score++;
                
                if(pass.match(/\d+/))
                    score++;
                
                if(pass.match(/.[!,@,#,$,%,^,&,*,~,?,(,),_,-]/))
                    score++;
                
                if(pass.length > 12)
                    score++;
                
                show.innerHTML = arr[score];
                
            }
            function chkRepeat()
            {
                var pwd = document.getElementById("txt2").value;
                var cpwd = document.getElementById("txt3").value;
                var check = document.getElementById("check");
                if((pwd==cpwd)){
                    return true;
                }
                else{
                    check.innerHTML = "Password not match";
                    return false;
                }
                
            }
            
            function free(){
//                var check = document.getElementById("check");
                var show = document.getElementById("show");
                show.innerHTML = "";
//                check.innerHTML = "";
            }
            
            function chkEmail(){
                var msg = document.getElementById("msg");
                var email = document.getElementById("txt1").value;
                 var atpos = email.indexOf("@");
                 var dotpos = email.lastIndexOf(".");
                 if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) {
                    msg.innerHTML="Not a valid e-mail address";
                 return false;
                }
                else{
                    return true;
                }
            }
 
         
        </script>
       
        
    </head>
    <body>
      
       
        
        <!--Designing....-->
        <form action="registerdb.jsp" onsubmit="chkSubmit();" id="myform">
        <div>
        <center> 
        
        <h2>Create an Account</h2>
    
        <table class="table">
            <tr>
                <td><label id="label1">Name </label><br/>
                    <input type="text" name="fname" placeholder="Enter first name" id="txt" required>
                </td>

                <td><label id="label1">Email Id </label> <br/>
                    <input type="email" name="email" placeholder="Enter user name" id="txt1" required onblur="chkEmail();">
                    <span id="msg" style="color: red ; font-size: 20px;"/>
                </td>
            </tr>
            
            <tr></tr><tr></tr><tr></tr>
            
            <tr>
                
                <td>
                     
                    <label id="label1">Password </label><br/>
                    <input type="password" name="pwd" placeholder="*****" id="txt2" required 
                           onkeyup="chkPassword();" onmouseout="free();">
                    <span id="show" style="color:red; font-size: 20px;" />
                </td>
              
                <td><label id="label1">Re-enter Password</label><br/>
                    <input type="password" name="cpwd" placeholder="*****" id="txt3" required 
                           onblur="chkRepeat();">
                    <span id="check" style="color:red; font-size: 20px;" />
                </td>
                
            </tr>
            
            <tr></tr><tr></tr><tr></tr>
            
            <tr>
                <td><label id="label1">Password recovery questions</label><br/>
                    <select name='pQues' id="txt1">
                        <option>Select your Question</option>
                        <option value="nn">Your nick name</option>
                        <option value="fm">Favorite movie</option>
                        <option value="fs">Favorite sports</option>
                        <option value="fmn">Father's middle name</option>
                    </select>
                </td>
                
                <td><label id="label1">Your Answer </label><br/>
                    <input type="text" name='pans' id="txt1" required/>
                </td>
            </tr>
          </table>   
           
        <input type="submit" value="Register" id="button"/>
            
        </center>
    </div>
    </form>
    </body>
</html>
