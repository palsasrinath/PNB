<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  		
<html>
<head>
<title>Refrence Number</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/TrackRefrence.css"/>
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
          <div class="col-md-5"><h3>Track Customer Reference Number</h3></div>
		</div>
	</div><!--end-row-->
      <div class="row">
          <div class="col-md-5 col-md-offset-3 reg">
          <form:form id="trackReference" name="trackReference" action="trackReferenceNumberSubmit.htm" method="post" class="form-signin" role="form">
           <%-- <form:form type="text" class="form-signin" id="trackReference" name="trackReference" action=".htm" placeholder="Enter Track Refrence Number" role="form"/> --%>
		        <div class="page-header"><h3>Please Enter Reference Number</h3></div>
                    
          <div class="form-group">
              <form:input type="text" class="form-control mand" id="referenceNumber" path="referenceNumber" name="referenceNumber" placeholder="Enter Track Refrence Number" required="autofocus"/>
            </div>
          <div class="form-group">
              <form:input type="text" class="form-control mand" id="accountNumber" path="accountNumber" name="accountNumber" placeholder="Account Number will display here"/>
            </div>  
	          <button class="btn btn-success btn-lg btn-block">Submit</button>	
			  <a href="index.jsp" class="btn btn-primary btn-lg pull-right btn-home">Home</a>	
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