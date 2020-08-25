<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, bean.*, java.util.*"%>
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




<!-- Displaying the Trains Start -->
<%	ArrayList<Train> trains = (ArrayList<Train>) Arrays.asList((Train[]) request.getAttribute("trains")); %>

	
<div class="container-fluid">

<div class="col-sm-12">
	<h2 class="text-center">	<% out.println("Edit Train " + aName ); %>	</h2>
	
	<!-- START OF FORM -->
	<form class="form-horizontal text-center" action="aedittrain" method="POST"><br>
	<div class="container table-responsive">
	<table class="table table-hover table-condensed" width="1500">
	<thead>
		<tr>
		<th width="250">Train No</th>
		<th width="250">Train Name</th>
		<th width="250">From Station</th>
		<th width="250">To Station</th>
		<th width="250">Availability</th>
		<th width="250">Distance</th>
		</tr>
		</thead>
	<tbody>
	
	<!-- Showing all Trains -->
<%
	if(trains==null)
	{
%>
	<tr>
		<td colspan="6" align="center">No Trains Available</td>
	</tr>
<%
	}
	else
	{
		Iterator<Train> it = trains.iterator();
		while(it.hasNext())
		{
			Train t = (Train) it.next();
			//	Displaying Row wise the Train Details
%>
			<tr>
			<td align="center"><%= t.getTrainNo() %></td>
			<td align="center"><%= t.getTrainName() %></td>
			<td align="center"><%= t.getFromStation() %></td>
			<td align="center"><%= t.getToStation() %></td>
			<td align="center"><%= t.getAvail() %></td>
			<td align="center"><%= t.getDist() %></td>
			</tr>
<%
		}
	}
%>

	<tr>
		<td colspan="6" align="center">Update the Train Details</td>
	</tr>
	
	<tr>
	<td width="250" align="center"><input type="text" class="form-control input" name="tno"></td>
	<td width="250" align="center"><input type="text" class="form-control input" name="tname"></td>
	<td width="250" align="center"><input type="text" class="form-control input" name="fstation"></td>
	<td width="250" align="center"><input type="text" class="form-control input" name="tstation"></td>
	<td width="250" align="center"><input type="text" class="form-control input" name="avail"></td>
	<td width="250" align="center"><input type="text" class="form-control input" name="dist"></td>
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