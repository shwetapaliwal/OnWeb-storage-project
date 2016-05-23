
package source;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Ajax_servlet extends HttpServlet {

    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
         response.setContentType("application/x-www-form-urlencoded");
        response.setCharacterEncoding("utf-8");
        
        
   
        String[] values = request.getParameterValues("id[]");

       StringBuilder builder = new StringBuilder();
for (String value : values) {
    builder.append(value +"','");
    }
String id= builder.toString();

         out.print(id);

         try{
             Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
             Statement st = con.createStatement();
             String sqlString = "INSERT INTO trash select * from Files where id IN('"+id+"');"; 
               st.executeUpdate(sqlString);
             Statement st1 = con.createStatement();
               String sql = "delete from Files where id IN('"+id+"');";  
               int i = st1.executeUpdate(sql);
               if(i==0){
                   out.print("delete success");
               }
//               
//               response.sendRedirect("Main_Page.jsp");
               
         }
         catch(Exception e)
         {
             out.print(e.toString());
         }
//          out.println("</body>");
//            out.println("</html>");
//            response.getWriter().print("delete successfully");
        }

    

}
