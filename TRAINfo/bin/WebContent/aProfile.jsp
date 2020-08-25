<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.Admin"%>
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

	<!-- Free Icons from FontAwesome.com -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
	
</head>
<body>

<%
	String aName = (String) session.getAttribute("aname");
    if(aName.equals("") || aName==null)
    {
    	request.getRequestDispatcher("login.jsp").include(request, response);
    	out.println("Please Login First");
    	return;
    }
%>

<%	Admin a = (Admin) request.getAttribute("admin"); %>	

	
<!-- Admin details Start -->
	<div class="container-fluid">
		<div class="col-sm-offset-1 col-sm-10 well" style="background-color:rgba(0, 0, 0, 0.7); color:#fff;">
		<h2 class="text-center">Welcome to Your Profile <%= aName %></h2><br>
		
		<div class="container-fluid">
			<div class="col-sm-2 text-center">
					<h1><i class="fas fa-user-shield"></i></h1>		
			</div>
			<div class="col-sm-offset-1 col-sm-9 well" style="background-color:rgba(255, 255, 255, 1); color:rgba(81, 81, 81, 1); margin:0px;">
				<h3>First Name : <%= a.getfName() %></h3>
				<h3>Last Name : <%= a.getlName() %></h3>
			</div>
		</div>
		
		</div>
	</div>
	
<br><br>
<!-- Admin details End -->



<div class="container-fluid" style="padding: 0px; margin: 0px;">
<br><br><br><br><br><br>

	<!-- Include Footer Start -->
 <%@ include file="footer.jsp" %>
 	<!-- Include Footer End -->


</div>



</body>
</html>