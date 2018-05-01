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

    <title>Welcome to MySpace</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/portfolio-item.css" rel="stylesheet">
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
                                                        function posttextvalidations(){
                                                                    
                                                                       // alert("hi");
                                                                       var fname=document.getElementById("sttext").value;
                                                                     
                                                                      
                                                                       if(fname==null || fname==""){
                                                                           alert("Please Enter Text.");
                                                                           return false;
                                                                       }else
                                                                       {
                                                                           return true;
                                                                       }
                                                                       
                                                                    
                                                                    }   
                                                                     function posttextwithimagevalidations(){
                                                                    
                                                                       // alert("hi");
                                                                       var postimage=document.getElementById("postimage").value;
                                                                     var statustext=document.getElementById("statustext").value;
                                                                       if(statustext==null || statustext==""){
                                                                           alert("Please Enter Text.");
                                                                           return false;
                                                                       }else
                                                                       if(postimage==null || postimage==""){
                                                                           alert("Please Select Image.");
                                                                           return false;
                                                                       }else
                                                                       {
                                                                           return true;
                                                                       }
                                                                       
                                                                    
    } 
                                                            </script>
       <script type="text/javascript">

    function copy() {
var sel = document.getElementById("selectValuecustom");
var text = sel.options[sel.selectedIndex].value;
var out = document.getElementById("selectValuecustomOutput");
out.value += text+"\n";

      }
      function copy1() {
var sel1 = document.getElementById("selectValuecustom1");
var text1 = sel1.options[sel1.selectedIndex].value;
var out = document.getElementById("selectValuecustomOutput");
out.value += text1+"\n";

      }
    </script>
  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">MySpace</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <%
                            String uname = session.getAttribute("Username").toString();
                            String USerRegID = session.getAttribute("userRegId").toString();

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
              <a class="nav-link" href="#">Home
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
                <tr style="width:300px"> 
                                    
                                        <td>
                                <%
                                String custom=request.getParameter("custom");
                                if(custom !=null && !custom.isEmpty())
                                {
                                  String status=request.getParameter("status");
                                %>
                                <div class="newboxes" id="newboxes1"  >
                                <form action="poststatus.jsp" method="post" name="form1" onsubmit="javascript:return posttextvalidations();">
                                    <table style="border: 1px solid blue;" cellspacing="7">
                                        <tr>
                                            <td>
                                            <textarea cols="51" rows="3" id="sttext" value="<%=status%>" name="status"></textarea>
                                            </td>
                                            <td><textarea cols="51" rows="3" name="removeFriendArea" id="selectValuecustomOutput" ></textarea>
                                            </td>
                                        </tr>
                                        <tr><td><h6>College</h6></td><td> <h6 >School</h6></td></tr>
                                            <tr>
                                                <td>
                                                     <select id="selectValuecustom"  name="friendsList" >
                                                    <%
                                                    HashSet shrlist = com.DAO.ListDAO.getListForSharedCustom(Integer.parseInt(USerRegID),(String) session.getAttribute("useremailid"));
                                                    Iterator itr1 = shrlist.iterator();
                                                    String nameemail="";
                                                    while (itr1.hasNext()) {
                                                    com.DAO.PostFB fbstacust = (com.DAO.PostFB) itr1.next();
                                                    if(fbstacust.getGroupList().contains("college") && !fbstacust.getEmailID().equals((String) session.getAttribute("useremailid"))){
                                                    nameemail=fbstacust.getUsername()+" "+fbstacust.getEmailID()+" ";
                                                  %>                                          
                                                   <option value="<%=nameemail%>"><%=fbstacust.getUsername()%></option>
                                                    <%
                                                    }}%>
                                                    <input type="button" name="removeFrind" value="Remove Friends" onclick="copy()"/>
                                                     </select> 
                                                    <select id="selectValue"  name="display" value="<%=custom%>" >
                                                       
                                                        <option value="custom">Custom</option>
                                                    </select>
                                                <input type="submit" name="submit"  value="CustomPost" style="margin-bottom: 20px; size: 10px"/>
                                                </td><td>
                                                    <select id="selectValuecustom1" style="margin-bottom: 23px;"  name="friendsList" >
                                                    <%
                                                    HashSet shrlist1 = com.DAO.ListDAO.getListForSharedSchoolCustom(Integer.parseInt(USerRegID),(String) session.getAttribute("useremailid"));
                                                    Iterator itr123 = shrlist1.iterator();
                                                     String nameemail1=null;
                                                    while (itr123.hasNext()) {
                                                    com.DAO.PostFB fbstacust1 = (com.DAO.PostFB) itr123.next();
                                                    if(fbstacust1.getGroupList().contains("school") && !fbstacust1.getEmailID().equals((String) session.getAttribute("useremailid"))){
                                                    nameemail1=fbstacust1.getUsername()+" "+fbstacust1.getEmailID()+" ";
                                                   %>
                                                  <option value="<%=nameemail1%>"><%=fbstacust1.getUsername()%></option>
                                                  
                                                     <%
                                                    }}%>
                                                    <input type="button" name="removeFrind" value="Remove Friends" onclick="copy1()"/>
                                                  </select>
                                                </td>
                                            </tr>
                                              <tr><td><input type="checkbox" name="Relatives" value="Party Hun"><a id="myHeader2"  >Party Hub</a> 
                                                        
                                                    <select id="selectValuecustom1"  name="friendsList" >
                                                    <%
                                                    HashSet shrlist12 = com.DAO.ListDAO.getListForSharedSchoolCustom(Integer.parseInt(USerRegID),(String) session.getAttribute("useremailid"));
                                                    Iterator itr1234 = shrlist1.iterator();
                                                     String nameemail11=null;
                                                    while (itr1234.hasNext()) {
                                                    com.DAO.PostFB fbstacust1 = (com.DAO.PostFB) itr1234.next();
                                                    if(fbstacust1.getGroupList().contains("Party Hub") && !fbstacust1.getEmailID().equals((String) session.getAttribute("useremailid"))){
                                                    nameemail11=fbstacust1.getUsername()+" "+fbstacust1.getEmailID()+" ";
                                                   %>
                                                  <option value="<%=nameemail1%>"><%=fbstacust1.getUsername()%></option>
                                                  
                                                     <%
                                                          
                                                    }}%>
                                                  </select>
                                                <input type="checkbox" name="Relatives" value="Fitness Club"><a id="myHeader2"  >Fitness Club</a> 
                                                        
                                                    <select id="selectValuecustom1"  name="friendsList" >
                                                    <%
                                                    HashSet shrlist123 = com.DAO.ListDAO.getListForSharedSchoolCustom(Integer.parseInt(USerRegID),(String) session.getAttribute("useremailid"));
                                                    Iterator itr12345 = shrlist123.iterator();
                                                     String nameemail111=null;
                                                    while (itr12345.hasNext()) {
                                                    com.DAO.PostFB fbstacust1 = (com.DAO.PostFB) itr12345.next();
                                                    if(fbstacust1.getGroupList().contains("Fitness Club") && !fbstacust1.getEmailID().equals((String) session.getAttribute("useremailid"))){
                                                    nameemail11=fbstacust1.getUsername()+" "+fbstacust1.getEmailID()+" ";
                                                   %>
                                                  <option value="<%=nameemail1%>"><%=fbstacust1.getUsername()%></option>
                                                  
                                                     <%
                                                          
                                                    }}%>
                                                  </select>
                                                
                                                </td>
                                                        <td> <input type="checkbox" name="Relatives" value="Class 12" ><a id="myHeader2"  >Class 12</a>
                                                           <select id="selectValuecustom1"  name="friendsList" >
                                                    <%
                                                    HashSet shrlist1234 = com.DAO.ListDAO.getListForSharedSchoolCustom(Integer.parseInt(USerRegID),(String) session.getAttribute("useremailid"));
                                                    Iterator itr123456 = shrlist1.iterator();
                                                     String nameemail112=null;
                                                    while (itr123456.hasNext()) {
                                                    com.DAO.PostFB fbstacust1 = (com.DAO.PostFB) itr123456.next();
                                                    if(fbstacust1.getGroupList().contains("Class 12") && !fbstacust1.getEmailID().equals((String) session.getAttribute("useremailid"))){
                                                    nameemail11=fbstacust1.getUsername()+" "+fbstacust1.getEmailID()+" ";
                                                   %>
                                                  <option value="<%=nameemail1%>"><%=fbstacust1.getUsername()%></option>
                                                  
                                                     <%
                                                          
                                                    }}%>
                                                  </select>
                                                         <input type="checkbox" name="Relatives" value="Sports"><a id="myHeader2"  >Sports</a> 
                                                        
                                                    <select id="selectValuecustom1"  name="friendsList" >
                                                    <%
                                                    HashSet shrlist1236 = com.DAO.ListDAO.getListForSharedSchoolCustom(Integer.parseInt(USerRegID),(String) session.getAttribute("useremailid"));
                                                    Iterator itr123457 = shrlist1236.iterator();
                                                     String nameemail1116=null;
                                                    while (itr123457.hasNext()) {
                                                    com.DAO.PostFB fbstacust1 = (com.DAO.PostFB) itr123457.next();
                                                    if(fbstacust1.getGroupList().contains("Sports") && !fbstacust1.getEmailID().equals((String) session.getAttribute("useremailid"))){
                                                    nameemail1116=fbstacust1.getUsername()+" "+fbstacust1.getEmailID()+" ";
                                                   %>
                                                  <option value="<%=nameemail1%>"><%=fbstacust1.getUsername()%></option>
                                                  
                                                     <%
                                                          
                                                    }}%>
                                                  </select>
                                                        </td></tr>
                                    </table>                    
                                </form>
                                            </div>
                                            <%}else{%>

                                            <div class="newboxes" id="newboxes1" >
                                               
                                                <form action="poststatus.jsp" method="post" name="form1" onsubmit="javascript:return posttextvalidations();">
                                                    <textarea cols="51" rows="3" id="sttext"  name="status"></textarea>
                                                    <select   name="display" >
                                                        <option value="public" selected>Public</option>
                                                        <option value="private">Private</option>
                                                        <option value="custom">Custom</option>
                                                        <!--<option value="friend">Friends</option>-->
                                                    </select>
                                                    <input type="submit" name="submit" value="Post"/>
                                                </form>
                                               
                                            </div>
                                            <%}%>
                                            <div class="newboxes" id="newboxes2" style=" display: none;  background-color: RGB(5,155,205) ;">
                                                <form  action="postimage" method="post"  enctype="multipart/form-data" onsubmit="javascript:return posttextwithimagevalidations();">
                                                    <table style="border: 1px solid blue;"><tr><td>
                                                    <div style="background-color: black;height:100px;width: 150px; ">
                                                        <img id="blah" src="#" alt="your image" />
                                                    </div>
                                                    <input type='file' name="image" id="postimage"  onchange="readURL(this);" />
                                                    </td><td>
                                                    <textarea cols="51" rows="3" id="statustext"  name="status"/></textarea>
                                                    <select   name="display">
                                                        <option value="public" selected>Public</option>
                                                        <option value="private">Private</option>
<!--                                                        <option value="friend">Friends</option>-->
                                                    </select>
                                                    <input type="submit"  value="POST"/>
                                                            </td></tr>
                                                    </table>
                                                </form>

                                            </div>
                                        </td>
                                        <td width="20%;" rowspan="2" ><div class="col-md-4"style="margin-top: -3800px;">
                                <%  if (!fb.getImage_path().trim().isEmpty() || fb.getImage_path().trim() != null) {
                                %>
                                <img src="<%=fb.getImage_path()%>" style="margin-top: -841px;" alt="Profile Image" height="100px" width="600%;" />
                                <%} else {%>
                                <img src="images/placeholder-person.png%>" style="margin-top: -841px" alt="Profile Image" height="100px" width="600%;" />
                                <%}%>
                                <br>
                                    <center style="margin-top: -372px;" ><b><%=uname%></b></center>
                                    <br>
                                        
                                            <table cellspacing="5" cellpadding="10">
                                         <tr  style="border: none;"><td>
                                                        <div style="width:200%;  float: left; background-color: #fff; padding: 5px;">
                                                            <a id="myHeader1" href="javascript:showonlyone('newboxes1');" >Update Status</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr  style="border: none;">
                                                    <td>
                                                        <div style=" width:200%; float: left; background-color: #fff; padding: 5px;">
                                                            <a id="myHeader2" href="javascript:showonlyone('newboxes2');" >Add Photo</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr  style="border: none;">
                                                    <td>
                                                        <div style="width:200%;  float: left; background-color: #fff; padding: 5px;">
                                                            <a id="myHeader1" href="privatewall.jsp" >Private Wall</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style=" width:200%; float: left; background-color: #fff; padding: 5px;">
                                                            <a id="myHeader2" href="Home.jsp" >Wall</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                   <tr>
                                                    <td>
                                                        <div style=" width:200%; float: left; background-color: #fff; padding: 5px;">
                                                            <a id="myHeader2" href="Home.jsp" >Group</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                   <tr>
                                                    <td>
                                                        <div style=" width:200%; float: left; background-color: #fff; padding: 5px;">
                                                            <a id="myHeader2" href="Home.jsp" >Wall</a>
                                                            <form action="group.jsp" method="post">
                                                  <table>
                                                        <tr> <td>
                                                                <input type="checkbox" name="school" value="college"><a id="myHeader2"  >College</a></td></tr><tr>
                                                            <tr> <td>
                                                                <input type="checkbox" name="school" value="Party Hub" style="margin-left: 30px"><a id="myHeader2"  >Party Hub</a></td></tr>
<tr> <td>
                                                                <input type="checkbox" name="school" value="Fitness Club" style="margin-left: 30px"><a id="myHeader2"  >Fitness Club</a></td></tr>

                                                                    <td><input type="checkbox" name="school" value="school"><a id="myHeader2"  >School</a></td></tr>
                                                   
                                                   <tr> <td>
                                                              <input type="checkbox" name="school" value="Class 12" style="margin-left: 30px"><a id="myHeader2"  >Class 12</a></td></tr> 
                                                   <tr> <td>
                                                              <input type="checkbox" name="school" value="Sports" style="margin-left: 30px"><a id="myHeader2"  >Sports</a></td></tr>   
                                                   <tr><td> <input type="submit" name="submit" value="Group" style="margin-bottom: 50px"/></td></tr></table>
                                                </form>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        </td>
                                        </tr>
                                        <tr >
                                            <td>
                                                <table style="width: 800px;">
                                                    <%
                                                          
                                                        List statuslist = com.DAO.ListDAO.getListForStatus(Integer.parseInt(USerRegID),(String)session.getAttribute("useremailid"));
                                                        Iterator itr = statuslist.iterator();
                                                        while (itr.hasNext()) {
                                                            com.DAO.PostFB fbstatus = (com.DAO.PostFB) itr.next();
                                                    %>
                                                    <tr >
                                                        <td bgcolor="#fff">
                                                            <table  bgcolor="#d3d3d3" style="width: 820px;border: 1px solid blue;">
                                                                <tr >
                                                                    <td>Posted By <b><a style="color:goldenrod" href="friendProfile.jsp?friendId=<%= fbstatus.getSender_id()%>" target="_blank">
                                                                                <%=fbstatus.getUsername()%></a></b></td>
                                                                </tr>
                                                                <%if (!fbstatus.getImage_path().trim().equals("noimage")) {%>
                                                                <tr>
                                                                    <td><img src="<%=fbstatus.getImage_path()%>" alt="Post Image" width="250px" height="150px"/></td>
                                                                </tr>
                                                                <%}%>
                                                                <tr>
                                                                    <td><%=fbstatus.getDescription()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <td ><div id="<%=fbstatus.getPost_id()%>" style="color:black;background-color:white;border:1px solid black;display:none;width:80%;height:80px;">
                                                                            <from action="sharepost"  >
                                                                                <input type="hidden" id="postid<%=fbstatus.getPost_id()%>" name="postid" value="<%=fbstatus.getPost_id()%>"/>
                                                                                <input type="hidden" id="registrationid<%=fbstatus.getPost_id()%>" name="registrationid" value="<%=USerRegID%>" />
                                                                                <table border="0" style="border: 1px solid blue" bgcolor="#d3d3d3" style="width: 800px;">
                                                                                    <tr>
                                                                                        <td>Description</td>
                                                                                        <td><input type="text" id="description<%=fbstatus.getPost_id()%>" name="description" style="width:98%;" /></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td><a href="#" onclick="document.getElementById('<%=fbstatus.getPost_id()%>').style.display = 'none';">Close</a></td>
                                                                                        <td><input type="submit" onclick="saveSharePost('<%=fbstatus.getPost_id()%>');"   value="Share" /></td>
                                                                                    </tr>
                                                                                </table>

                                                                            </from>
                                                                        </div>
                                                                        <font > <a color="white" href="#" onclick="document.getElementById('<%=fbstatus.getPost_id()%>').style.display = 'block';">Share Post</a></font>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>    
                                                    <%
                                                        }
                                                    %>


                                                    <tr >
                                                        <td>
                                                            <table cellpadding="10" cellspacing="5" style="width:800px;" bgcolor="#d3d3d3">
                                                                <%
                                                                    List shrlist = com.DAO.ListDAO.getListForShared(Integer.parseInt(USerRegID));
                                                                    Iterator itr1 = shrlist.iterator();
                                                                    while (itr1.hasNext()) {
                                                                        com.DAO.PostFB fbsta = (com.DAO.PostFB) itr1.next();
                                                                %>
                                                                <tr>
                                                                    <td >
                                                                        <table  style="width:800px; border: 1px solid blue;"  >
                                                                            <tr >
                                                                                <td>Shared By <b><%=fbsta.getUsername()%></b></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><%=fbsta.getDescription()%></td>
                                                                            </tr>
                                                                            <%if (!fbsta.getImage_path().trim().equals("noimage")) {%>
                                                                            <tr>
                                                                                <td><img src="<%=fbsta.getImage_path()%>" alt="Post Image" width="250px" height="150px"/></td>
                                                                            </tr>
                                                                            <%}%>
                                                                            <tr>
                                                                                <td><%=fbsta.getAddress() %></td>
                                                                            </tr>
                                                                            

                                                                        </table>
                                                                    </td>
                                                                </tr>    
                                                                <%
                                                                    }
                                                                %>
                                                            </table>
                                                        </td>
                                                    </tr>


                                                </table>
                                            </td>
                                        </tr>

                                        </table>

        </div>

      </div>
      <!-- /.row -->

     

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
