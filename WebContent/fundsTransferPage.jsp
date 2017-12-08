<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Funds Transfer Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/fundsTransferPage.css"/>
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script>

jQuery(document).ready(function($) {
		$(document).on("change","#accountNumber", function(){			
			var accountNumber = $("#accountNumber").val();
			var name;
			$.ajax({
				type : "GET",
				contentType : "application/json",
				url: 'getaccountHolderName.htm',
				data:{"name":accountNumber},
		        dataType: "text",
		         timeout : 100000,
		        success: function (response) {
		        	
		        	 $('#accountHolderName').val(response);
		         
		            },
		   	error: function(e) 
		   	{
	        	alert("eror");
	            console.log("Error:" + e);
	        }
		});
	});

	});
	
</script>
 </head>
 <body>
	<div class="container-fluid">
		<header class="row">
			<div class="col-md-12">
				<div class="col-md-4 img">
					<img class="logo" src="images/icici-bank-logo.png"/>
				</div>
				<div class="col-md-3 col-md-offset-5 list-1">
					<ul class="list">
						<li class="list-li">About Us |</li>
						<li class="list-li">Customer Care |</li>
						<li class="list-li">Find ATM/Branch</li>
					</ul>
				</div>
			</div>

			<div class="col-md-12">
				<nav class="navbar navbar-toggleable-md bg-danger">
					<ul class="nav navbar-nav">
						<li class="dropdown list-2">
						    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>OVERVIEW</b><span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
							  <li><a href="#">Page 1-1</a></li>
							  <li><a href="#">Page 1-2</a></li>
							  <li><a href="#">Page 1-3</a></li>
							</ul>
						</li>
						<li class="dropdown list-2">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>MY ACCOUNTS</b><span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
							  <li><a tabindex="-1" href="#">Page 1-1</a></li>
							  <li><a tabindex="-1" href="#">Page 1-2</a></li>
							  <li><a tabindex="-1" href="#">Page 1-3</a></li>
							  <a href="#">FUND TRANSFER</a>
							</ul>
						</li>
					  <li class="dropdown list-2">
					    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>PAYMENTS & TRANSFER</b><span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li class="dropdown-submenu">
								<a href="#" class="test" data-toggle="dropdown">Funds TRANSFER
									<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">IMPS</a></li>
										<li><a href="#">NEFT</a></li>
									</ul>
							</li>
						</ul>
					  </li>
					  <li class="dropdown list-2">
					    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>INVESTMENT & INSURANCE</b><span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
						  <li><a href="#">Page 1-1</a></li>
						  <li><a href="#">Page 1-2</a></li>
						  <li><a href="#">Page 1-3</a></li>
						</ul>
					  </li>
					  <li class="dropdown list-2">
					    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>EXCLUSIVE OFFERINGS</b><span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
						  <li><a href="#">Page 1-1</a></li>
						  <li><a href="#">Page 1-2</a></li>
						  <li><a href="#">Page 1-3</a></li>
						</ul>
					  </li>
					  <li class="dropdown list-2">
					    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>CUSTOMER SERVICE</b><span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
						  <li><a href="#">Page 1-1</a></li>
						  <li><a href="#">Page 1-2</a></li>
						  <li><a href="#">Page 1-3</a></li>
						</ul>
					  </li>
					</ul>
				</nav>
			</div>
		</header>
<!-- Payee Details --->
		<main class="container" id="payeeDetails">
		  	<form:form class="col-md-6 col-md-offset-3" id="fundTransferSubmit" name="fundTransferSubmit" action="fundTransferSubmit.htm" method="post" role="form">
			    <div class="form-group row">
				  <label for="example-text-input" class="col-2 col-form-label">Available Balance</label>
				  <div class="col-6">
				    <form:input class="form-control" type="text" value="${accBal}"  path="availableBalance" id="availBalance" />
				  </div>
				</div>
				<div class="form-group row">
					<label for="exampleSelect1">Select Account</label>
					
					<form:select path="accountNumber" id="accountNumber">
    					<form:option value="0" label="Select an Option" />
   				   		<form:options items="${accountNumbers}" />
					</form:select>
					
				</div><%-- <%= session.getAttribute("userName") %> --%>
				
				<div class="form-group row">
				  <div class="col-10">
				    <form:input class="form-control" type="hidden" value="${userName}" path="customer" id="customerName" />
				  </div>
				</div>
				<div class="form-group row">
				  <label for="example-search-input" class="col-2 col-form-label">Name</label>
				  <div class="col-10">
				    <form:input class="form-control" type="text"  path="payeeName" id="accountHolderName" />
				  </div>
				</div>
				<div class="form-group row">
				  <label for="example-search-input" class="col-2 col-form-label">Enter Amount To be Transfer</label>
				  <div class="col-10">
				    <form:input class="form-control" type="number"  path="amountToTransfer" placeholder="0" id="example-search-input" />
				  </div>
				</div>
	  			<div class="form-group">
	       <input type="submit"  value="Submit" class="btn btn-primary">
	           </div>
	  			   
			</form:form>
			
			<span class="col-md-2"> <a href="customerHomePageView.htm" class="btn btn-primary">Back to Customer Home Page</a> </span>
		</main>	
		
<!-- Funds Transfer Popup -->
<section class="container" id="fundsTransferPopup" />
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="jumbotron bg-success">
				<div class="page-header">
				  <h5 class="text-center">Transaction Success</h5>
				</div>
				<p>Funds Has been Transfered Successfully.</p>
				<p class="text-center"> Remaining Balance is <b>1234</b>.</p> 
				<span class="col-md-2"> <a href="customerHomePageView.htm" class="btn btn-primary">Return to Customer Home</a> </span>
			</div>
		</div>
	</div>
	
	
</section>
<!-- /Funds Transfer Popup -->
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$( "#fundsTransferPopup").hide();
	$( "#fundsTransferButton" ).click(function() {
	  $( "#payeeDetails").hide();
	  $( "#fundsTransferPopup").show();
	});
});
</script>

	</div> <!-- container-fluid -->
 </body>
</html>
