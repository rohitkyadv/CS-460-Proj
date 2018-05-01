<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*" %>
<%@ page import= "java.io.*" %>
<%
try{
    String txtFileNameVariable="key.png";
    String locationVariable="C:\\capt\\"+session.getAttribute("un").toString()+"\\";//"E:/c/";
    String PathVariable="";
    System.out.println("loc"+locationVariable);
    //txtFileNameVariable = request.getParameter("fileVariable");
    //locationVariable = request.getParameter("locationVariable");
    PathVariable = locationVariable+txtFileNameVariable;
    BufferedInputStream bufferedInputStream = null;
    try{
        bufferedInputStream = new BufferedInputStream(new FileInputStream(PathVariable));
    }
    catch(FileNotFoundException fnfe){
        fnfe.printStackTrace();
    }
    File f=new File(locationVariable, txtFileNameVariable);
    String fileType = txtFileNameVariable.substring(txtFileNameVariable.indexOf(".")+1,txtFileNameVariable.length());
    if (fileType.trim().equalsIgnoreCase("txt")) {
        response.setContentType( "text/plain" );
    } else if (fileType.trim().equalsIgnoreCase("doc")) {
        response.setContentType( "application/msword" );
    } else if (fileType.trim().equalsIgnoreCase("xls")) {
        response.setContentType( "application/vnd.ms-excel" );
    } else if (fileType.trim().equalsIgnoreCase("pdf")) {
        response.setContentType( "application/pdf" );
    }else if (fileType.trim().equalsIgnoreCase("png")) {
        response.setContentType( "image/jpeg" );
    }  else {
        response.setContentType( "application/octet-stream" );
    }
    String original_filename = txtFileNameVariable;
    response.setHeader( "Content-Disposition", "attachment; filename=\"" + original_filename + "\"" );
    try{
        int anInt=0;
        OutputStream output = response.getOutputStream();
        while((anInt=bufferedInputStream.read())!=-1)
            output.write(anInt);
        output.flush();
        response.sendRedirect("index.html");
    } catch(IOException ioe) {
        ioe.printStackTrace();
    }
} catch(Exception e) {
    out.println("This is the Error " +e.getMessage());
}

%>