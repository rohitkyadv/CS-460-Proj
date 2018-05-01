
import com.DAO.PostFB;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)	// upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {

    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/twitter";
    private String dbUser = "root";
    private String dbPass = "root";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        HttpSession session=request.getSession();
        String fname = request.getParameter("name");

        String lname = request.getParameter("name1");
        String email = request.getParameter("email");
        String userRegId = request.getParameter("userregi");
        String Contact = request.getParameter("Contact");
        String Adress = request.getParameter("address");

// obtains the upload file part in this multipart request
     Part filePart = request.getPart("image");
     String savePath="";
     String filepath="";
     String fileName="";
        if (filePart != null) {   
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        savePath = getServletContext().getRealPath("/profile");
            File fileSaveDir=new File(savePath);
            if(!fileSaveDir.exists()){
                fileSaveDir.mkdir();
            }
        
        fileName=extractFileName(filePart);
         filepath=savePath + File.separator + fileName;
        filePart.write(filepath);
        
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            System.out.println("filepath=>"+filepath);
            // obtains input stream of the upload file

            
            
        }

        Connection conn = null;	// connection to the database
        String message = null;	// message will be sent back to client

        try {
            // connects to the database
            //DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String sql = "update profile set contact_no="+Contact+" , address='"+Adress+"',image_path='profile/"+fileName+"' where registration_id="+userRegId;
            PreparedStatement statement = conn.prepareStatement(sql);
            PostFB fb=com.DAO.UserDAO.getAllUserDetails(Integer.parseInt(userRegId));
                            session.setAttribute("profile",fb );
          // sends the statement to the database server
            int row = statement.executeUpdate();
            
            response.sendRedirect("Profile.jsp");
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FileUploadDBServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(FileUploadDBServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            
        }
    }
    
    
    public String extractFileName(Part part) {
    String contentDisp = part.getHeader("content-disposition");
    String[] items = contentDisp.split(";");
    for (String s : items) {
        if (s.trim().startsWith("filename")) {
            return s.substring(s.indexOf("=") + 2, s.length()-1);
        }
    }
    return "";
}
}