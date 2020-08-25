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
	String aName = (String) session.getAttribute("aname");
    if(aName.equals("") || aName==null)
    {
    	request.getRequestDispatcher("login.jsp").include(request, response);
    	out.println("Please Login First");
    	return;
    }
%>


	<div  class="container-fluid ">
	
	
	<!-- Enter the Train No Start -->
	<div class="col-sm-12">
    <div class="col-sm-offset-1 col-sm-4 well" style="background-color:rgba(0, 0, 0, 0.7); color:#fff;">
    <div class="text-center">
    	<img alt="Train.jpg" src="Train.png" width="100" height="100">
    </div>
    	
	    <h2 class="text-center">Enter Train No</h2>
	    <br>
	    <form action="aaddtrain" method="POST">
	        <div class="form-group">
	            <label for="tno">Train No :</label>
	            <input type="text" class="form-control" id="tno" placeholder="Enter Train Number" name="addTrainNo" required>
	        </div>
	        <div class="form-group">
	            <label for="tn">Train Name :</label>
	            <input type="text" class="form-control" id="tn" placeholder="Enter Train Name" name="addTrainName" required>
	        </div>
	        <div class="form-group">
	            <label for="fs">From Station :</label>
	            <input type="text" class="form-control" id="fs" placeholder="Enter From Station" name="addFromStation" required>
	        </div>
	        <div class="form-group">
	            <label for="ts">To Station :</label>
	            <input type="text" class="form-control" id="ts" placeholder="Enter To Station" name="addToStation" required>
	        </div>
	        <div class="form-group">
	            <label for="avail">Avail :</label>
	            <input type="text" class="form-control" id="avail" placeholder="Enter Availability" name="addAvail" required>
	        </div>
	        <div class="form-group">
	            <label for="dist">Distance :</label>
	            <input type="text" class="form-control" id="dist" placeholder="Enter Distance" name="addDist" required>
	        </div>
	        <button type="submit" class="btn btn-lg btn-danger">Add</button>
	    </form>
    </div>
    <!-- Enter the Train No End -->	
    



<%
	if(request.getAttribute("exists") != null)
	{
%>
	<div class="col-sm-offset-1 col-sm-5 well text-center" style="background-color:rgba(0, 0, 0, 0.7); color:rgba(255, 255, 255, 1);">
	    <br>
	    <div class="col-sm-offset-1 col-sm-4 well text-center" style="background-color:rgba(255, 255, 255, 1); color:rgba(81, 81, 81, 1);">
	    <h1><i class="fas fa-subway"></i></h1>
	    </div>
	    <div class="col-sm-7 text-center">
	    <h2><%= request.getAttribute("exists") %></h2>
	    <label for="tno">Please Add Another Train</label>
	    </div>
	    <br>
    </div>
<%
	request.removeAttribute("exists");
	}
%>
	




<%
    if(request.getAttribute("train") != null)
    {
    	Train train = (Train) request.getAttribute("train");
%>

<!-- START DISPLAYING THE TRAIN DETAILS -->
	<div class="col-sm-offset-1 col-sm-5 well" style="background-color:rgba(0, 0, 0, 0.7); color:rgba(255, 255, 255, 1);">
	<h2 class="text-center">TRAIN ADDED SUCCESSFULLY</h2>
	<h3 class="text-center">Train Details</h3>
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
	


<%
	request.removeAttribute("train");
    }
%>
	</div>
	</div>
<!-- END DISPLAYING THE TRAIN DETAILS -->

<br>
<br>

<div class="container-fluid" style="padding: 0px; margin: 0px;">
<br><br><br><br><br><br>

	<!-- Include Footer Start -->
 <%@ include file="footer.jsp" %>
 	<!-- Include Footer End -->


</div>


	

</body>
</html>