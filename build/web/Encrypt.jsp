
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.Crypting"%>
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

<%@ page import="javax.activation.*"%>
<%@ page import="java.util.*"%>



<%@page import= "java.util.Random" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Premium Series
Description: A three-column, fixed-width blog design.
Version    : 1.0
Released   : 20090303

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Premium Series by Free CSS Templates</title>
<meta name="keywords" content="" />
<meta name="Premium Series" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
		<h1><a href="#"><span>Premium</span>Series</a></h1>
		<p>Designed By Free CSS Templates</p>
	</div>
	<div id="menu">
		<ul id="main">
			<li class="current_page_item"><a href="#">Homepage</a></li>
			<li><a href="#">Products</a></li>
			<li><a href="#">Services</a></li>
			<li><a href="#">About Us</a></li>
			<li><a href="#">Contact Us</a></li>
		</ul>
		<ul id="feed">
			<li><a href="#">Entries RSS</a></li>
			<li><a href="#">Comments RSS</a></li>
		</ul>
	</div>
	
</div>
<!-- end header -->
<div id="wrapper">
	<!-- start page -->
	<div id="page">
		<div id="sidebar1" class="sidebar">
			<ul>
				<li>
					<h2>Recent Posts</h2>
					<ul>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
					</ul>
				</li>
				<li>
					<h2>Recent Comments</h2>
					<ul>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Aliquam libero</a></li>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Proin gravida orci porttitor</a></li>
					</ul>
				</li>
				<li>
					<h2>Categories</h2>
					<ul>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
					</ul>
				</li>
				<li>
					<h2>Archives</h2>
					<ul>
						<li><a href="#">September</a> (23)</li>
						<li><a href="#">August</a> (31)</li>
						<li><a href="#">July</a> (31)</li>
						<li><a href="#">June</a> (30)</li>
						<li><a href="#">May</a> (31)</li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- start content -->
                <div id="content" style="margin-right: -100px">
			<div class="flower"><img src="images/img06.jpg" alt="" width="510" height="250" /></div>
			<div class="post">
				<h1 class="title"></h1>
				<p class="byline"></p>
				<div class="entry">
				</div>
			</div>
                        <div class="post" style="margin-right: -40px;margin-left: 100px">
<%! static int cnt = 1;
            String key1 = "";
            String filename;
            String user;
            int max_id = 1;
            String sql;
           String all = "";
     BufferedImage imgClean = null,imgOverlay=null;
	
    %>	  
    <% 
        String pth=(String)session.getAttribute("pth");
        try {
                        
			String key = "squirrel123"; // needs to be at least 8 characters for DES
                  //      String original=request.getParameter("Send File");
                        session = request.getSession(false);
                         user = session.getAttribute("Username").toString();
                         filename = session.getAttribute("fname").toString();
                  //        key1 = session.getAttribute("key").toString();
                        System.out.println("User:::: "+user+" filename:::: "+filename+" key:::: "+key );
                        
                        File f2=new File(pth+"\\"+filename);
                        System.out.println(f2.getAbsolutePath()+" fileabc ");
                        /*if(!f2.exists()){
                            f2.mkdir();
                        }*/
                        File f1=new File(f2.getAbsolutePath());//+"\\"+filename);
                        
                        //File f2=new File("c:\\uploads\\"+user+"\\encrypt\\");
                        //f2.mkdir();
                        
                         all = "FileName:: " +f1.getName() +" "+ new MimetypesFileTypeMap().getContentType(f1) + "  Length:: ("+f1.length() + ")bytes";
                        
			File fis = new File(f1.getAbsolutePath());//"E:\\match\\"+user+"\\"+filename);
			//FileOutputStream fos = new FileOutputStream("c:\\uploads\\"+user+"\\encrypt\\"+filename);
                       FileInputStream fis12 = new FileInputStream(f1.getAbsolutePath());//"E:\\match\\"+user+"\\"+filename);
			//encrypt(key, fis, fos);
                       File fEncrFile=new File("C:\\capt\\"+user+"\\en.png");
                       BufferedImage imgKey = Crypting.loadAndCheckEncrFile(fis);                                    
                       BufferedImage imgEnc = Crypting.loadAndCheckEncrFile(fEncrFile);
                       imgOverlay = Crypting.overlayImages(imgKey, imgEnc);                      
                       imgClean = Crypting.decryptImage(imgOverlay);
                       File f = new File(pth+"//res");//"E:\\match\\"+user+"\\res");
		    	if (!f.toString().endsWith(".png")) {
		    		f = new File(f.toString() + ".png");
		    	}
		    	try {
					ImageIO.write(imgClean, "png", f);
				} catch (IOException e1) {
					//JOptionPane.showMessageDialog(this, "Could not Save file because: " + e1.getLocalizedMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
				}
                       session.setAttribute("res",f.getAbsolutePath());
                       imgEnc.flush();
                       fis12.close();
                       System.out.println(f1.getAbsolutePath()+" jk");
                       imgClean.flush();
                       response.sendRedirect("display.jsp");

                      /* if(f1.delete()&&imgClean==null)
                                                 {
                       response.sendRedirect("index.jsp");                       
                       }
     else{
        }*/
		} catch (Throwable e) {
			e.printStackTrace();
		}
        %>
       <%!
	public static void doCopy(InputStream is, OutputStream os) throws IOException {
		byte[] bytes = new byte[64];
		int numBytes;
		while ((numBytes = is.read(bytes)) != -1) {
			os.write(bytes, 0, numBytes);
		}
		os.flush();
		os.close();
		is.close();
	}
        %>
       
         <%

            try {
                ResultSet rs;
                //      int max_id =1 ;
           /*     Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mobile", "root", "root");
                Statement stmt = con.createStatement();

                String queryForMaxId = "SELECT MAX(id) AS max_id FROM file;";
                rs = stmt.executeQuery(queryForMaxId);
                rs.next();
                max_id = rs.getInt("max_id");
                max_id++;
           //     key1 = (int) (Math.random() * 1000);
                sql = "insert into file values('" + max_id + "','" + filename + "','" + key1 + "','" + user + "')";

               
                
                stmt.executeUpdate(sql);
*/
            } catch (Exception e) {
            }


        
           
        
        %>       
        
      	
			</div>
			
		</div>
		<!-- end content -->
		<!-- start sidebars -->
		<div id="sidebar2" class="sidebar">
			<ul>
				<li>
					<form id="searchform" method="get" action="#">
						<div>
							<h2>Site Search</h2>
							<input type="text" name="s" id="s" size="15" value="" />
						</div>
					</form>
				</li>
				<li>
					<h2>Tags</h2>
					<p class="tag"><a href="#">dolor</a> <a href="#">ipsum</a> <a href="#">lorem</a> <a href="#">sit amet</a> <a href="#">dolor</a> <a href="#">ipsum</a> <a href="#">lorem</a> <a href="#">sit amet</a></p></li>
				<li>
					<h2>Calendar</h2>
					<div id="calendar_wrap">
						<table summary="Calendar">
							<caption>
							October 2009
							</caption>
							<thead>
								<tr>
									<th abbr="Monday" scope="col" title="Monday">M</th>
									<th abbr="Tuesday" scope="col" title="Tuesday">T</th>
									<th abbr="Wednesday" scope="col" title="Wednesday">W</th>
									<th abbr="Thursday" scope="col" title="Thursday">T</th>
									<th abbr="Friday" scope="col" title="Friday">F</th>
									<th abbr="Saturday" scope="col" title="Saturday">S</th>
									<th abbr="Sunday" scope="col" title="Sunday">S</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td abbr="September" colspan="3" id="prev"><a href="#" title="View posts for September 2009">&laquo; Sep</a></td>
									<td class="pad">&nbsp;</td>
									<td colspan="3" id="next">&nbsp;</td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td id="today">4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
								</tr>
								<tr>
									<td>8</td>
									<td>9</td>
									<td>10</td>
									<td>11</td>
									<td>12</td>
									<td>13</td>
									<td>14</td>
								</tr>
								<tr>
									<td>15</td>
									<td>16</td>
									<td>17</td>
									<td>18</td>
									<td>19</td>
									<td>20</td>
									<td>21</td>
								</tr>
								<tr>
									<td>22</td>
									<td>23</td>
									<td>24</td>
									<td>25</td>
									<td>26</td>
									<td>27</td>
									<td>28</td>
								</tr>
								<tr>
									<td>29</td>
									<td>30</td>
									<td>31</td>
									<td class="pad" colspan="4">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<h2>Categories</h2>
					<ul>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>
<div id="footer">
	<p class="copyright">&copy;&nbsp;&nbsp;2009 All Rights Reserved &nbsp;&bull;&nbsp; Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
	<p class="link"><a href="#">Privacy Policy</a>&nbsp;&#8226;&nbsp;<a href="#">Terms of Use</a></p>
</div>
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>
