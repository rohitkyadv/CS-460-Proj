 
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
        <table border="1">
                <tr>
                    <th>First_Name</th>
                    <th>Last_Name</th>
                    <th>Email_Id</th>
                    <th>Contact_No</th>
                     <th>Address</th>
                     
                </tr>
                	
        	<%
                try
                {
                    String name=request.getParameter("country");
                    Connection  con=com.db.Connect.dbConnect();
                     PreparedStatement pstmt=con.prepareStatement("select First_Name,Last_Name,Email_Id,Contact_No,Address from profile where First_Name='"+name+"'");
                     ResultSet resultset=pstmt.executeQuery();
                     while(resultset.next())
                     {
                         %>
                         <tr>
                             <td> <%= resultset.getString("First_Name") %> </td>
               <td> <%= resultset.getString("Last_Name") %> </td>
               <td> <%= resultset.getString("Email_Id") %> </td>
               <td> <%= resultset.getString("Contact_No") %> </td>
               <td> <%= resultset.getString("Address") %> </td>
           </tr>
                    <% }
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                %>
            </table>
    </body>
</html>
