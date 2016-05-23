

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="source.DBConnect"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.StringWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             
    String[] myJsonData = request.getParameterValues("Id[]"); 
   for(String s: myJsonData)
   {
       out.print(s);
   }
//
//    String selected="";
//    StringBuffer sb = new StringBuffer(); 
//
//    for(int i = 0; i < select.length; i++) {
//        sb.append(select[i]);
//    }
//
//    String vwarnid = sb.toString(); 
//    vwarnid = vwarnid.substring(0, vwarnid.length()-1);
//    out.print(vwarnid);
//
//    try {
//       
//       Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
//            Statement st = con.createStatement();
//        PreparedStatement pst = con.prepareStatement
//            ("DELETE FROM images WHERE id = vwarnid;");
//        int i=pst.executeUpdate();
//        out.print(i);
//        out.println("deleted");
//    } catch(Exception e) {
//    }
%>

<!--//else{
// out.println("<h3>hiii</h3>");
//}-->
       
   </body>
</html>
