<!doctype html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import=" java.util.*, java.io.*, java.util.ArrayList"%>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>BANK DETAILS</title>
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>
<link rel="stylesheet" href="css/bankDetailsPage.css"/>
 </head>
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
										<li><a href="fundsTransferPage.htm">Transfer Funds To </a></li>
									<!--	<li><a href="#">list </a></li>-->
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
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<span><i class="fa fa-lock	lock" aria-hidden="true"></i></span> <span><b>WELCOME BACK</b></span>				
				</div>
				<div class="col-md-12">
					<div class="col-md-1">
					<h4 style="text-align:right;"> Mr.<%= session.getAttribute("userName") %> </h4>
					</div>
				</div>
				<div class="col-md-12">
					<div class="col-md-1">
						<i class="fa fa-user user" aria-hidden="true"></i>
					</div>
					<div class="col-md-3 profile">
					<span class="button">
						<button type="button" class="btn btn-warning">MY PROFILE</button>
					</span>
					</div>
				</div>
				<div class="col-md-12">
					<div class="col-md-1">
						<i class="fa fa-credit-card-alt card" aria-hidden="true"></i>
					</div>
					<div class="col-md-3">
						<span class="button">
							<button type="button" class="btn btn-warning">MY CARD PIN</button>
						</span>
					</div>
				</div>
				<div class="col-md-12">
					<div class="col-md-2 time">
						<p class="time1">Last Visited 10-07-2017</p>
						<center><p class="time1">14:20:17 IST</p></center>
					</div>
					<div class="col-md-1 time">
						<a href="customerLogout.htm" class="btn btn-primary logout"><center>LOG OUT</center></a>
					</div>
				</div>
				</div>
				</div>
				<div class="container">
				<div class="row">
				<div class="col-md-12">
					<div class="col-md-3 empty"></div>
					<div class="col-md-4 balance">
					  <div class="row line">
						<div class="col-md-10 color">
							<i class="fa fa-signal graph" aria-hidden="true"></i> <b>I HAVE</b>
						</div>
						<div class="col-md-2 color">
							<b><i class="fa fa-minus" aria-hidden="true"></i></b>
						</div>
						</div><br>
						<div class="row">
							<div class="col-md-5">
								<p><b>Account Balance</b></p>
							</div>
							<div class="col-md-4">
								<p><%= session.getAttribute("accBal") %></p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-5">
								<p><b>Demat</b></p>
							</div>
							<div class="col-md-4">
								<p>INR 0.00</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-5">
								<p><b>Deposits</b></p>
							</div>
							<div class="col-md-4">
								<p>INR 0.00</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-5">
								<button type="button" class="btn btn-warning">LINK MY ACCOUNT</button>
							</div>
						</div>
					</div>
					<div class="col-md-4 balance1">
						<div class="row line">
						<div class="col-md-10 color">
							<i class="fa fa-signal graph" aria-hidden="true"></i> <b>I OWE</b>
						</div>
						<div class="col-md-2 color">
							<b><i class="fa fa-minus" aria-hidden="true"></i></b>
						</div>
						</div><br>
						<div class="row">
							<div class="col-md-5">
								<p><b>Credit Cards</b></p>
							</div>
							<div class="col-md-4">
								<p>INR 55000.00</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-5">
								<p><b>Loans</b></p>
							</div>
							<div class="col-md-4">
								<p>INR 0.00</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-5">
								<p><b>Insurance</b></p>
							</div>
							<div class="col-md-4">
								<p>INR 0.00</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-5">
								<button type="button" class="btn btn-warning">LINK MY ACCOUNT</button>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
		<script>
$(document).ready(function(){
  $('.dropdown-submenu a.test').on("click", function(e){
    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();
  });
});
</script>
 </body>
</html>
