/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
/**
 *
 * @author Ganraj
 */
@WebServlet("/postimage")
@MultipartConfig(maxFileSize = 16177215)
public class postimage extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            HttpSession session = request.getSession();
            String status = request.getParameter("status");
            String display = request.getParameter("display");
            String receiverid = "";
            receiverid = session.getAttribute("userRegId").toString();
            String unameId = session.getAttribute("userRegId").toString();
            System.out.println("name="+status);

            Part filePart = request.getPart("image");
            System.out.println("name="+filePart);
            String savePath = "";
            String filepath = "";
            String fileName = "";
            if (filePart != null) {
                response.setContentType("text/html;charset=UTF-8");


                savePath = getServletContext().getRealPath("/post");
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }
                
                fileName = extractFileName(filePart);
                filepath = savePath + File.separator + fileName;
                filePart.write(filepath);

                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                System.out.println("filepath=>" + filepath);
                // obtains input stream of the upload file



            }
            try {
                Connection con = (Connection) com.db.Connect.dbConnect();
                PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("insert into post (sender_id,reciver_id,description,image_path,post_display,po_date) values(?,?,?,?,?,CURRENT_TIMESTAMP())");

                pstmt.setInt(1, Integer.parseInt(unameId));
                pstmt.setInt(2, Integer.parseInt(receiverid));
                pstmt.setString(3, status);
                pstmt.setString(4, "post/" + fileName);
                pstmt.setString(5, display);

                int i = pstmt.executeUpdate();
                if (i > 0) {

                    response.sendRedirect("Home.jsp");
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet postimage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet postimage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
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
