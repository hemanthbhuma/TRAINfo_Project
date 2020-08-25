<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.Train, java.util.*"%>
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
    	request.setAttribute("msg", "Please Login First");
    	request.getRequestDispatcher("login.jsp").include(request, response);
    	return;
    }
%>

<div class="container-fluid table-responsive-sm" style="padding: 0px; margin: 0px;">


	<div class="container-fluid col-sm-12">
	
	
	<!-- Enter Trains Start -->
    <div class="col-sm-offset-1 col-sm-4 well" style="background-color:rgba(0, 0, 0, 0.7); color:#fff; margin: 2% 10%; max-width: 400px; min-width: 330px;">
    <div class="text-center">
    	<img alt="Train.jpg" src="Train.png" width="100" height="100">
    </div>
    
	    <h2 class="text-center">Train Search</h2><br>
	    <form action="trainstation" method="POST">
	        <div class="form-group">
	            <label for="fs">From Station:</label>
	            <input type="text" class="form-control" id="fs" placeholder="From Station" name="fromstation">
	        </div>
	        
	 <div class="text-center">
    	<img alt="Train.jpg" src="UD.png" width="50" height="50">
    </div>
    
	        <div class="form-group">
	            <label for="ts">To Station:</label>
	            <input type="text" class="form-control" id="ts" placeholder="To Station" name="tostation">
	        </div>
	        <div class="text-center">
	        <button type="submit" class="btn btn-lg btn-danger">Submit</button>
	        </div>
	    </form>
    </div>
	<!-- Enter Trains End -->
	

	<!-- Error When No Trains Available Start -->
<%
	if(request.getAttribute("notrains") != null)
	{
%>
	<div class="col-sm-offset-1 col-sm-4 well text-center" style="background-color:rgba(0, 0, 0, 0.7); color:rgba(255, 255, 255, 1);">
	    <br>
	    <div class="col-sm-offset-1 col-sm-3 well text-center" style="background-color:rgba(255, 255, 255, 1); color:rgba(81, 81, 81, 1);">
	    <h1><i class="fas fa-subway"></i></h1>
	    </div>
	    <div class="col-sm-8 text-center">
	    <h2><%= request.getAttribute("notrains") %></h2>
	    <label for="tno">Please Enter Again</label>
	    </div>
	    <br>
    </div>
<%
	return;
	}
%>
	<!-- Error When No Trains Available End -->
	


	<!-- START DISPLAYING THE TRAIN DETAILS -->
<%
	if(request.getAttribute("trains") != null)
    {
    	ArrayList<Train> trains = (ArrayList<Train>) request.getAttribute("trains");
%>
	<div class="col-sm-offset-1 col-sm-4 well" style="background-color:rgba(0, 0, 0, 0.7); color:#fff; margin: 2% 10%; max-width: 500px; min-width: 330px;">
	<h2 class="text-center"><i class="fas fa-subway"></i> TRAIN DETAILS</h2>
	<h3>Trains Available</h3>	
<%
	for(Train t:trains)
	  {
%>
	<br> <p> <a href="trainstation2?trainno=<%=t.getTrainNo()%>&trainname=<%=t.getTrainName()%>&from_station=<%=t.getFromStation()%>&to_station=<%=t.getToStation()%>&avail=<%=t.getAvail()%>&dist=<%=t.getDist()%>"> <%=t.getTrainNo()%> </a> <%=t.getTrainName()%></p>
<%
	  }
    }
%>			
	<br>
	</div>	
<!-- END DISPLAYING THE TRAIN DETAILS -->
	
	<br>
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