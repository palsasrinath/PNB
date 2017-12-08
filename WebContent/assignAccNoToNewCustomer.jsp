<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import=" java.util.*, java.io.*, java.util.ArrayList"%>

<html>
<head>
<title>Assigning acount no </title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/TrackRefrence.css"/>

  <script>
function acnoGenerate(){
    var acNo = Math.floor((Math.random() * 10000000000) + 1);	
	document.getElementById("accountNumber").value = acNo;
}
</script>
</head>
<body>
	<div class="container-fluid">
       <div class="row">
          <div class="col-md-3 img">
			<img src="images/logo.png">
	  	</div>
   </div><!--end-row--> <br>
	<div class="row">
       <div class="col-md-12 header">
          <div class="col-md-5"><h3>Assigning Account Number to New Customer</h3></div>
		</div>
	</div><!--end-row-->
      <div class="row">
          <div class="col-md-5 col-md-offset-3 reg">
             <form:form  id="assignAccountNumber" name="assignAccountNumber" action="assignAccountNumber.htm" method="post" class="form-signin" role="form">
		        <div class="form-group">
					<label for="referenceNumber">Select ref no</label>

					<form:select path="referenceNumber" id="referenceNumber">
    					<form:option value="0" label="Select an Option" />
   				   		<form:options items="${refNumbers}" />
					</form:select>
					
				  </div>
				  <div class="form-group">
					<label for="accountNumber">Generate Code</label>
					<form:input type="text" class="form-control mand" path="accountNumber" id="accountNumber" placeholder="A/c No not generated"  />
					<a href="#" class="btn btn-primary" style="margin:20px 0 20px 0;" onclick="acnoGenerate()">generate</a>	
				</div>
				
				  
       <div class="row">
   <span class="col-md-2"> <a href="adminHomeView.htm" class="btn btn-primary">AdminHome</a> </span>
     </div>

	          <button class="btn btn-primary btn-lg btn-block">Submit</button>	
			  <a href="index.jsp" class="btn btn-primary btn-lg pull-right btn-home" style="margin:20px 0 0 0;">Home</a>	
       </form:form>
       
    
    </div>
</div><!--end-row-->

<!--footer-->

<div class="row">

<div class="col-md-12 footer">
</div>
</div><!--end-row-->
</div><!--end-container fluid-->


</body>
</html>