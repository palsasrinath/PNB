<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<title>Admin_Home page</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/admin.css"/>
  </head>
  <body>
		<div class="container-fluid">
		 		  <div class="row">
		     <div class="col-md-12 header">
		        <div class="col-md-4"><h3>Welcome to Admin Home Page</h3></div>
	    	</div>
		</div><!--end-row-->
	</div><!--end-container fluid-->
<body style="background-color:#f2f2f2">
	<div class="container-fluid">
       <div class="row">
		  <div class="col-md-9 Admin">
			<div class="page-header"><h1>Registerd Customers</h1></div>
			 <table class="table table-bordered table-responsive">
        <thead>
      <tr>
        <th>Name</th>
        <th>Account No</th>
        <th>Contact No</th>
		<th>Email Id</th>
	    <th>Aadhaar No</th>
		<th>Status</th>
     </tr>
       </thead>
    <tbody>
      <tr>
        <td>D.venkatesh</td>
        <td>20665252220</td>
        <td>123456789</td>
		<td>venkatesh@gmail.com</td>
        <td>123456789</td>
      <td><button type="button" class="btn btn-success">Active</button></td>
      </tr>
	  <tr>
        <td>Anil</td>
        <td>12345678910</td>
		<td>123456789</td>
        <td>anil@gmail.com</td>
        <td>123456789</td>
        <td><button type="button" class="btn btn-success">Active</button></td>
      </tr>
	  <tr>
        <td>Anil</td>
        <td>12345678910</td>
		<td>123456789</td>
        <td>anil@gmail.com</td>
        <td>123456789</td>
        <td><button type="button" class="btn btn-success">Active</button></td>
      </tr>
	   <tr>
        <td>Anil</td>
        <td>12345678910</td>
		<td>123456789</td>
        <td>anil@gmail.com</td>
        <td>123456789</td>
        <td><button type="button" class="btn btn-success">Active</button></td>
      </tr>
       <tr>
        <td>Anil</td>
        <td>12345678910</td>
		<td>123456789</td>
        <td>anil@gmail.com</td>
        <td>123456789</td>
         <td><button type="button" class="btn btn-success">Active</button></td>
      </tr>
      <tr>
        <td>Anil</td>
        <td>12345678910</td>
		<td>123456789</td>
        <td>anil@gmail.com</td>
        <td>123456789</td>
       <td><button type="button" class="btn btn-success">Active</button></td>
      </tr>
    </tbody>
  </table>
</div>
<div class="col-md-3 Home">
			<button type="button" class="btn btn-primary pull-left" data-toggle="modal" data-target="#logoutAlert">Logout</button><br><br>
			<a href="resetPassword.jsp" class="btn btn-primary pull-left">Reset Password</a><br><br>
			<a href="customer.htm" class="btn btn-primary pull-left">Add Customer</a>
			<a href="assignAccNoToNewCustomer.jsp" class="btn btn-primary pull-left">Assign Acc No to New Customer</a>
        </div>

<!-- Modal -->
<div id="logoutAlert" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Are You Sure You Want to logged Out</h4>
      </div>
      <div class="modal-body">
        <p>You are Sucessfully Logged Out</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="goHome()" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- /Modal -->


     </div><!--end row-->
 </div><!--End-container-->
<!--footer-->

<div class="container-fluid">
	<div class="row">
	<div class="col-md-12 footer text-center"><h4>Copyright © 2017   Money Bank All Rights Reserved. Website Developed by <code> Mktechnosoft</code></h4>
	</div>
	</div>
</div><!--end-container fluid-->

 <script>
  function goHome() {
//alert(location.href);
       // url = 'login.jsp?name=' + "welcome to login";
		//alert(url);
window.location.href = "index.jsp";
//	alert(url);
}
  </script>

</body>
</html>