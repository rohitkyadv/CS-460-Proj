

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
        
        String unameId = request.getParameter("receiverid");
        //System.out.println("name="+fname);
        try{
            Connection con=com.db.Connect.dbConnect();
            PreparedStatement pstmt=con.prepareStatement("insert into post (sender_id,reciver_id,description,image_path,post_display,po_date) values(?,?,?,?,?,CURRENT_TIMESTAMP())");
            
            pstmt.setInt(1, Integer.parseInt(receiverid));
            pstmt.setInt(2, Integer.parseInt(unameId));
            pstmt.setString(3, status);
            pstmt.setString(4, "noimage");
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
