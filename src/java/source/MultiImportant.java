
package source;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MultiImportant extends HttpServlet {

    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/zip");
        PrintWriter out = response.getWriter();
         String[] values = request.getParameterValues("id[]");
//       String id = Arrays.toString(values).replace("[","").replace("]","");
       StringBuilder builder = new StringBuilder();
for (String value : values) {
    builder.append(value +"','");
    }
String id= builder.toString();

         out.print(id);

         try{
             Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
             Statement st = con.createStatement();
             String sqlString = "INSERT INTO starred select * from Files where id IN('"+id+"');"; 
               st.executeUpdate(sqlString);

               
         }
         catch(Exception e)
         {
             out.print(e.toString());
         }


            

        }   
}
    
