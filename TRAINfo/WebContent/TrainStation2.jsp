<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.*, java.util.*"%>
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

<!-- Custom Style Sheet -->
	<link rel="stylesheet" href="/TRAINfo/WebContent/style.css">
</head>
<body>

<%
	String uName = (String) session.getAttribute("uname");
    if(uName.equals("") || uName==null)
    {
    	request.getRequestDispatcher("login.html").include(request, response);
    	out.println("Please Login First");
    	return;
    }
%>

<% 
	Train t = (Train) request.getAttribute("train");
	ArrayList<TrainFare> trainfares = (ArrayList<TrainFare>) request.getAttribute("trainfares");
%>

	<div class="container table-responsive-sm">
	<h2 class="text-center">TRAIN FARE DETAILS</h2><hr>
	
	<div class="col-sm-4 well" style="background-color:#f1c700; color:#fff;">
	<h2 class="text-center">First Class</h2>
		<table class="table">
		<tbody>
		<tr>
		<th>Train Number</th>
		<td><%= t.getTrainNo() %></td>
		</tr>
		
		<tr>
		<th>Train Name</th>
		<td><%= t.getTrainName() %></td>
		</tr>
		
		<tr>
		<th>From</th>
		<td><%= t.getFromStation() %></td>
		</tr>
		
		<tr>
		<th>To</th>
		<td><%= t.getToStation() %></td>
		</tr>
		
		<tr>
		<th>Availability</th>
		<td><%= t.getAvail() %></td>
		</tr>
		
		<tr>
		<th>Distance (KM)</th>
		<td><%= t.getDist() %></td>
		</tr>
		
		<tr>
		<th>Per KM (Rs.)</th>
		<td><%= trainfares.get(0).getFare() %></td>
		</tr>
		
		<tr>
		<th>Per Ticket (Rs.)</th>
		<td><%= t.getDist() %> X <%= trainfares.get(0).getFare() %> = <%= new Formatter().format("%.2f", t.getDist() * trainfares.get(0).getFare())  %></td>
		</tr>
		
		</tbody>		
		</table>
		
		<form action="payment" method="POST">
			<div class="form-group">
	            <label for="user">No.Of Tickets :</label>
	            <input type="number" class="form-control" id="user" placeholder="Enter the No.Of Tickets" min="1" max="100" name="noOfTickets">
	         </div>

              <input type="hidden" class="form-control" name="tclass" value="<%= trainfares.get(0).getTclass() %>">
           	  <input type="hidden" class="form-control" name="fare" value="<%= trainfares.get(0).getFare() %>" >
        	  <input type="hidden" class="form-control" name="tno" value="<%= t.getTrainNo() %>" >
	         
	         <div class="form-group text-center"><br>
			 <button type="submit" class="btn btn-danger">Book 1st Class</button>
			 </div>
		</form>
		
	</div>
	
	
	<div class="col-sm-4 well" style="background-color:#9e9e9e; color:#fff;">
	<h2 class="text-center">Second Class</h2>
		<table class="table">
		<tbody>
		<tr>
		<th>Train Number</th>
		<td><%= t.getTrainNo() %></td>
		</tr>
		
		<tr>
		<th>Train Name</th>
		<td><%= t.getTrainName() %></td>
		</tr>
		
		<tr>
		<th>From</th>
		<td><%= t.getFromStation() %></td>
		</tr>
		
		<tr>
		<th>To</th>
		<td><%= t.getToStation() %></td>
		</tr>
		
		<tr>
		<th>Availability</th>
		<td><%= t.getAvail() %></td>
		</tr>
		
		<tr>
		<th>Distance (KM)</th>
		<td><%= t.getDist() %></td>
		</tr>
		
		<tr>
		<th>Per KM (Rs.)</th>
		<td><%= trainfares.get(1).getFare() %></td>
		</tr>
		
		<tr>
		<th>Per Ticket (Rs.)</th>
		<td><%= t.getDist() %> X <%= trainfares.get(1).getFare() %> = <%= new Formatter().format("%.2f", t.getDist() * trainfares.get(1).getFare()) %></td>
		</tr>

		</tbody>
					
		</table>
		
		<form action="payment" method="POST">
			<div class="form-group">
	            <label for="user">No.of Tickets :</label>
	            <input type="number" class="form-control" id="user" placeholder="Enter the No.Of Tickets" min="1" max="100" name="noOfTickets">
	         </div>

            <input type="hidden" name="tclass" value="<%= trainfares.get(1).getTclass() %>">
            <input type="hidden" name="fare" value="<%= trainfares.get(1).getFare() %>" >
            <input type="hidden" name="tno" value="<%= t.getTrainNo() %>" >
	         
	         <div class="form-group text-center"><br>
             <button type="submit" class="btn btn-danger">Book 2nd Class</button>
             </div>
		</form>
			
	</div>
	
	
	<div class="col-sm-4 well" style="background-color:#AD8A56; color:#fff;">
	<h2 class="text-center">Third Class</h2>
		<table class="table">
		<tbody>
		<tr>
		<th>Train Number</th>
		<td><%= t.getTrainNo() %></td>
		</tr>
		
		<tr>
		<th>Train Name</th>
		<td><%= t.getTrainName() %></td>
		</tr>
		
		<tr>
		<th>From</th>
		<td><%= t.getFromStation() %></td>
		</tr>
		
		<tr>
		<th>To</th>
		<td><%= t.getToStation() %></td>
		</tr>
		
		<tr>
		<th>Availability</th>
		<td><%= t.getAvail() %></td>
		</tr>
		
		<tr>
		<th>Distance (KM)</th>
		<td><%= t.getDist() %></td>
		</tr>
			
		<tr>
		<th>Per KM (Rs.)</th>
		<td><%= trainfares.get(2).getFare() %></td>
		</tr>
		
		<tr>
		<th>Per Ticker (Rs.)</th>
		<td><%= t.getDist() %> X <%= trainfares.get(2).getFare() %> = <%= new Formatter().format("%.2f", t.getDist() * trainfares.get(2).getFare()) %></td>
		</tr>
		
		</tbody>				
		</table>
		
		<form action="payment" method="POST">
			<div class="form-group">
	            <label for="user">No.Of Tickets :</label>
	            <input type="number" class="form-control" id="user" placeholder="Enter the No.Of Tickets" min="1" max="100" name="noOfTickets">
	         </div>
	         
	         <input type="hidden" name="tclass" value="<%= trainfares.get(2).getTclass() %>">
	         <input type="hidden" name="fare" value="<%= trainfares.get(2).getFare() %>" >
	         <input type="hidden" name="tno" value="<%= t.getTrainNo() %>" >
	            
	         <div class="form-group text-center"><br>
             <button type="submit" class="btn btn-danger">Book 3rd Class</button>
             </div>
		</form>
		
	</div>
	
	<br>
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