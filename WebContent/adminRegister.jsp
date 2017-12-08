<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  		
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Admin Registration</title> 


<link href="admincss/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="admincss/style.css" rel="stylesheet" type="text/css"/>

 <script type="text/javascript">
//window.history.forward(1);
//window.history.go(1);
</script>
 <script src="js/timezone.js"></script>
  <script>
  function register(){
	    var fname = document.getElementById('firstName').value;
	    var lname = document.getElementById('lastName').value;
		var email = document.getElementById('email').value;
		var password = document.getElementById('password').value;
		var passwordregex = /^[a-zA-Z0-9\-.,$&amp;@#\%\[\]\_\/\:\?\+]*$/;
		var gender = document.getElementById('gender').checked;
		var mobile = document.getElementById('mobileNumber').value;
		var mobileregex = /^(\+\d{1,3}[- ]?)?\d{10}$/;
		var dob = document.getElementById('dateOfBirth').value;
		var dobregex = /^\d{2}([./-])\d{2}\1\d{4}$/;
		var address = document.getElementById('address').value;
		var city = document.getElementById('city').value;
		var state = document.getElementById('state').value;
		
		
		var errorMessage = "";
		var checkFormValidate = false;
		
		if(fname == ""){
			errorMessage="firstName is required <br/>";
			checkFormValidate = true;
		}
		if(lname == ""){
			errorMessage="lastName is required <br/>";
			checkFormValidate = true;
		}	
		if(email == ""){
			errorMessage="Email is required <br/>";
			checkFormValidate = true;
		}else{
				if (email.length < 6 || email.length > 50 ) {
					errorMessage +="Invalid Email <br/>";
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
		
		if(gender == ""){
			errorMessage="gender is required <br/>";
			checkFormValidate = true;
	    }
		
		if(mobile == ""){
			errorMessage="mobileNumber is required <br/>";
			checkFormValidate = true;
		}else {
				if(!mobileregex.test(mobile)){
					errorMessage +="Invalid  mobileNumber <br/>";
					checkFormValidate = true;	
				}
		} 
		if(dob == ""){
			errorMessage="date of birth is required <br/>";
			checkFormValidate = true;
		}else {
				if(!dobregex.test(dob)){
					errorMessage +="Invalid  dateofbirth <br/>";
					checkFormValidate = true;	
				}
		} 
		if(address == ""){
			errorMessage="address is required <br/>";
			checkFormValidate = true;
		}
		if(city == ""){
			errorMessage="city is required <br/>";
			checkFormValidate = true;
		}
		if(state == ""){
			errorMessage="state is required <br/>";
			checkFormValidate = true;
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
		document.getElementById('fname').focus();//added by naveenv
	}  
	
	 history.pushState({page: 1}, "title 1", "#nbb");
     window.onhashchange = function (event) {
         window.location.hash = "nbb";
     };
	
 	</script> 
 	
 	</script>
 	<!--Admin.css -->
 	<style>
 	.header{
  background-color:#0460ad;;
 height:72px;
 color:white;
 	}
 	.footer-1{
	height:72px;
	background-color:#0460AD;
	color:white;
}
.footer-1 h4{
	margin-top:25px;	
	
}
 	
 	</style>
 	<!-- End-Admin.css -->
</head>

<body onload="setTimeZoneInCookie();initFocus();" class="login">
<div id="wrapper">
<div class="container-fluid">
<div class="row">
		<div class="col-md-12 header"><h2>Welcome to Admin</h2></div>
</div>
</div>

	<div class="container">
	  <div class="login-form">
	    <div class="logo text-center"><a href="#"><img src="images/icici-bank-logo.png" style="height:70px;width:100%"> </a></div>
	    
	    <form:form id="adminRegister" name="adminRegister" action="adminSubmit.htm" method="post" class="form-signin" role="form">
	    	<div class="alert alert-danger" id="loginErrorDiv" align="left" style="display: none;"></div>
		    <div  id="ActionMsgDiv" >
		    	
			</div>
	    	<form:input name="firstName"  id="firstName" path="firstName" class="form-control mand" placeholder="Enter FirstName"  type="text" required="autofocus"/>
	    	<form:input name="lastName" id="lastName" path="lastName" class="form-control mand" placeholder="Enter LastName"  type="text" required="autofocus"/>
	    	<form:input name="email"   id="email"  path="email" class="form-control mand" placeholder="Enter Email"  type="email" required="autofocus"/>
	    	<form:input name="password" id="password"     path="password" class="form-control mand" placeholder="Enter Password"  type="password" required="autofocus"/>
            <label>Gender:</label>
	    	<form:radiobutton path="gender" id="gender"    value="Male"/>Male
	    	<form:radiobutton path="gender" id="gender"   value="Female"/>Female
	    	<form:input name="mobile"  id="mobileNumber"  path="mobileNumber" class="form-control mand" placeholder="Enter Mobile Number"  type="text" required="autofocus"/>
	    	<form:input name="dob"   id="dateOfBirth" path="dateofbirth" class="form-control mand" placeholder="Enter DateOfBirth in dd/mm/yyyy format"  type="text" required="autofocus"/>
           	<form:input name="address" id="address"    path="address" class="form-control mand" placeholder="Enter Address"  type="text" required="autofocus"/>
           	<form:input name="city"   id="city" path="city" class="form-control mand" placeholder="Enter City"  type="text" required="autofocus"/>
           	<form:input name="state" id="state" path="state" class="form-control mand" placeholder="Enter State"  type="text" required="autofocus"/>
         
          	<input type="submit" value="Sign In" name="Create"
				onclick="javaScript:return register()" style="background: #008FD5 none repeat scroll 0% 0% !important" class="btn btn-primary"/>
	    </form:form>

	    <div class="form-footer">
	      <div class="row">
	        <div class="col-xs-8 col-sm-8 col-md-8"><a href="adminLoginView.htm">(Already registered) Sign In </a> </div>
	      </div>
	    </div>
	  </div>
	</div>
	
</div>



<div class="container-fluid">
<div class="row">
<div class="col-md-12 footer-1 text-center"><h4>Copyright © 2017   Money Bank All Rights Reserved. Website Developed by <code> Mktechnosoft</code></h4>
</div>
</div>
</div><!--end-container fluid-->

</body>
</html>
