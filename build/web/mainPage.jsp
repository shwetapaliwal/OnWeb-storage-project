<%-- 
    Document   : Main_Page
    Created on : Feb 1, 2016, 11:08:54 AM
    Author     : shweta
--%>

<%@page import="source.DBConnect1"%>
<%@page import="source.DBConnect"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

     
    

    <!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="mainPage_style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
     <script type="text/javascript" src="jquery.js"></script>
     <script type="text/javascript" src="login_effect.js"></script>
        <script>
        $(document).ready(function() {
        $("#form").submit(function() {
        $("#folder").hide();
    });
    $("#passwordfolder").click(function(){
        showpassworddiv();
    });
    $("#btnfolder").click(function(){
        
        showlocked();
        
    });
    $("#passwordForm").submit(function() {
        $("#passwordDiv").hide();
    });
});
 function showpassworddiv()
 {
   $("#passwordDiv").fadeIn();
   $("#passwordDiv").css({"visibility":"visible","display":"block"});  
 }
 function showlocked()
 {
     
     $("#folderpass").fadeIn();
   $("#folderpass").css({"visibility":"visible","display":"block"});
   alert('hiii');
     
 }
 function validate(){
     document.getElementById("span").innerHTML = "space not allowed";
 }
        </script>
    </head>
    <body>
                                              <!--left div body-->
        <div id="leftdiv">
            <button id="btn1" class="button"><img src="images/uparrow.png">Upload file</button><br/>
             <button id='btn2' class="button"><img src="images/plus.jpg"> Create Folder</button><hr>
            
             <div class="menu">
                                                     <!--Logout-->
        <div style="background-color:cadetblue;position:absolute; right: 100px; top: 40px;" >
            <a href="Logout" class="out">Logout</a>
        </div>  
                 &nbsp;&nbsp;<img src="images/file.png">&nbsp;&nbsp;<a href="uploadFiles.jsp" target="maincontainer">Files</a><hr>
                 &nbsp;&nbsp;<img src="images/bluefolder.png">&nbsp;&nbsp;<a href="folderShow.jsp" target="maincontainer">Folders</a><hr>
                 &nbsp;&nbsp;<img src="images/lock.png">&nbsp;&nbsp;<a href="lockPassword.jsp" target="maincontainer">Crypto Folders</a><hr>
                 &nbsp;&nbsp;<img src="images/trash1.png">&nbsp;&nbsp;<a href="trash_files.jsp" target="maincontainer"> Trash Files</a><hr>
                 &nbsp;&nbsp;<img src="images/star.png">&nbsp;&nbsp;<a href="starred.jsp" target="maincontainer">Important</a><hr>
                 
             </div>
        </div>
       
                                              <!--upload file window div-->
         <div id="window">
             <form method="post" action="Upload_File" enctype="multipart/form-data">
                 
            <center>
                <table style="padding: 10px;" width="95%" cellpadding="8" >
                    <thead> 
                    <th colspan="6">Upload File</th>        
                    </thead>
                    <tbody>
                        <tr>    
                            <td>Title : </td>
                            <td><input type="text" name="title"  required=""></td>
                        </tr>
                        <tr>
                            <td>Choose File : </td>
                            <td><input type="file" name="file_uploaded"  required=""/></td>
                        </tr>
                        <tr>
                            <td colspan="3"><center>
                                <input type="submit" value="Upload" id="fileupload">
                            </center></td>
                        </tr>
                    </tbody></table></center>
            </form>
        </div>
<br><br>
                                    <!--create folder window div-->    
        <div id="folder"><br/>
            <form action="mainFolder.jsp" target="maincontainer" id="form">
                <center><lablel> Enter Folder name :</lablel>
                    <input type="text" name="folder" required onkeyup="validate();"/>
                    <span id="span" style="color: darkred;"></span><br/></center>
                    <center><input type="submit" value="create" style="height: 30px; 
                                                   width: 70px; background-color: black; border-color: black; color: white;"></center>
            </form>
        </div>

        
        <div id="folderpass" style="height: 140px;
       width: 400px;
       background-color: lightsalmon;
       position: absolute;
       top: 200px;
       left: 220px;
       display: none;   
       visibility: hidden;
       font-size: 15px;
       z-index: 2;
       padding: 5px 5px;"><br/>
            <!--<form action=""  >-->
                 Enter Folder name : <input type="text" name="flder2" required/>
                 <input type="submit" value="create">
            <!--</form>-->
        </div>

        <div class="maindiv">
            <iframe name="maincontainer" src="uploadFiles.jsp" 
            style="width: 100%;height: 900px; box-shadow: 2px 2px 2px gray;" 
            frameborder="0">       
        </iframe>
            </div> 
            
      
    </body>
    <script type="text/javascript" src="mainPage.js"></script> 
</html>
