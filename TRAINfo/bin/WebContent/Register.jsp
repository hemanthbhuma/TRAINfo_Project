<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TRAINfo</title>
</head>
<body>

	<!-- HEADER START -->
<%@ include file="header.jsp" %>
	<!-- HEADER END -->

	<!-- Include Error Start -->
<%
	if(request.getAttribute("regerror")!=null)
	{
%>	
<div class="container">
	<br><h2 class="text-center"><%= request.getAttribute("regerror") %></h2><br>
</div>
<%
	request.removeAttribute("regerror");
	}
%>
	<!-- Include Error End -->
		
	<!-- User registration Start --> 
<div class="container-fluid">
<br>

	<!-- ABOUT US START -->
<div class="container-fluid col-sm-offset-1 col-sm-4" style="background-color:rgba(0, 0, 0, 0.7); color:#fff;">      
      <div class="container-fluid">
      <h1>About Us</h1>
      <h3>Revanth Vermareddy</h3>
           <p>This is about my project</p>
           <p>This is my first project in bootstrap hope u all like my project</p><br>
           <div class="container-fluid col-sm-offset-1 col-sm-10" style="background-color:rgba(255, 187, 0, 0.8); color:#fff;"><br></div>
      </div> 
</div>
	<!-- ABOUT US END -->

	<!-- SIGN UP START -->
<div class="container-fluid col-sm-offset-1 col-sm-5">  
     
    <h1 class="text-center">Sign Up</h1><br>
        
    <form class="form-horizontal needs-validation" action="reg" method="POST" novalidate>
    
    <div class="form-group row">
	    <label for="username" class="col-sm-2 col-form-label">Username</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="username" placeholder="Username" name="username">
	    </div>
  	</div>
     
    <div class="form-group row">
	    <label for="password" class="col-sm-2 col-form-label">Password</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="password" placeholder="Password" name="password">
	    </div>
  	</div>
              
    <div class="form-group row">
	    <label for="repassword" class="col-sm-2 col-form-label">Repassword</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="repassword" placeholder="Repassword" name="repassword">
	    </div>
  	</div>
     
    <div class="form-group row">
	    <label for="email" class="col-sm-2 col-form-label">Email</label>
	    <div class="col-sm-10">
	      <input type="email" class="form-control" id="email" placeholder="Email" name="mailid">
	      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
	    </div>
  	</div>
    
    <div class="form-group row">
	    <label for="fname" class="col-sm-2 col-form-label">Firstname</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="fname" placeholder="Firstname" name="fname">
	    </div>
  	</div>
      
    <div class="form-group row">
	    <label for="lname" class="col-sm-2 col-form-label">Lastname</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="lname" placeholder="Lastname" name="lname">
	    </div>
  	</div>    
    
    <div class="form-group row">
	    <label for="address" class="col-sm-2 col-form-label">Address</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="address" placeholder="Address" name="address">
	    </div>
  	</div>
     
    <div class="form-group row">
	    <label for="phoneno" class="col-sm-2 col-form-label">Phone No</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="phoneno" placeholder="Phone No" name="phoneno">
	    </div>
  	</div>     
     
     <div class="form-group text-center">      
	    <div class="form-check col-sm-offset-1">
		    <input type="checkbox" class="form-check-input" id="check">
		    <label class="form-check-label" for="check"> Remember me</label>
	  	</div>
  
        <br>
       <div class="col-sm-offset-1">
	        <button type="submit" class="btn btn-lg btn-primary">Register</button> 
	        <button type="reset" class="btn btn-lg btn-danger"><i class="fas fa-undo"></i> Reset</button>      
       </div>
        
	</div>
          
    </form>
</div>
	<!-- SIGN UP END -->
	
</div>
	<!-- User registration End --> 
	
	<br>
	<br>
	
<div class="container-fluid" style="padding: 0px; margin: 0px;">

	<!-- FOOTER START -->
<%@ include file="footer.jsp" %>
	<!-- FOOTER END -->
	
</div>
	
</body>
</html>