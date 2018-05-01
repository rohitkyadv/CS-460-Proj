

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <b> hiiii</b>
        <%
        out.println("byrrrr");
       String name = request.getParameter("name");
        out.println("print name"+name);
        
        
        
        %>
    </body>
</html>
