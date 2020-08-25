<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.Train"%>
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


	<div  class="container-fluid" style="padding: 0px; margin: 0px;">
	
	
	
	<div class="container-fluid">
	<!-- Enter the Train No Start -->
	<div class="col-sm-12">
    <div class="col-sm-offset-1 col-sm-4 well" style="background-color:rgba(0, 0, 0, 0.7); color:#fff; margin: 2% 10%; max-width: 400px; min-width: 330px;">
    <div class="text-center">
    	<img alt="Train.jpg" src="Train.png" width="100" height="100">
    </div>
    	
	    <h2 class="text-center">Train Search</h2>
	    <br>
	    <form action="trainno" method="POST">
	        <div class="form-group">
	            <label for="tno">TrainNo:</label>
	            <input type="text" class="form-control" id="tno" placeholder="Enter train number" name="trainNo">
	        </div>
	        <div class="text-center">
	        <button type="submit" class="btn btn-lg btn-danger">Submit</button>
	    	</div>
	    </form>
    </div>
    <!-- Enter the Train No End -->	
    
    
	


<%
	if(request.getAttribute("invalid") != null)
	{
%>
	<div class="col-sm-offset-1 col-sm-5 well text-center" style="background-color:rgba(0, 0, 0, 0.7); color:rgba(255, 255, 255, 1);">
	    <br>
	    <div class="col-sm-offset-1 col-sm-4 well text-center" style="background-color:rgba(255, 255, 255, 1); color:rgba(81, 81, 81, 1);">
	    <h1><i class="fas fa-subway"></i></h1>
	    </div>
	    <div class="col-sm-7 text-center">
	    <h2><%= request.getAttribute("invalid") %></h2>
	    <label for="tno">Please Enter Again</label>
	    </div>
	    <br>
    </div>
<%
	request.removeAttribute("invalid");	
	}
%>
	




<%
    if(request.getAttribute("train") != null)
    {
    	Train train = (Train) request.getAttribute("train");
%>

<!-- START DISPLAYING THE TRAIN DETAILS -->
	<div class="col-sm-offset-1 col-sm-5 well" style="background-color:rgba(0, 0, 0, 0.7); color:rgba(255, 255, 255, 1); margin: 2% 10%; max-width: 500px; min-width: 330px;">
	<h2 class="text-center">TRAIN DETAILS</h2>
		<table class="table">
		<tbody>
		<tr>
		<th>Train Number</th>
		<td><%= train.getTrainNo() %></td>
		</tr>
		
		<tr>
		<th>Train Name</th>
		<td><%= train.getTrainName() %></td>
		</tr>
		
		<tr>
		<th>From Station</th>
		<td><%= train.getFromStation() %></td>
		</tr>
		
		<tr>
		<th>To Station</th>
		<td><%= train.getToStation() %></td>
		</tr>
				
		<tr>
		<th>Availability</th>
		<td><%= train.getAvail() %></td>
		</tr>
		
		<tr>
		<th>Distance</th>
		<td><%= train.getDist() %></td>
		</tr>
				
		</tbody>
		</table>

	</div>
	
	
<!-- END DISPLAYING THE TRAIN DETAILS -->
</div>
<%
	request.removeAttribute("train");
    }
%>
</div>
</div>

<br>


<div class="container-fluid" style="padding: 0px; margin: 0px;">
<br><br><br><br><br><br>

	<!-- Include Footer Start -->
 <%@ include file="footer.jsp" %>
 	<!-- Include Footer End -->


</div>


	

</body>
</html>