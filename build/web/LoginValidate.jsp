

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        session.setAttribute("useremailid", email);
        try{
            
            Connection con=com.db.Connect.dbConnect();
            PreparedStatement pstmt=con.prepareStatement("select first_name,registration_id from registration where email_id=? and password=?");
            pstmt.setString(1, email);
            pstmt.setString(2, pass);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
                session.setAttribute("userRegId",rs.getString("registration_id"));
                session.setAttribute("EmailId",request.getParameter("email"));
                session.setAttribute("Username",rs.getString("first_name"));
                 response.sendRedirect("Upload.jsp");
                //response.sendRedirect("Home.jsp");
                Statement pst=con.createStatement();
               pst.executeUpdate("Update registration set status='Active' where registration_id="+rs.getString("registration_id"));
                 
            }else{%>
            <script>
                alert('Invalid User Name or Password!!!!');
                window.location="index.html";
            </script>
            <%}
        }catch(Exception e){
            System.out.println(e);
        }
        %>
    </body>
</html>
