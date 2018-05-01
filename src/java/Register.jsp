<%@page import="java.net.PasswordAuthentication"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="java.util.Random"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.Session.*"%>
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
        
        <%! String email;
    String u;
    String p;
    int key;
    String contact;%>
        <%
        String fname=request.getParameter("name");
        String lname=request.getParameter("name1");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        
        key = (int) (Math.random() * 1000);
        //System.out.println("name="+fname);
        try{
            Connection con=com.db.Connect.dbConnect();
            PreparedStatement pstmt=con.prepareStatement("insert into register (fname,lname,email,pass) values(?,?,?,?)");
            pstmt.setString(1, fname);
            pstmt.setString(2, lname);
            pstmt.setString(3, email);
            pstmt.setString(4, pass);
            int i=pstmt.executeUpdate();
            if(i>0){%>
            <script>
                alert('You are Register Succesfull');
                window.location="index.html";
            </script>
            <%}
            
            String result = null;
    final String username = "saiinfocorp@gmail.com";
    final String password = "saiinfo123";
    final String reciver = email;
   
    final String subject = "Authentication";
    Properties props = new Properties();


    props.setProperty("mail.host", "smtp.gmail.com");





    props.setProperty("mail.user", username);
    props.setProperty("mail.password", password);
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.transport.protocol", "smtp");

    props.put("mail.smtp.port", "465");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.debug", "true");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.socketFactory.port", "465");
    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.socketFactory.fallback", "true");
    props.put("mail.smtp.ssl.enable", "true");
    props.put("mail.smtp.debug", "true");
    
    Session session1 = Session.getInstance(props,
            new javax.mail.Authenticator() {

               
                 @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

    try {
        String all;
        String k = String.valueOf(key);
        
        all = "Username : " + u + "\nPassword : " + p + "\nContact No.: " + contact + "\nEmail id : " + email + "\nKEY : " + k;
        //        all="hellloo";        

        Message message = new MimeMessage(session1);
        message.setFrom(new InternetAddress("saiinfocorp@gmail.com"));
        message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(reciver));
        message.setSubject(subject);
        message.setText(all);
        //		message.setSentDate(new Date());
        Transport.send(message);
        result = "Mail Send Succesfully";
        System.out.println("Mail Send Succesfully");
        System.out.println(all);

        }
    catch (MessagingException e) {
        result = "Error in sending email,Pls try again later";
        System.out.println("Error in sending email,Pls try again later" + e);
        throw new RuntimeException(e);
    }
        }
    catch(Exception e){
            System.out.println(e);
        }
        %>
    </body>
</html>
