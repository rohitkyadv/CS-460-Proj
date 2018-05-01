<html>
<head>
<link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
<meta charset=utf-8 />
<title>JS Bin</title>
<!--[if IE]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script>
    function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
              // var a= document.getElementById(blah).value();
//alert(a);
                reader.onload = function (e) {
                    $('#blah')
                        .attr('src', e.target.result)
                .width(150)
                        .height(200);
                };

               var name= reader.readAsDataURL(input.files[0]);
               alert("print name"+name);
            }
        }
</script>
<style>
  article, aside, figure, footer, header, hgroup, 
  menu, nav, section { display: block; }
</style>
</head>
<body>
  <form action="demoimagestore.jsp">
  <div style="background-color: black;height:200px;width: 150px; ">
    <img id="blah" src=""  alt="your image" />
    </div>
        <input type='file'name="name" onchange="readURL(this);" />
        <input type="submit" value="go">
        </form>
</body>
</html>