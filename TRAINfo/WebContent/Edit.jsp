<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>TRAINfo</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<%
	String uName = (String) session.getAttribute("uname");
    if(uName.equals("") || uName==null)
    {
    	request.getRequestDispatcher("login.jsp").include(request, response);
    	out.println("Please Login First");
    	return;
    }
%>

<%	User u = (User) request.getAttribute("user"); %>

	

	<div class="container-fluid" style="margin: 2% auto; max-width: 800px; min-width: 330px;">
	<div class="col-sm-8" style="background-color:rgba(0, 0, 0, 0.7); color:#fff; margin: 0px 16%; padding: 20px">
	<h2 class="text-center">	<% out.println("Edit Your Profile " + uName ); %>	</h2>

	<!-- START OF FORM -->
	<form action="update" method="POST" style="margin: 2% 5%"><br>
	
	<div class="form-group">
		<label for="fname">Firstname :</label>
		<input type="text" class="form-control" id="fname" value= "<%= u.getfName() %>"  name="fname">
	</div>
	
	<div class="form-group">
		<label for="Lname">Lastname :</label>
		<input type="text" class="form-control" id="lname" value="<%= u.getlName() %>" name="lname">
	</div>
	
	<div class="form-group">
		<label for="address">Address :</label>
		<input type="text" class="form-control" id="address" value="<%= u.getaddr() %>" name="address">
	</div>
	
	<div class="form-group">
		<label for="ph">Phone No :</label>
		<input type="text" class="form-control" id="ph" value="<%= u.getphno() %>" name="phoneno">
	</div>
	
	<div class="form-group">
		<label for="email">Mail ID :</label>
		<input type="text" class="form-control" id="email" value="<%= u.getmid() %>" name="mailid">
	</div>
	
	<div class="form-group text-center"><br>
		<button type="submit" class="btn btn-danger">UPDATE</button>
	</div>
	
	</form>
	<!-- END OF FORM -->
	
	</div>
	</div>


<div class="container-fluid" style="padding: 0px; margin: 0px;">
<br><br><br><br><br><br>

	<!-- Include Footer Start -->
 <%@ include file="footer.jsp" %>
 	<!-- Include Footer End -->


</div>


	
</body>
</html>