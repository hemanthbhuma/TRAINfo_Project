<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, bean.*, java.util.*"%>
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



<!-- Display if Updated Start -->
	<% if(request.getAttribute("updated") != null)
	   {
	%>
		<div class="container">
			<br><h1 class="text-center"> <%= request.getAttribute("updated")  %></h1><br>
		</div>
	<%
	   }
	%>
<!-- Display if Updated End -->


<!-- Displaying the TrainsFare Start -->
<%	ArrayList<TrainFare> trainfares = (ArrayList<TrainFare>) Arrays.asList((TrainFare[]) request.getAttribute("trainfares")); %>

	
<div class="container-fluid">

<div class="col-sm-12">
	<h2 class="text-center">	<% out.println("Edit Train Fare " + aName ); %>	</h2>
	
	<!-- START OF FORM -->
	<form class="form-horizontal text-center" action="aedittrainfare" method="POST"><br>
	<div class="container table-responsive">
	<table class="table table-hover table-condensed" width="1500">
	<thead>
		<tr>
		<th width="250">Class No</th>
		<th width="250">Class Type</th>
		<th width="250">Start Distance (in Kms.)</th>
		<th width="250">End Distance (in Kms.)</th>
		<th width="250">Total Distance (in Kms.)</th>
		<th width="250">Fare(in Rs./-)</th>
		</tr>
		</thead>
	<tbody>
	
	<!-- Showing all Trains -->
<%
	if(trainfares==null)
	{
%>
	<tr>
		<td colspan="6" align="center">Train Fares Not Updated</td>
	</tr>
<%
	}
	else
	{
		Iterator<TrainFare> it = trainfares.iterator();
		while(it.hasNext())
		{
			TrainFare tf = (TrainFare) it.next();
			//	Displaying Row wise the Train Details
%>
			<tr>
			<td align="center"><%= tf.getClass_no() %></td>
			<td align="center"><%= tf.getTclass() %></td>
			<td align="center"><%= tf.getStartdist() %></td>
			<td align="center"><%= tf.getEnddist() %></td>
			<td align="center"><%= tf.getTotdist() %></td>
			<td align="center"><%= tf.getFare() %></td>
			</tr>
<%
		}
	}
%>

	<tr>
		<td colspan="6" align="center">Update the Train Fare Details</td>
	</tr>
	
	<tr>
	<td width="250" align="center"><input type="text" class="form-control input" name="tclassno"></td>
	<td width="250" align="center"><input type="text" class="form-control input" name="tclass"></td>
	<td width="250" align="center"><input type="text" class="form-control input" name="startdist"></td>
	<td width="250" align="center"><input type="text" class="form-control input" name="enddist"></td>
	<td width="250" align="center"><input type="text" class="form-control input" name="totdist"></td>
	<td width="250" align="center"><input type="text" class="form-control input" name="fare"></td>
	</tr>
	</tbody>
	</table>
	</div>
	<div class="form-group text-center"><br>
		<button type="submit" class="btn btn-danger">UPDATE</button>
	</div>
	
	</form>
	<!-- END OF FORM -->
	
	</div>
<!-- Displaying the Trains End -->


</div>
	



<div class="container-fluid" style="padding: 0px; margin: 0px;">
<br><br><br><br><br><br>

	<!-- Include Footer Start -->
 <%@ include file="footer.jsp" %>
 	<!-- Include Footer End -->


</div>




</body>
</html>