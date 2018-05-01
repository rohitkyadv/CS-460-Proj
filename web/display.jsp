<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Twitter Style Home Page Design - demo by w3lessons.info</title>
<link rel="stylesheet" href="style.css" type="text/css" />
<!--<script>
    function check(){
        alert('hi');
    }
</script>-->
</head>

<body class="login">
<!-- header starts here -->
<div id="facebook-Bar">
  <div id="facebook-Frame">
    <div id="facebook-Bar">
  <div id="facebook-Frame">
    <div id="logo"> <a href="">Twitter</a> </div>

    
         
        <div id="header-main-right">
          <div id="header-main-right-nav">
        
      </div>
          </div>
      </div>
</div>
<!-- header ends here -->

<div class="loginbox radius">
<h2 style="color:#141823; text-align:center;">Welcome to Twitter</h2>
	<div class="loginboxinner radius">
    	<div class="loginheader">
    		<h4 class="title">Upload Key</h4>
    	</div><!--loginheader-->
        
        <div class="loginform">
                	
                <form  action="en1.jsp" autocomplete="on">
        <%int i=0;
//int  i1=Integer.parseInt(request.getParameter("i"));

String user=  session.getAttribute("Username").toString();
             String pth=(String)session.getAttribute("pth");           
String pt="images/"+user+"/res.png";   
System.out.println(pt+"  pt");    
        %>
                               <img src=<%=pt%>></img>
                               <div style="margin-top: 20px"> 
                               <p> 
                                    <label for="username" class="uname" data-icon="u" > </label>
                                    <input id="username" name="key" required="required" type="text" />
                                </p>
                                   
                                <p class="login button" style="margin-top: 20px"> 
                                    <input type="submit" value="Login" onclick="function a()"  /> 
								</p>
                            </form>
        </div><!--loginform-->
    </div><!--loginboxinner-->
</div><!--loginbox-->

<!--<div id="ad" style="width:100%; margin-top:50px;">
<center><script type="text/javascript"><!--
google_ad_client = "ca-pub-5104998679826243";
/* mysite */
google_ad_slot = "2922638918";
google_ad_width = 250;
google_ad_height = 250;

</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script> 
</center>-->
</div>






</body>

</html>
  <script>
                                                                function regivalidations(){
                                                                    
                                                                       // alert("hi");
                                                                       var fname=document.getElementById("fname").value;
                                                                       var lname=document.getElementById("lname").value;
                                                                       var femail=document.getElementById("eml").value;
                                                                       var semail=document.getElementById("reml").value;
                                                                       if(fname==null || fname==""){
                                                                           alert("Please Enter First Name.");
                                                                           return false;
                                                                       }else if(lname==null || lname==""){
                                                                           alert("Please Enter Last Name.");
                                                                           return false;
                                                                       }else if(femail!=semail){
                                                                           alert("Email ID is not Match.");
                                                                           return false;
                                                                       }else  if(femail=="" || femail==null ){
                                                                           alert("Please Enter Email ID.");
                                                                           return false;
                                                                       }else
                                                                       {
                                                                           return true;
                                                                       }
                                                                       
                                                                    
                                                                }
                                                            </script>