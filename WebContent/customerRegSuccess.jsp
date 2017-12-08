<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>CustomerRegSuccessPage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/loginCustomerStyle.css" />
</head>
<body>
	<div class="container-fluid">

		<div class="row">

			<div class="col-md-3 col-xs-4 img">
				<img src="images/banner.jpg">
			</div>

		</div>
		<!--end-row-->
		<br>
		<div class="row">

			<div class="col-md-12 header">

				<div class="col-md-4">
					<h3>Customer Registration Success Page</h3>
				</div>
			</div>
		</div>
		<!--end-row-->
		<div class="row">
			<div class="col-md-5 col-md-offset-3 reg">

				<form id="customerloginForm" name="customerloginForm" action="customer.htm" method="post" class="form-signin" role="form">
					<img src="images/banner.jpg" height="80px" width="100%;"><br><br>
					<div class="form-group">
						<h3>Thanks for Registering ICICI Bank Online</h3>
						
						
					</div>
					
					
						
				<p>	Your Reference Number  is </p>  <%= request.getAttribute("referenceNumber") %>
						
					
				<div class="row">
	<span class="col-md-10" style="font-size:14px;color:blue;"><a href=""></a></span> 
<span class="col-md-2"> <a href="index.jsp" class="btn btn-primary">Home</a> </span>

</div>	
					
				</form>

			</div>
		</div>
		<!--end-row-->

		<!--footer-->

		<div class="row">

			<div class="col-md-12 footer"></div>
		</div>
		<!--end-row-->
	</div>
	<!--end-container fluid-->

</body>
</html>