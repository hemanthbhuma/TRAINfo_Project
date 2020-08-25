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


<%
	String aName = (String) session.getAttribute("aname");
    if(aName.equals("") || aName==null)
    {
    	request.setAttribute("msg", "Please Login First");
    	request.getRequestDispatcher("login.jsp").include(request, response);
    	return;
    }
%>

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
				  	<li><a href="aedittrainfare"><i class="fas fa-dollar-sign"></i> Fare</a>
                    <li><a href="aaddtrain"><i class="fas fa-plus-circle"></i> Add Train</a></li>
                    <li><a href="aremovetrain"><i class="fas fa-minus-circle"></i> Remove Train</a></li>
                    <li><a href="aedittrain"><i class="fas fa-edit"></i> Update Train</a></li>
                    <li><a href="apro"><i class="fas fa-user-shield"></i> View Profile</a></li>
                    <li><a href="alogout"><i class="fas fa-sign-out-alt"></i> Log Out</a></li>
                  </ul>
				</div>
        </div>
    </nav>
      
      <!-- JUMBOTRON START -->
<div class="jumbotron container-fluid text-center" style="background-color:rgba(244, 81, 30, 0.9); color:rgba(255, 255, 255, 1); margin:0px;">
  <br>
  <h1><i class="fas fa-subway"></i> TRAINfo</h1>       
  <p>A simplified portal for all Train Info</p>    
</div>
<br>
	  <!-- JUMBOTRON END -->   

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


</body>
</html>