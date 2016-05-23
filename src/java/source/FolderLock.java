
package source;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author shweta
 */
public class FolderLock extends HttpServlet {

    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String fName = request.getParameter("folder");
                     HttpSession session=request.getSession();
                    session.setAttribute("UserName",fName);
//                    out.print(UserName);
    
                    try
                    {
                        Connection con = DriverManager.getConnection(DBConnect2.con,DBConnect2.user, DBConnect2.pass);
                        String sql = "create table "+fName+"(id int auto_increment primary key,image_name varchar(20),ext varchar(10),files longblob,size long,date_time timestamp default current_timestamp);";
                        PreparedStatement pst = con.prepareStatement(sql);
                        int r = pst.executeUpdate(sql);
//                        if(r>0)
//                        {
                            con.close();
                            RequestDispatcher rs = request.getRequestDispatcher("lockedFolders.jsp");
                        rs.include(request, response);
//                        }
                            
                    }
                    catch(Exception e){
                        out.print(e);
                    }
                    
                    }
                    

    

}
