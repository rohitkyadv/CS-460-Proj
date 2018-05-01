 
<%@page import="java.io.File"%>
<%@page import="java.io.PrintWriter"%>
<%-- 
    Document   : poststatus
    Created on : Nov 12, 2014, 4:41:59 PM
    Author     : admin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String status=request.getParameter("status");
        
                String display=request.getParameter("display");
        String receiverid="";
        
            receiverid=session.getAttribute("userRegId").toString();
        
        String unameId = session.getAttribute("userRegId").toString();
        //System.out.println("name="+fname);
        
        Part filePart = request.getPart("image");
     String savePath="";
     String filepath="";
     String fileName="";
        if (filePart != null) {   
        response.setContentType("text/html;charset=UTF-8");
      
        
        savePath = getServletContext().getRealPath("/Post");
            File fileSaveDir=new File(savePath);
            if(!fileSaveDir.exists()){
                fileSaveDir.mkdir();
            }
        FileUploadDBServlet j=new FileUploadDBServlet();
        fileName=j.extractFileName(filePart);
         filepath=savePath + File.separator + fileName;
        filePart.write(filepath);
        
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            System.out.println("filepath=>"+filepath);
            // obtains input stream of the upload file

            
            
        }
        try{
            Connection con=com.db.Connect.dbConnect();
            PreparedStatement pstmt=con.prepareStatement("insert into post (sender_id,reciver_id,description,image_path,post_display,po_date) values(?,?,?,?,?,CURRENT_TIMESTAMP())");
            
            pstmt.setInt(1, Integer.parseInt(unameId));
            pstmt.setInt(2, Integer.parseInt(receiverid));
            pstmt.setString(3, status);
            pstmt.setString(4, "Post/"+fileName);
            pstmt.setString(5, display);
           
            int i=pstmt.executeUpdate();
            if(i>0){%>
            <script>
                
                window.location="Home.jsp";
            </script>
            <%}
        }catch(Exception e){
            System.out.println(e);
        }
        %>
    </body>
</html>
