<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>TRAINfo</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    
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
 	
 	<!-- Include Header Start -->
 <%@ include file="header.jsp" %>
 	<!-- Include Header End -->
 	
 	
 	<!-- Include MSG Start -->     
<%
	if(request.getAttribute("msg")!=null)
	{
%>
<div class="container">
	<br><h1 class="text-center"> <%= request.getAttribute("msg")  %></h1><br>
</div>
<%
	}
%>
    <!-- Include MSG End -->
    
    
        
    <div class="container-fluid">
       <br>  
 
 
<!-- Login Form Start -->   
       <div class="container-fluid col-sm-offset-1 col-sm-5">
        <h1 class="text-center">User Login</h1><br>
        <form class="form-horizontal" action="login" method="POST">
          <div class="form-group">
            <label class="control-label col-sm-2" for="user">Username:</label>
            <div class="col-sm-8">
              <input type="text" class="form-control  input-lg" id="user" placeholder="Enter username" name="username">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="pwd">Password:</label>
            <div class="col-sm-8">          
              <input type="password" class="form-control input-lg" id="pwd" placeholder="Enter password" name="password">
            </div>
          </div>
          <div class="form-group text-center">        
              <div class="checkbox">
                <label><input type="checkbox" name="remember"> Remember me</label>
              </div>
              <br>       
              <p align="center">      
              <button type="submit" class="btn btn-danger">Login</button>
              <button type="reset" class="btn btn-info">Reset</button><br><br>
              <a href="Register.jsp">Not yet Registred? Click here</a>
              </p>
          </div>
        </form>
       </div>
<!-- Login Form End -->


<!-- Admin Login Form Start -->   
       <div class="container-fluid col-sm-5">
        <h1 class="text-center">Admin Login</h1><br>
        <form class="form-horizontal" action="alogin" method="POST">
          <div class="form-group">
            <label class="control-label col-sm-2" for="user">Username:</label>
            <div class="col-sm-8">
              <input type="text" class="form-control  input-lg" id="user" placeholder="Enter username" name="adminname">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="pwd">Password:</label>
            <div class="col-sm-8">          
              <input type="password" class="form-control input-lg" id="pwd" placeholder="Enter password" name="password">
            </div>
          </div>
          <div class="form-group text-center">        
              <div class="checkbox">
                <label><input type="checkbox" name="remember"> Remember me</label>
              </div>
              <br>       
              <button type="submit" class="btn btn-danger">Login</button>
              <a href="Register.html" class="btn btn-info">Reset</a>
          </div>
        </form>
       </div>
<!-- Admin Login Form End -->


	</div>
	<br>


<div class="container-fluid">
<!-- About Us Start -->
<br>
       <div class="container-fluid col-sm-offset-2 col-sm-8" style="background-color:rgba(0, 0, 0, 0.7); color:#fff;">      
        <div class="container-fluid">
          <h1>About Us</h1>
          <h3>Revanth Vermareddy</h3>
                <p>This is about my project</p>
                <p>This is my first project in bootstrap hope u all like my project</p><br>
             <div class="container-fluid col-sm-offset-1 col-sm-10" style="background-color:rgba(255, 187, 0, 0.8); color:#fff;"><br></div>
        </div> 
       </div>
<!-- About Us End --> 

</div>


<br><br><br><br>  




     
    
    
    <!-- Include Footer Start -->
 <%@ include file="footer.jsp" %>
 	<!-- Include Footer End -->


</body>
</html>