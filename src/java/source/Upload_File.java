
package source;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet("/uploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2,
        maxFileSize=1024*1024*10,
        maxRequestSize=1024*1024*50)


public class Upload_File extends HttpServlet {

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

//                
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
                 filePart.write(savepath+File.separator+filename);
                try 
                {
                    Connection con = DriverManager.getConnection(DBConnect.con,DBConnect.user, DBConnect.pass);
                    Statement st = con.createStatement();
                    String query="INSERT INTO Files (image_name,image_path,ext,files,size) values (?,?,?,?,?)";
//                    String sql = "INSERT INTO files (id, title, files) values (?, ?, ?)";
                    PreparedStatement pst = con.prepareStatement(query);
//                    pst.setString(1, idTemp);
                    pst.setString(1, title);
                    String filePath= savepath + File.separator + filename ;
                pst.setString(2,filePath);
                int i = filename.lastIndexOf('.');
                    if (i > 0) 
                    {
                        String Extension = filename.substring(i+1);
                        pst.setString(3, Extension);
                    }
             
                    if (inputStream != null) 
                    {
                        pst.setBinaryStream(4, inputStream, (int) filePart.getSize());
                    }
                    pst.setLong(5, sizeinkb);
                    int row = pst.executeUpdate();
                    if (row > 0) 
                    {
                        System.out.println("File uploaded!!!");
                        
                        con.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("mainPage.jsp");
                        rs.include(request, response);
                    }
                    else
                    {
                        System.out.println("Couldn't upload your file!!!");
                        
                        con.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("mainPage.jsp");
                        rs.include(request, response);
                    }    

                }catch(Exception e){e.printStackTrace();}   
                 out.println("</body>");
            out.println("</html>");
    }   
    }

    


