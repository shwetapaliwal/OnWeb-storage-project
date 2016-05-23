
package source;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold=1024*1024*2,
        maxFileSize=1024*1024*10,
        maxRequestSize=1024*1024*50)

public class Lock_Folder extends HttpServlet {
    private static final String SAVE_DIR="images";
   
   private String extractFileName(Part filePart) {
        String contentDisp = filePart.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) 
            {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }

    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        InputStream inputStream = null;
         HttpSession session = request.getSession();
   String name = (String)session.getAttribute("user");
        out.print(name);
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet main_folder</title>");            
            out.println("</head>");
            out.println("<body>");
            String savepath = "C:"+File.separator+SAVE_DIR;
        File savedir = new File(savepath);
        if(!savedir.exists())
        {
            savedir.mkdir();
        }
            String title=(request.getParameter("title"));
                Part filePart = request.getPart("file_uploaded");
                 
                if (filePart != null) 
                {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());
                    inputStream = filePart.getInputStream();
                }
                
                long size = filePart.getSize();
                
                long sizeinkb = size/1024;
                long sizeinmb = sizeinkb/1024;
                
                 String filename = extractFileName(filePart);
                 
//                filePart.write(savepath+File.separator+filename);
                 try 
                {
                    Connection con = DriverManager.getConnection(DBConnect2.con,DBConnect2.user, DBConnect2.pass);
                    Statement st = con.createStatement();
                    String query="INSERT INTO "+name+" (image_name,ext,files,size) values (?,?,?,?)";
//                    String sql = "INSERT INTO files (id, title, files) values (?, ?, ?)";

                    PreparedStatement pst = con.prepareStatement(query);
//                    pst.setString(1, idTemp);
                    pst.setString(1, title);
//                    String filePath= savepath + File.separator + filename ;
//                pst.setString(2,filePath);
                int i = filename.lastIndexOf('.');
                    if (i > 0) 
                    {
                        String Extension = filename.substring(i+1);
                        pst.setString(2, Extension);
                    }
             
                    if (inputStream != null) 
                    {
                        pst.setBinaryStream(3, inputStream, (int) filePart.getSize());
                    }
                    pst.setLong(4, sizeinkb);
                    int row = pst.executeUpdate();
//                    out.print("<script>alert('hello');</script>");
                    if (row > 0) 
                    {
                        System.out.println("File uploaded!!!");
                        
                        con.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("lock_files.jsp");
                        rs.include(request, response);
                    }
                    else
                    {
                        System.out.println("Couldn't upload your file!!!");
                        
                        con.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("lock_files.jsp");
                        rs.include(request, response);
                    }    

                }catch(Exception e){e.printStackTrace();} 
            out.println("</body>");
            out.println("</html>");
        } 
        }
    