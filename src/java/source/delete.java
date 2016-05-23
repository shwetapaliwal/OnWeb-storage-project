package source;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class delete extends HttpServlet {

    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet delete1</title>");            
            out.println("</head>");
            out.println("<body>");
             String id=(request.getParameter("id"));
            int v = Integer.parseInt(id);
            try{
               Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
               Statement st = con.createStatement();
               String sqlString = "INSERT INTO trash select * from Files where id = '"+id+"';"; 
               st.executeUpdate(sqlString);
               Statement st1 = con.createStatement();
               String sql = "delete from Files where id = '"+id+"';"; 
               st1.executeUpdate(sql);
               response.sendRedirect("uploadFiles.jsp");
            out.println("</body>");
            out.println("</html>");
        } catch(Exception e) {
            out.print(e.toString());
            out.close();
        }
            
    }

    

}
