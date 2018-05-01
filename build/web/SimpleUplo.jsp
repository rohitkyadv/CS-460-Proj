<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.crypto.CipherOutputStream"%>
<%@page import="javax.crypto.CipherInputStream"%>
<%@page import="javax.crypto.SecretKeyFactory"%>
<%@page import="javax.crypto.spec.DESKeySpec"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.io.*"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.crypto.SecretKey"%>
<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*" import="com.csvreader.CsvReader"%>


<%
  String name = session.getAttribute("Username").toString();
  String productID="";
  String upl="";
  String pth="";
  String serverPth="";
   File f23=new File(application.getRealPath("images"));
  //  f23.mkdir();
    File f = new File(f23+"//"+name);
    f.mkdir();
 //File f=new File("");
 // f.mkdir();
  pth=f.getAbsolutePath();
  System.out.println(pth+"  path");
  session.setAttribute("pth",pth);
  %>

<head>
<title> Simple Upload</title>
<style TYPE="text/css">
<!--
.style1 {
	font-size: 12px;
	font-family: Verdana;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body background="images/bg10.jpeg">
<ul class="style1">
<%String fi=null;
      if (MultipartFormDataRequest.isMultipartFormData(request))// handle HTTP request for uploading files. 
      {
         // Uses MultipartFormDataRequest to parse the HTTP request.
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;

      

%>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >

           <jsp:setProperty name="upBean" property="folderstore" value="<%= pth %>"></jsp:setProperty>>
</jsp:useBean>
<%
       // fi=mrequest.getParameter("fil");
       // System.out.println(fi+" file");
          

                         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                Hashtable files = mrequest.getFiles();
                if ( (files != null) && (!files.isEmpty()) )
                {
                    UploadFile file = (UploadFile) files.get("uploadfile");
                    if (file != null) out.println("<li><BR><h3> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType()+"</h3>");
                    // Uses the bean now to store specified by jsp:setProperty at the top.
                    upBean.store(mrequest, "uploadfile");
                
                  
                  String fname=file.getFileName();
                session.setAttribute("fname", fname);
                System.out.println("fname12: "+fname);
                
        //        response.sendRedirect("Top.html");
                
       //         out.println("<h2>File uploaded Successfully!!!</h2>");
                
                }
                else
                {
                  out.println("<li>No uploaded files");
                }
	     }
         else out.println("<BR> todo="+todo);
          response.sendRedirect("Encrypt.jsp");

      }  
/*try{
              Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost/captch","root","root");
              Statement stmt=con.createStatement();
              ResultSet rs;
              String sql;
              int flag=0;
              String u=(String)session.getAttribute("username");
              sql="select * from register where userid='"+u+"' and ke= '"+fi+"'";
                               rs=stmt.executeQuery(sql);
if(rs.next()){
                   
       }
    else{
                               response.sendRedirect("index.jsp");
      }
}
                                                     catch(Exception e){}
 */
%>
</ul>

</body>
</html>
