<%-- 
    Document   : newjsp2
    Created on : Apr 6, 2016, 7:45:53 PM
    Author     : shweta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String gi =request.getParameter("submit");
out.print(gi);
session.setAttribute("user",gi);
response.sendRedirect("lock_files.jsp");
            %>
    </body>
</html>
