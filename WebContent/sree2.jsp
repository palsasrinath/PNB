<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<title>Customer Registration</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/customerRegisterStyle.css"/>
  <script type="text/javascript">
  function setDropDwnVal()
  {
	 document.getElementById("seldrpval").style.display='none';
	 document.getElementById("seldrpval").value="";
	 if(document.getElementById("sel1").value!="")
	  {
		document.getElementById("seldrpval").placeholder=document.getElementById("sel1").value;
			 document.getElementById("seldrpval").style.display='block';
	  }
  }


  </script>
</head>
	<body>
	  <div class="container-fluid">
	   <div class="row">
         <div class="col-md-3 col-xs-4 img">
	       <a href="index.jsp"><img src="images/banner.jpg"></a>
	   </div>
	</div><!--end row--><br>
	</div><!-- container-fluid -->
 <div class="container-fluid">
  <div class="row">
     <div class="col-md-12 Regheader">
       <div class="col-md-4"><h3>Welcome to Customer Register</h3></div>
    </div>
</div><!--end-row-->
   <div class="row">
      <div class="col-md-5 col-md-offset-3 reg">
         <form:form id="customerRegister" name="customerRegister" action="customerSubmit.htm" method="post" class="form-signin" role="form">
		   <img src="images/banner.jpg" height="80px" width="100%;"><br><br>
            <div class="form-group">
               <form:input name="firstName"  id="firstName" path="firstName"  class="form-control input-lg" placeholder="Enter First Name" type="text" required="autofocus" />
            </div>
            <div class="form-group">
              <form:input name="lastName"  id="lastName" path="lastName"   type="text" class="form-control input-lg" placeholder="Enter Last Name"  required="autofocus"/>
            </div>
            
            <div class="form-group">
			<label>Gender:</label>
			 <form:radiobutton path="gender" id="gender"    value="Male"/>Male
	    	 <form:radiobutton path="gender" id="gender"   value="Female"/>Female
		    </div>
			<div class="form-group">
             <form:input name="email"   id="email"  path="email" class="form-control input-lg" placeholder="Enter Email"  type="email" required="autofocus"/>
            </div>
			<div class="form-group">
              <form:input name="userName"   id="userName"  path="userName" type="text" class="form-control input-lg" placeholder="User Name for Internet banking login" required="autofocus"/>
            </div>
			<div class="form-group">
              <form:input name="password"   id="password"  path="password" type="Password" class="form-control input-lg" placeholder="Enter Password for Internet banking login" required="autofocus"/>
            </div>
            <div class="form-group">
              <form:input name="conformPassword"   id="conformPassword"  path="conformPassword" type="Password" class="form-control input-lg" placeholder="Enter conformPassword for Internet banking login" required="autofocus"/>
            </div>
			<div class="form-group">
              <form:input name="adhaarNumber"   id="adhaarNumber"  path="adhaarNumber" type="text" class="form-control input-lg" placeholder="Enter Adhar Number" required="autofocus" />
            </div>
            <div class="form-group form-hori">
     			 <label for="ID Proof">ID Proof:</label>
      			<form:select name="idProof"    path="idProof" required="autofocus" class="form-control" id="sel1" onchange="setDropDwnVal();">
	 			   <option value="">Select Id Proof</option>
     			   <option value="VoterId">Voter Id</option>
     			   <option value="PanCard">Pan Card</option>
       			   <option value="RationCard">Ration Card</option>
       			   <option value="AdharCard">Adhar Card</option>
     		    </form:select>
	  <form:input type="text" class="form-control" id="seldrpval"  name="idNumber" path="idNumber" style="display:none"/>
        </div>
			<div class="form-group">
	  <div class="form-group">
	   <form:input name="mobile"  id="mobileNumber"  path="mobileNumber" class="form-control input-lg" placeholder="Enter Mobile Number"  type="text" maxlength="10" required="autofocus"/> 
	</div>
	<div class="form-group">
   <label for="Address">Address:</label>
	<form:textarea name="address" id="address"    path="address" class="form-control" rows="1" cols="80" placeholder="Enter Address" required="autofocus"></form:textarea>
	</div>
	<div class="form-group">
      <label for="City">City:</label>
      <form:select name="city"    path="city" class="form-control" id="city" required="autofocus" >
	  <option value="Select a City">Select a City</option>
        <option value="Hyderabad">Hyderabad</option>
        <option value="Bangalore">Bangalore</option>
        <option value="Mumbai">Mumbai</option>
        <option value="NewDelhi">NewDelhi</option>
      </form:select>
   </div>
   
   <div class="form-group">
      <label for="State">State:</label>
      <form:select name="state" id="state"    path="state"  class="form-control" required="autofocus">
	    <option value="Select a State" >Select a State</option>
        <option value="Andhrapradesh">Andhrapradesh</option>
        <option value="Telangana">Telangana</option>
        <option value="Maharashtra">Maharashtra</option>
        <option value="Rajastan">Rajastan</option>
      </form:select>
   </div>

<div class="form-group">
      <label for="Contry">Country:</label>
      <form:select name="country" id="country"    path="country" class="form-control" required="autofocus">
	  <option value="Select a Contry">Select a Contry</option>
      
        <option value="India">India</option>
        <option value="Australia">Australia</option>
        <option value="England">England</option>
         <option value="France">France</option>
          <option value="Italy">Italy</option>
        <option value="America">America</option>
      </form:select>
   </div>
   
	<div class="form-group">
			<label for="file upload">File upload:</label>
			<input type="file"><br>
		   <button class="btn btn-primary" name="btn-upload">upload file </button>
      </div>
	
	<div class="form-group">
	  <button class="btn btn-primary btn-lg btn-block" >Sign up</button>
	</div>
	  <div class="modal-footer">
	    	
  <div class="row" >
  
  <span class="col-md-4" style="font-size:12px;color:blue;text-align: left;">Already Registered?</span>
	<span class="col-md-2" style="font-size:12px;color:blue;text-align: left;"><a href="customerLogin.htm">Sign In</a></span>
<span class="col-md-6"><a href="index.jsp" class="btn btn-primary" >Home</a> </span>

</div>
	
</form:form>
</div>
</div><!-- End-container -->
</div><!--end-row-->
<!--footer-->
 <div class="container-fluid">
<div class="row">
<div class="col-md-12 footer text-center"><h4>Copyright © 2017 Money Bank All Rights Reserved. Website Developed by <code> Mktechnosoft</code></h4>
</div>
</div>
</div><!--end-container fluid-->

</body>
</html>