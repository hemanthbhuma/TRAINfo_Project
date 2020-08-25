<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.*, java.util.*" %>

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
    	request.getRequestDispatcher("login.html").include(request, response);
    	out.println("Please Login First");
    	return;
    }
%>

<% 
	Train t = (Train) session.getAttribute("train");
	double fare = (double) session.getAttribute("fare");
	int seats = (int) session.getAttribute("seats");
%>

	<div class="container-fluid table-responsive-sm text-center" id="printableArea">
	<h1 class="text-center">- - - TRAINfo - - -</h1><hr>
	
	<h3 class="text-center">TRANSACTION SUMMARY</h3>
	
	<div class="container-fluid col-sm-offset-1 col-sm-10">
	
	<table class="table table-condensed">
	<tr>
	<th>User Name : </th>
	<td><%= uName %></td>
	</tr>
	
	
	<tr>
	<th>Date : </th>
	<td><%= new java.util.Date() %></td>
	</tr>
	
	<tr>
	<th>Train No : </th>
	<td><%= t.getTrainNo() %></td>
	</tr>
	
	<tr>
	<th>Train Name : </th>
	<td><%= t.getTrainName() %></td>
	</tr>
	
	<tr>
	<th>From Station : </th>
	<td><%= t.getFromStation() %></td>
	</tr>
	
	<tr>
	<th>To Station :</th>
	<td><%= t.getToStation() %></td>
	</tr>
	
	<tr>
	<th>Distance :</th>
	<td><%= t.getDist() %></td>
	</tr>
	
	
	<tr>
	<th>Ticket Fare :</th>
	<td><%= new Formatter().format("%.2f", fare*t.getDist()) %></td>
	</tr>
	
	<tr>
	<th>No.Of Tickets :</th>
	<td><%= seats %></td>
	</tr>
	
	<tr>
	<th>SUB TOTAL :</th>
	<td><%= new Formatter().format("%.2f", seats*t.getDist()*fare) %></td>
	</tr>
	
	<tr>
	<th>TAX (14%) :</th>
	<td><%= new Formatter().format("%.2f", (0.14F)*seats*t.getDist()*fare)  %></td>
	</tr>
	
	<hr>
	
	<tr>
	<th>TOTAL AMOUNT :</th>
	<td><%= new Formatter().format("%.2f", (1.14F)*seats*t.getDist()*fare)  %></td>
	</tr>
	 
	
	</table>
	<br>
	
	<form class="text-center">
         <input type="button" class="btn btn-danger" value="Print" onclick="printDiv('printableArea')" />
    </form>
	
	</div>
	
	</div>
	
	
	<br>
	<br>
	
<div class="container-fluid">
<br><br><br><br><br><br>

	<!-- Include Footer Start -->
 <%@ include file="footer.jsp" %>
 	<!-- Include Footer End -->

</div>	

</body>
<script>
function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
}
</script>
</html>