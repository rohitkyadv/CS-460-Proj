
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.*"%>
<%@ page import="java.awt.geom.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>SafeSpace</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
</head>
<body>

<div id="bg_clouds">
<div id="main">
<!-- header begins -->
<div id="header">
	<div id="logo">
    	<a href="#">SafeSpace</a>
      	<h2><a href="#" id="metamorph">Feel Free To Share</a></h2>
    </div>
	<div id="buttons">
      <a href="index.html" class="but but_t"  title="">Home</a>
      <a href="index.jsp" class="but" title="">Login</a>
      <a href="register.jsp"  class="but" title="">Register</a>
      <a href="contact_us.jsp" class="but" title="">Contact us</a>
       <a href="index.jsp"  class="but" title="">Logout</a>
    </div>
</div>
<!-- header ends -->
<div class="top_top"></div>
<div class="top">

 <div id="wrapper">
        <div id="slider-wrapper">        
            <div id="slider" class="nivoSlider">
                <img src="images/top.jpg" alt="" />
                <img src="images/top2.jpg" alt=""/>
                <img src="images/top3.jpg" alt="" />
            </div>        
        </div>

</div>

<script type="text/javascript" src="lib/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" src="lib/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
</div>
<div class="top_bot"></div>
<div style="height:17px"></div>
        <!-- content begins -->
        		</div>               <div class="post" style="margin-right: -40px;margin-left: 100px">
			    <jsp:useBean id="link" class = "com.NewClass" />    
                            <%
 String name=(String)session.getAttribute("un");
 String key=request.getParameter("key");
//System.out.println(key);
  String imageFormat = "jpg";
String fsi=null;  
//response.setContentType("image/" + imageFormat);
File f3;
 try {
   // you can pass in fontSize, width, height via the request
   
   Color backgroundColor = Color.red;
   Color borderColor = Color.black;
   Color textColor = Color.white;
   Color circleColor = new Color(160,160,160);
   Font textFont = new Font("Arial", Font.PLAIN, paramInt(request, "fontSize", 24));
   int charsToPrint = 10;
   int width = paramInt(request, "width", 250);
   int height = paramInt(request, "height", 100);
   int circlesToDraw = 6;
   float horizMargin = 20.0f;
   float imageQuality = 0.95f; // max is 1.0 (this is for jpeg)
   double rotationRange = 0.7; // this is radians
   BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

   Graphics2D g = (Graphics2D) bufferedImage.getGraphics();

   g.setColor(backgroundColor);
   g.fillRect(0, 0, width, height);

   // lets make some noisey circles
   g.setColor(circleColor);
   for ( int i = 0; i < circlesToDraw; i++ ) {
     int circleRadius = (int) (Math.random() * height / 2.0);
     int circleX = (int) (Math.random() * width - circleRadius);
     int circleY = (int) (Math.random() * height - circleRadius);
     g.drawOval(circleX, circleY, circleRadius * 2, circleRadius * 2);
   }

   g.setColor(textColor);
   g.setFont(textFont);

   FontMetrics fontMetrics = g.getFontMetrics();
   int maxAdvance = fontMetrics.getMaxAdvance();
   int fontHeight = fontMetrics.getHeight();

   // i removed 1 and l and i because there are confusing to users...
   // Z, z, and N also get confusing when rotated
   // 0, O, and o are also confusing...
   // lowercase G looks a lot like a 9 so i killed it
   // this should ideally be done for every language...
   // i like controlling the characters though because it helps prevent confusion
   String elegibleChars = "ABCDEFGHJKLMPQRSTUVWXYabcdefhjkmnpqrstuvwxy23456789";
   char[] chars = elegibleChars.toCharArray();
System.out.println("chars "+key);
   float spaceForLetters = -horizMargin * 2 + width;
   float spacePerChar = spaceForLetters / (charsToPrint - 1.0f);
System.out.println("chars23");

   AffineTransform transform = g.getTransform();

   StringBuffer finalString = new StringBuffer();
 char characterToShow;
 char[] k=key.toCharArray();

   for ( int i = 0; i < charsToPrint; i++ ) {
             double randomValue = Math.random();
     int randomIndex = (int) Math.round(randomValue * (chars.length - 1));
    System.out.println("chars1");

       if(i<5){
                characterToShow=k[i];
               finalString.append(characterToShow);
               }else{
       characterToShow = chars[randomIndex];
     finalString.append(characterToShow);
             }
     System.out.println("char "+characterToShow+ "fi "+finalString);
     fsi=finalString.toString();
     // this is a separate canvas used for the character so that
     // we can rotate it independently
     int charImageWidth = maxAdvance * 2;
     int charImageHeight = fontHeight * 2;
     int charWidth = fontMetrics.charWidth(characterToShow);
     int charDim = Math.max(maxAdvance, fontHeight);
     int halfCharDim = (int) (charDim / 2);

     BufferedImage charImage = new BufferedImage(charDim, charDim, BufferedImage.TYPE_INT_ARGB);
     Graphics2D charGraphics = charImage.createGraphics();
     charGraphics.translate(halfCharDim, halfCharDim);
     double angle = (Math.random() - 0.5) * rotationRange;
     charGraphics.transform(AffineTransform.getRotateInstance(angle));
     charGraphics.translate(-halfCharDim,-halfCharDim);
     charGraphics.setColor(textColor);
     charGraphics.setFont(textFont);

     int charX = (int) (0.5 * charDim - 0.5 * charWidth);
     charGraphics.drawString("" + characterToShow, charX, 
                            (int) ((charDim - fontMetrics.getAscent()) 
                                   / 2 + fontMetrics.getAscent()));

     float x = horizMargin + spacePerChar * (i) - charDim / 2.0f;
     int y = (int) ((height - charDim) / 2);
//System.out.println("x=" + x + " height=" + height + " charDim=" + charDim + " y=" + y + " advance=" + maxAdvance + " fontHeight=" + fontHeight + " ascent=" + fontMetrics.getAscent());
g.drawImage(charImage, (int) x, y, charDim, charDim, null, null);

     
     charGraphics.dispose();
     
   }
 
   g.setColor(borderColor);
  g.drawRect(0, 0, width - 1, height - 1);
session.setAttribute("cap",finalString);
   //Write the image as a jpg
   Iterator iter = ImageIO.getImageWritersByFormatName(imageFormat);
   if( iter.hasNext() ) {
     ImageWriter writer = (ImageWriter)iter.next();
     ImageWriteParam iwp = writer.getDefaultWriteParam();
     if ( imageFormat.equalsIgnoreCase("jpg") || imageFormat.equalsIgnoreCase("jpeg") ) {
       iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
       iwp.setCompressionQuality(imageQuality);
           }
   //  writer.setOutput(ImageIO.createImageOutputStream(response.getOutputStream()));
      
   //  System.out.print(application.getRealPath("images")+"/input.png");
     session.setAttribute("path",application.getRealPath("/images")+"/input.png");
        //File f = new File("D:\\capt\\");
    //f.mkdir();//application.getRealPath("images")+"/input.png");//"D:/input.png");
//File f2=new  File(f.toString()+"\\"+name);     
//f2.mkdir();
 //f3=new File(f2+"\\input.jpg");
    FileOutputStream fout = new FileOutputStream(application.getRealPath("/images/")+"/input.png");
ImageIO.write(bufferedImage, "jpg", fout);
fout.close();
     IIOImage imageIO = new IIOImage(bufferedImage, null, null);
   System.out.println("ank");
     
     //writer.write(null, imageIO, iwp);

    
     

        

                               } else {
     throw new RuntimeException("no encoder found for jsp");
   }

   // let's stick the final string in the session
   request.getSession().setAttribute("captcha", finalString.toString());

   g.dispose();
      // response.sendRedirect("img.jsp");
 } catch (IOException ioe) {
   throw new RuntimeException("Unable to build image" , ioe);
 }
 try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter","root","root");
    System.out.println("Driver Loaded Successfully");
	//File imgfile = new File(u_file);
	//FileInputStream fin = new FileInputStream(imgfile);
//connectionFactory.executeUpdate(sql);
System.out.println(fsi+"  fsi");
    PreparedStatement pstmt=con.prepareStatement("update registration set ke=? where first_name=?");
  pstmt.setString(1, fsi);
  
  pstmt.setString(2, name);
  int i=pstmt.executeUpdate();
  }catch(Exception e){}
  String path=application.getRealPath("/images/")+"/input.png";
  System.out.println(path+" nm");
  link.key(name,path);
  response.sendRedirect("down.jsp");
 
%>
<%!
  public static String paramString(HttpServletRequest request, String paramName, String defaultString) {
    return request.getParameter(paramName) != null ? request.getParameter(paramName) : defaultString;
  }

  public static int paramInt(HttpServletRequest request, String paramName, int defaultInt) {
    return request.getParameter(paramName) != null ? Integer.parseInt(request.getParameter(paramName)) : defaultInt;
  }

%>
                                <h1>Step 2</h1> 
    <!--                           <img src="images/input.png"> </img>
      <p> 
    
                                    <label >Key </label>
                                    <input id="username" name="key" required="required" type="password" />
                                </p>
                                <p class="login button"> 
                                    <input type="submit" value="Register" onclick="function a()"  /> 
								</p>
                            </form>
        -->                        
        <h3><a href="index.jsp">Login...</a></h3>
			</div>
			
		</div>
          	<div style="clear: both; height:20px;"></div>
        </div>
    </div>
<!-- bottom end --> 
<!-- footer begins -->
            
</div>

</div>
</body>
</html>
