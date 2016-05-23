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
        <title>create password</title>
         <link rel="stylesheet" type="text/css" href="lockpassword_style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script>

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
//           this.submit(); 
         
        </script>
       
        
    </head>
    <body>
       <div  id="div">
       
        
        <!--Designing....-->
        <form action="passworddb.jsp" onsubmit="chkSubmit();" id="myform">
           
    
        
            <center><h2>Create your password</h2></center>
    
        <table class="table">
            <tr>
                <td><label id="label1">Name </label><br/>
                    <input type="text" name="fname" placeholder="Enter first name" id="txt" class="txt_style" required/>
                </td>
            </tr>
            <tr></tr><tr></tr><tr></tr>    
            <tr>
                
                <td>
                     
                    <label id="label1">Password </label><br/>
                    <input type="password" name="pwd" placeholder="*****" id="txt2" class="txt_style" required="" 
                           onkeyup="chkPassword();" onmouseout="free();"/>
                    <span id="show" style="color:red; font-size: 20px;" />
                </td>
              <tr></tr><tr></tr><tr></tr>
                <td><label id="label1">Re-enter Password</label><br/>
                    <input type="password" name="cpwd" placeholder="*****" id="txt3" class="txt_style" required="" 
                           onblur="chkRepeat();"/>
                    <span id="check" style="color:red; font-size: 20px;" />
                </td>
                <!--<td><label id="lbl1">hello</label></td>-->
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
                    <input type="text" name='pans' id="txt1" required=""/>
                </td>
            </tr>
            
            
            
            
          </table>   
           
        <input type="submit" value="SET" id="button"/>
        <button><a href="lockPassword.jsp" id="back">BACK</a></button>
        
        
    
    </form>
        </div>
    </body>
</html>
