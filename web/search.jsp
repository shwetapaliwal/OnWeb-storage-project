<%-- 
    Document   : search
    Created on : Mar 4, 2016, 1:59:04 PM
    Author     : shweta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            table
            {
                width: 90%;
                border-collapse: collapse;
                margin: 20px;
                box-shadow: 5px 5px 5px darkgrey;
            }
            td, th
            {
                padding: 20px;
            }
            .in
            {
                width: 300px;
                height: 30px;
            }
            .btn
            {
                margin: 5px;
                width: 80px;
                height: 30px;
            }
        </style>
        <script type="text/javascript">
            function loadContantRecord()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                
                xmlhttp.open("POST","SearchContactProcess1.jsp",true);
                xmlhttp.send();
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState===4 && xmlhttp.status===200)
                    {
                        document.getElementById("ContactView").innerHTML = xmlhttp.responseText;
                    }
                };
            }
            
            function loadContactRecordByName()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                var fName = document.getElementById('fName').value.trim();
                xmlhttp.open("POST","SearchList.jsp?fName="+fName,true);
                xmlhttp.send();
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState===4 && xmlhttp.status===200)
                    {
                        document.getElementById("ContactView").innerHTML = xmlhttp.responseText;
                    }
                };
            }
            
            function validateForm()
            {
                if(document.getElementById('idEList').value === "select")
                {
                       document.getElementById("rsd1").innerHTML="";
                       alert("Please select an employee");     
                       return;
                }
                else
                {
                    loadXMLDoc();  
                }
            }
            
            function loadXMLDoc()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState===4 && xmlhttp.status===200)
                    {
                        document.getElementById("rsd1").innerHTML = xmlhttp.responseText;
                    }
                }
                xmlhttp.open("POST","SearchContactProcess1.jsp?eCode="+document.getElementById('idEList').value,true);
                xmlhttp.send();
            }
        </script>
    </head>
    <body onload="loadContantRecord();">
    <center>
        <h3> Contact Searching </h3>
        <table border="1">
            <tr>
                <td>
                    <label> Search File By Name </label>
                </td>
            </tr>
            <tr>
                <td>
                    <input id="fName" class="in" placeholder="File Name" 
                           onkeyup="loadContactRecordByName();"/>
                </td>
            </tr>
        </table>
        <div id="ContactView">
            
        </div>
    </center>
    </body>
    </html>
