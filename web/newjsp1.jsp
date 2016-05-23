<%-- 
    Document   : newjsp1
    Created on : Mar 17, 2016, 1:39:03 AM
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
response.sendRedirect("new_folder.jsp");
            %>
    </body>
</html>
