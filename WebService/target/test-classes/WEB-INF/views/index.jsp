<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log-in</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="/Emotion/resources/js/notify.js"></script>
	<script src="/Emotion/resources/js/notify.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<style>
.well-back{
	background-color:#E1E9F3;
}
.container-back{
	background-color:#464242;
}
.header-color{
	color:#337AB7;
}
</style>
	<script>
	var message = '${messageLog}';
	
	jQuery(document).ready(function(){
		jQuery('#username').focus(function(){
			jQuery('#invalid').text('');
		});
		
		if(message=='success'){
				jQuery.notify("Registration Successful!!!","success");	
			}
			
		else if(message=='fail'){
				jQuery.notify("Registration Failed!!! Try Again.","error");	
			}
	});
		
	</script>
</head>
<body class="container container-back">
	<div>
		<div class="col-md-12">
			<img src="../resources/images/login_image.jpg" height="300" width="100%" style='border:1px solid #000000'/>
			<br><br>
			<br><br>
		</div>
		<div class="col-md-12">
		<div class="col-md-6" ><div class="well well-back">
			<b>
			<p>Want to  be anonymous but still need our</p>
			<p>suggestions.Post your emotions <a href="#">here</a>
			</b></div>
			<div class="well well-back">
				<b><p>Posted a emotion earlier.Want to see response.Mention your Emotion Id here</p></b>
				<input type="text" id="searchId" placeholder="Search"/>
				<button type="submit" class="fa fa-search btn btn-primary" id="search"></button>
			</div>
		</div>
		<div class="col-md-6 well well-back">
			<form:form action="login" id="loginForm" class="form-horizontal" method="post" commandName="loginForm">
				<div class="form-group">
				    <form:label class="control-form:label col-md-5" for="email" path="">User Name:</form:label>
				    <div class="col-md-7">
				      <form:input type="text" class="form-control icon-user" id="username" placeholder="Username" path="userName" required="required"/>
				    </div>
				</div>
				<div class="form-group">
				    <form:label class="control-form:label col-md-5" for="password" path="">Password:</form:label>
				    <div class="col-md-7">
				      <form:input type="password" class="form-control" id="password" placeholder="Password" path="password" required="required"/>
				   <span class="text-danger" id="invalid">${errorMessage}</span>
				    </div>
				</div>
				<div class="form-group">
	    			<div class="col-md-offset-6 col-md-5">
	      				<button type="submit" class="btn btn-primary" id="login">Sign In</button>
	    			</div>
	  			</div>
	  			<p><b>Not a member <a href="http://localhost:8080/Emotion/Emotion/registerNewUser" id="registrationpage">Register Here</a></b></p>
			</form:form>
		</div>
		</div>
	</div>
</body>
</html>