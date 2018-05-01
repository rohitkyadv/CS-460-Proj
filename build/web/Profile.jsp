<%@page import="java.util.HashSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.PostFB"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome to Twitter</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/portfolio-item.css" rel="stylesheet">
       <script type="text/javascript">
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function(e) {
                        $('#blah')
                                .attr('src', e.target.result)
                                .width(80)
                                .height(80);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
           <script>

            function showonlyone(thechosenone) {
                var newboxes = document.getElementsByTagName("div");
                for (var x = 0; x < newboxes.length; x++) {
                    name = newboxes[x].getAttribute("class");
                    if (name == 'newboxes') {
                        if (newboxes[x].id == thechosenone) {
                            newboxes[x].style.display = 'block';
                        }
                        else {
                            newboxes[x].style.display = 'none';
                        }
                    }
                }
            }

        </script>
        <script>
                                                                function profilevalidations(){
                                                                    
                                                                       // alert("hi");
                                                                       var fname=document.getElementById("image").value;
                                                                       var lname=document.getElementById("lname").value;
                                                                       var femail=document.getElementById("emailid").value;
                                                                       var contact=document.getElementById("contact").value;
                                                                       var address=document.getElementById("address").value;
                                                                       
                                                                       if(fname==null || fname==""){
                                                                           alert("Please Select Image.");
                                                                           return false;
                                                                       }else if(lname==null || lname==""){
                                                                           alert("Please Enter Last Name.");
                                                                           return false;
                                                                       }else  if(femail=="" || femail==null ){
                                                                           alert("Please Enter Email ID.");
                                                                           return false;
                                                                       }else  if(contact=="" || contact==null ){
                                                                           alert("Please Enter Contact No.");
                                                                           return false;
                                                                       }else  if(address=="" || address==null ){
                                                                           alert("Please Enter Address.");
                                                                           return false;
                                                                       }else
                                                                       {
                                                                           return true;
                                                                       }
                                                                       
                                                                    
                                                                }
                                                            </script>
  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Twitter</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <%
                            String uname = session.getAttribute("Username").toString();
                            String USerRegID = session.getAttribute("userRegId").toString();
String EmailID = session.getAttribute("EmailId").toString();
                            PostFB fb = com.DAO.UserDAO.getAllUserDetails(Integer.parseInt(USerRegID));
                            session.setAttribute("profile", fb);

                        %>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
               <li class="nav-item">
                   <a class="nav-link" style="margin-right: 100px" >Welcome :&nbsp;&nbsp;&nbsp;<%=uname%></a>
               </li>
                        <li class="nav-item">
                   <a class="nav-link" style="margin-right: 100px" >Group :</a>
            
                                         
                                        <% List statuslist12 = com.DAO.ListDAO.getListForGroup(Integer.parseInt(USerRegID),(String)session.getAttribute("useremailid"));
                                                        Iterator itr12 = statuslist12.iterator();
                                                        if (itr12.hasNext()) {
                                                            com.DAO.PostFB fbstatus1 = (com.DAO.PostFB) itr12.next();
                                                            System.out.println(fbstatus1.getGroupList());
                                                if(fbstatus1.getGroupList()==null){            
                                        %><%
                                        fbstatus1.setGroupList(" ");
                                                   %>
                                                   <a class="nav-link" style="margin-left: 70px;margin-top: -39px;"><%=fbstatus1.getGroupList()%></a>
                                        
                                                <%}
                                                else{
                                                    %>
                                                    <a class="nav-link"  style="margin-left: 70px;margin-top: -39px;">  <%=   fbstatus1.getGroupList().replace(",", ",")%></a>
                                                   <%
                                                }
                                                %>
                                    <%}%>
                                   </li>
              <li class="nav-item active">
              <a class="nav-link" href="Home.jsp">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Profile.jsp">Profile</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.html">Log Out</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
 
    <!-- Page Content -->
    <div class="container">

      <!-- Portfolio Item Heading -->
      <h1 class="my-4">
        <small></small>
      </h1>

      <!-- Portfolio Item Row -->
      <div class="row" style="margin-top:100px">

<!--        <div class="col-md-8">
          <img class="img-fluid" src="http://placehold.it/750x500" alt="">
        </div>-->

        <div class="col-md-8">
            <table style="width: 1000px;">
<!--                <tr style="width:300px"> -->
                       <h2>Personal Info</h2>
                                <div class="loginbox radius">

                                    <div class="loginboxinner radius">
                                        <div class="loginform">
<%
    String[] name=uname.split(" ");
%>
<form  action="FileUploadDBServlet" method="post"  enctype="multipart/form-data" onsubmit="javascript:return profilevalidations();">
                                                <table><tr><td >
                                                <div style="background-color: black;height:70px;width: 80px; ">
                                                    <img id="blah" src="#" alt="your image" />
                                                </div>
                                                            <input type='file' name="image" id="image" onchange="readURL(this);" />
                                                &nbsp;<br>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table><tr><td>
                                                    <input type="text" id="fname" style="width:99%;" name="name"  placeholder="First Name" value="<%=name[0]%>" class="radius mini" /> 
                                                                    </td><td>
                                                    <input type="hidden" id="userid" name="userregi"   value="<%=USerRegID%>"  /> 
                                                    </td>
                                                    </tr>
                                                    </table>
                                                    </td>
                                                    </tr>
                                                    &nbsp;
                                                    <tr><td >
                                                    &nbsp;
                                                <p>
                                                    <input type="text" id="emailid" style="width:70%;" name="email"   placeholder="Your Email" value="<%=EmailID%>" class="radius" />
                                                    
                                                </p></td>
                                                    </tr>
                                                        <tr><td>
                                                <p>
                                                    
                                                    <textarea name="address" rows="3" id="address" cols="60" placeholder="Address" value="<%=fb.getAddress() %>"></textarea>
                                                    

                                                </p>
                                                    </td></tr>
                                                    <tr><td>
                                                <p>
                                                    <button class="radius title" name="client_login">Update</button>
                                                    <!-- <input type="submit" value="Sign Up for Facebook" class="radius title" name="client_login" onclick="check()"/>-->
                                                </p>
                                                            </td></tr>
                                                </table>
                                            </form>
               
                                        </table>

        </div>

      </div>
      <!-- /.row -->

     

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
