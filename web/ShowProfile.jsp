

<%@page import="com.DAO.PostFB"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
    <head profile="http://gmpg.org/xfn/11">
        <title>Facebook</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <meta http-equiv="imagetoolbar" content="no" />
        <link rel="stylesheet" href="styles/layout.css" type="text/css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
        <script src="JS/jquery.autocomplete.js"></script>
        <script>
            jQuery(function() {
                $("#name").autocomplete("list.jsp");
            });
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
        <style>
            article, aside, figure, footer, header, hgroup, 
            menu, nav, section { display: block; }
        </style>
    </head>
    <body id="top" bgcolor="#F0F0F0 ">

        <div class="wrapper">

            <header class="header">
                <div class="wrapper col1">
                    <div id="header">
                        <%
                            String uname = session.getAttribute("Username").toString();
                            PostFB  fb =(com.DAO.PostFB)session.getAttribute("profile");
                        %>

                        <br class="clear" />
                    </div>
                </div>
                <div class="wrapper col2">
                    <div id="topbar">
                        <div id="topnav">
                            <ul>
                                <li class="active"><a href="Home.jsp">Home</a></li>
                                <!--<li><a href="style-demo.html">Style Demo</a></li>
                                <li><a href="full-width.html">Full Width</a></li>-->
                                <li><a href="Profile.jsp">Profile</a>
                                    <!--<ul>
                                      <li><a href="#">Link 1</a></li>
                                      <li><a href="#">Link 2</a></li>
                                      <li><a href="#">Link 3</a></li>
                                    </ul>-->
                                </li>
                                <li><a href="index.html" >Log Out</a></li>

                                <!-- <li class="last"><a href="#">A Long Link Text</a></li>-->
                            </ul>
                            <ul><li><div style="float:right;position:absolute ;right:30%;top:30%; ">&nbsp;&nbsp;&nbsp;<%=uname%></div></li></ul>
                        </div>
                        <div id="search">
                            <form action="ShowProfile.jsp" method="post">
                                <fieldset>
                                    <legend>Site Search</legend>
                                    <input type="text" id="name"  name="country" class="input_text"/>
                                    <input type="submit" name="go" id="go" value="Search" />
                                </fieldset>
                            </form>
                            <!--<form action="" method="">
                                <fieldset>
                                    <input type="text" id="name"  name="country" class="input_text"/>
                                    <input type="submit" value="Search"/>
                                     </fieldset>
                            </form>-->
                        </div>

                        <br class="clear" />
                    </div>
                </div>
            </header><!-- .header-->
            <div class="middle">

                <div class="container">
                    <table style="height:600px;">
                        <tr> <td width="20%;" rowspan="2">
                                <img src="<%=fb.getImage_path()%>" alt="Profile Image" height="100px" width="100%;" />
                                <br>
                                    <center><b><%=uname%></b></center>
                                <br>
                                <div  class="left">
                                    <table>
                                        <tr><td>
                                                <div style="width:90%;  float: left;border: 1px solid blue; background-color: #fff; padding: 5px;">
                                                    <a id="myHeader1" href="javascript:showonlyone('newboxes1');" >Update Status</a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style=" width:90%; float: left;border: 1px solid blue; background-color: #fff; padding: 5px;">
                                                    <a id="myHeader2" href="javascript:showonlyone('newboxes2');" >Add Photo</a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="width:90%;  float: left;border: 1px solid blue; background-color: #fff; padding: 5px;">
                                                    <a id="myHeader1" href="privatewall.jsp" >Private Wall</a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style=" width:90%; float: left;border: 1px solid blue; background-color: #fff; padding: 5px;">
                                                    <a id="myHeader2" href="Home.jsp" >Wall</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                            <td>
                                <div class="newboxes" id="newboxes1" >
                                    <form action="poststatus.jsp" method="post" name="form1">
                                        <textarea cols="51" rows="3" id="text"  name="status"></textarea>
                                        <input type="submit" name="submit" value="POST"/>
                                    </form>
                                </div>

                                <div class="newboxes" id="newboxes2" style=" display: none;  background-color: #fff ;">
                                    <form method="post" name="image">
                                        <input type="file" />
                                        <input type="submit" name="image" value="POST" />
                                    </form>

                                </div>
                            </td>
                        </tr>
                        <tr >
                            <td width="100%">
                               
                                                        <center>
                                                            <div >
                                                                <table border="1" style="width:100%">
                                                                    <tr>
                                                                        <th style="width:20%;"
                                                                            ></th>
                                                                        <th style="width:80%;">About</th>



                                                                    </tr>

                                                                    <%
                                                                        Blob image = null;

                                                                        byte[] imgData = null;

                                                                        try {
                                                                            String name = request.getParameter("country");
                                                                            Connection con = com.db.Connect.dbConnect();
                                                                            String[] username = name.split(" ");
                                                                            String query = "select registration.registration_id,contact_no,address,image_path,first_name"
                                                                                    + " ,last_name,email_id"
                                                                                    + " from profile,registration where "
                                                                                    + " profile.registration_id=registration.registration_id"
                                                                                    + " and  first_name='" + username[0] + "' and last_name='" + username[1] + "' group by registration.registration_id";
                                                                            System.out.print(query);
                                                                            PreparedStatement pstmt = con.prepareStatement(query);
                                                                            ResultSet resultset = pstmt.executeQuery();
                                                                            while (resultset.next()) {


                                                                    %>

                                                                    <tr>
                                                                        <td >
                                                                            <div style=""><img src="<%=resultset.getString("image_path")%>" alt="Profile Image" height="80px" width="100%;" /></div>  
                                                                                                                              <!--<a href="ProductDesc.jsp?Image=<%=resultset.getString("image_path")%>"></a>-->  

                                                                        </td>
                                                                                                                              <td style="color:blueviolet"><b><a style="color:goldenrod" href="friendProfile.jsp?friendId=<%= resultset.getString("registration.registration_id")%>"> <%= resultset.getString("first_name")%> 
                                                                                <%= resultset.getString("last_name")%> </a></b><br>
                                                                        Email :- <%= resultset.getString("email_id")%> <br>
                                                                        Contact :- <%= resultset.getString("contact_no")%> <br>
                                                                        Current Address :- <%= resultset.getString("address")%> 

                                                                    </tr>
                                                                    <% }
                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        }















                                                                    %>
                                                                </table>
                                                            </div><!--loginform-->
                                                        </center>
                                          
                            </td>
                        </tr>
                    </table>


                </div>

            </div><!-- .container-->


        </div><!-- .middle-->

        </div>


        <footer class="footer">
            <strong>Footer:</strong> 
        </footer><!-- .footer -->

    </body>
</html>