<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  		
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>AdminLogin</title>

<!--<link href="css/homePage.css" rel="stylesheet" type="text/css">-->
<link href="admincss/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="admincss/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
//window.history.forward(1);
//window.history.go(1);
</script>
 <script src="js/timezone.js"></script>
  <script>
  function Login(){
	/*	if(document.getElementById("username").value =="Username"){
			document.getElementById("username").value = "";
		}
		if(document.getElementById("password").value == "Company Name"){
				document.getElementById("password").value = "";
		}
*/
		var username = document.getElementById('email').value;
		var password = document.getElementById('password').value;
		var passwordregex = /^[a-zA-Z0-9\-.,$&amp;@#\%\[\]\_\/\:\?\+]*$/;
		var errorMessage = "";
		var checkFormValidate = false;
		if(username == ""){
			errorMessage="Email address is required <br/>";
			checkFormValidate = true;
		}else{
				if (username.length < 6 || username.length > 50 ) {
					errorMessage +="Invalid Email address <br/>";
					checkFormValidate = true;	
				}
			}
		if(password == ""){
			errorMessage =errorMessage + "Password is required";
			checkFormValidate = true;
			
		}else{

				if (password.length < 6 || password.length > 50 ) {
					errorMessage +="Invalid  Password <br/>";
					checkFormValidate = true;	
				}
				if(!passwordregex.test(password)){
					errorMessage +="Invalid  Password <br/>";
					checkFormValidate = true;	
				}
		}

		if (checkFormValidate) {
			document.getElementById('password').value='';
			document.getElementById('loginErrorDiv').innerHTML = errorMessage;
			document.getElementById('loginErrorDiv').style.display = '';
			document.getElementById('ActionMsgDiv').style.display = 'none';
			return false;
			
		}else{
			document.loginForm.action ="login_testing.action";	
			document.loginForm.submit();
			return true;
		}
	  }

          function setTimeZoneInCookie() {
        var _myDate = new Date();
        var _offset = _myDate.getTimezoneOffset();
        document.cookie = "TIMEZONE_COOKIE=" + _offset; //Cookie name with value
        //alert("_offset in webHomePage.jsp-->"+_offset);
        var tz = jstz.determine();
        var timeZoneName=tz.name();
        //alert("Time Zone in webHomePage.jsp-->"+timeZoneName);
        document.cookie = "TIMEZONE_NAME_COOKIE=" + timeZoneName;
    }

	//added by naveenv
	function initFocus(){
		document.getElementById('username').focus();//added by naveenv
	}  
	
	 history.pushState({page: 1}, "title 1", "#nbb");
     window.onhashchange = function (event) {
         window.location.hash = "nbb";
     };
	
 	</script> 
 	<style>
 	
 	.header1{
  background-color:#0460ad;;
 height:72px;
 color:white;
 	}
 	.footer{
	height:72px;
	background-color:#0460AD;
	color:white;
}
.footer h4{
	margin-top:25px;	
	
}
	</style>
 	
</head>

<body onload="setTimeZoneInCookie();initFocus();" class="login">
<div id="wrapper">

<div class="container-fluid">
<div class="row">
		<div class="col-md-12 header1"><h2>Welcome to Admin Login</div>
</div>
</div>

	<div class="container">
	  <div class="login-form">
	    <div class="logo text-center"><a href="#"><img src="images/icici-bank-logo.png" style="height:60px;width:100%;"> </a></div>
	    
	    <form:form id="loginForm" name="loginForm" action="adminLogin.htm" method="post" class="form-signin" role="form" commandName="adminForm">
	    	<div class="alert alert-danger" id="loginErrorDiv" align="left" style="display: none;"></div>
		    <div  id="ActionMsgDiv" >
		    	
			</div>
	    	<input type="hidden" name="pageChecker" value="fromWebPage" id="pageChecker"/>
			
            
           		<form:input type="text" name="email" value="" id="email" path="email" class="form-control mand" placeholder="Email address" required="autofocus"/>
				<form:input type="password"  name="password"  id="password" path="password" class="form-control disable mand" required="autofocus" placeholder="Password"/>
				
				<!-- <input type="submit" value="Sign In" name="Create"
				onclick="javaScript:return Login()" style="background: #008FD5 none repeat scroll 0% 0% !important" class="btn btn-primary"/> -->
				<input type="submit" value="Sign In" name="Create" style="background: #008FD5 none repeat scroll 0% 0% !important" class="btn btn-primary"/>
	    </form:form>



	    <div class="form-footer">
	      <div class="row">
	        <div class="col-xs-8 col-sm-8 col-md-8">
				<a href="forgotPassword.jsp"> Forgot Password? </a>
				<a href="admin.htm" style="float:right">Sign Up </a>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
	
</div>



<div class="container-fluid">
<div class="row">
<div class="col-md-12 footer text-center"><h4>Copyright © 2017   Money Bank All Rights Reserved. Website Developed by <code> Mktechnosoft</code></h4>
</div>
</div>
</div><!--end-container fluid-->

</body>
</html>
