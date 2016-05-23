/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package source;

/**
 *
 * @author shweta
 */
public class DBConnect2 {

   public static String con = "jdbc:mysql://localhost:3306/lockedfolder";
   public static String user = "root";
   public static String pass = "ganeshji";
   
   static
   {
       try
       {
           Class.forName("com.mysql.jdbc.Driver");
                   System.out.println("Driver loaded");
       }
       catch(Exception e)
       {
           System.out.println(e.toString());
       }
   }
      
    
    
}
