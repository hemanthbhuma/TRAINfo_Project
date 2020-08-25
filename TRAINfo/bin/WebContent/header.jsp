<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>TRAINfo</title>

    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Free Icons from FontAwesome.com -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">

</head>
<body>

	<!-- NAV BAR START -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
  	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
   		<span class="icon-bar"></span>
   		<span class="icon-bar"></span>
   		<span class="icon-bar"></span>
     	</button>
           <a class="navbar-brand" href="http://localhost:8082/TRAINfo/"><b><i class="fas fa-subway"></i> TRAINfo</b></a>
		<div class="navbar-collapse collapse">
           <ul class="nav navbar-nav navbar-right">
              <li><a href="index.html"><i class="fas fa-home"></i> Home</a></li>
              <li><a href="Register.jsp"><i class="fas fa-user-plus"></i> Sign Up</a></li>
              <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Sign In</a></li>
           </ul>
		</div>
    </div>
</nav>
	<!-- NAV BAR END -->


	<!-- JUMBOTRON START -->
<div class="jumbotron container-fluid text-center" style="background-color:rgba(244, 81, 30, 0.9); color:rgba(255, 255, 255, 1); margin:0px;">
  <br>
  
	  <%
	  	 if(request.getAttribute("msg")=="registration")
	  	 {
	   %>
    <h1><i class="fas fa-user"></i> User Registration</h1>
    <p>Please enter the following details to finish the Registration Process</p>
	  <%
	  	request.removeAttribute("msg");
	  	}
	  	else
	  	{
	   %>
    <h1><i class="fas fa-subway"></i> TRAINfo</h1>       
    <p>A simplified portal for all Train Info</p> 
      <%
    	}
       %>
   
</div>
	<!-- JUMBOTRON END -->   
        

</body>
</html>