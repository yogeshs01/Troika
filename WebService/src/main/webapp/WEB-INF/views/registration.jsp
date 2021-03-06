<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="/Emotion/resources/js/notify.js"></script>
	<script src="/Emotion/resources/js/notify.min.js"></script>
<title>Register</title>
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
<script type="text/javascript">



$(document).ready(function(){
	
	var myarray = new Array(); 
	
	/* $.ajax({
		url : "C:/Users\VISHWAS\Desktop\abc.txt",
		dataType : "text",
		success : function(data){
			$(".text").append(data);
		}
	}); */
	
	if(jQuery('#supporter').prop('checked')==false){
				jQuery('#supporter-group').hide();
				jQuery('#text').hide();
		}
	
	jQuery('#supporter').click(function(){
		if(jQuery('#supporter').prop('checked')==true){
			jQuery('#supporter-group').show();
			jQuery('#text').show();
			jQuery('#userType').val('S');
		}
		else if(jQuery('#supporter').prop('checked')==false){
			jQuery('#supporter-group').hide();
			jQuery('#text').hide();
			jQuery('#userType').val('N');
		}
		
	});
	
	
	jQuery('#happy,#surprise,#sorry,#angry,#disgust,#blue,#sad,#embarrassed,#hurt').click(function(){
		var emotionId=jQuery(this).attr('id');
		if(jQuery('#'+emotionId).prop('checked')==true){
			 myarray.push($('#'+emotionId).val());
		}
		
		else if(jQuery('#'+emotionId).prop('checked')==false){
			var removeItem = jQuery('#'+emotionId).val();
			myarray = jQuery.grep(myarray, function(value) {
				  return value != removeItem;
				});
		}
		jQuery('#emotionList').val(myarray);
	});
	
	
	jQuery('#username').blur(function(){
		if(jQuery(this).val()!=""){
		$.ajax({
			url:'http://localhost:8080/Emotion/Emotion/checkUserExists',
			data:{
				userName:jQuery(this).val() 
			},
			method:'POST',
			success:function(data){
				if(data.userExists=='Y'){
					jQuery('#username-validator').text('user already exists');
				}
			},
			error:function(){
				
			}
		});
		}
		
	});
	
	function isValidEmailAddress(emailAddress) {
	    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
	    return pattern.test(emailAddress);
	};
	
	jQuery('#email').blur(function(){
		if(!isValidEmailAddress(jQuery('#email').val())){
			jQuery('#email-validator').text('Invalid email address');
		}
	});
	
	jQuery('#email').focus(function(){
			jQuery('#email-validator').text('');
	});
	
	jQuery('#username').focus(function(){
		jQuery('#username-validator').text('');
});
});


</script>
</head>
<body>
<div class="container-fluid container-back">
	<form:form action="register" method="post" commandName="userForm" class="form-horizontal" id="registrationForm">
		<form:input type="hidden" id="emotionList" path="emotionIdList"/>
		<form:input type="hidden" path="userType" id="userType"/>
	  <div class="form-group">
	    <h1><form:label class="control-form:label header-color" align="center" path="">Registration Form</form:label></h1>
	  </div>
	  <div class="well well-back">
		  <div class="form-group">
		    <form:label class="control-form:label col-md-5" for="email" path="">User Name:</form:label>
		    <div class="col-md-2">
		      <form:input type="text" class="form-control" id="username" path="userName" placeholder="Username" required="required"/>
		      <span id="username-validator" class="text-danger"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <form:label class="control-form:label col-md-5" for="password" path="">Password:</form:label>
		    <div class="col-md-2"> 
		      <form:input type="password" class="form-control" id="password" path="password" placeholder="Password" required="required"/>
		    </div>
		  </div>
		  <div class="form-group">
		    <form:label class="control-form:label col-md-5" for="email" path="">Email:</form:label>
		    <div class="col-md-2">
		      <form:input type="text" class="form-control" id="email" path="emailId" placeholder="Email" required="required"/>
		      <span class="text-danger" id="email-validator"></span>
		    </div>
		  </div>
		  <div class="form-group">
		  	<div class="col-md-4"><form:label class="checkbox-inline" path=""><input type="checkbox" value="" id="supporter" ><b>Supporter</b></form:label></div>
		  </div>
	  </div>
	  <div class="well well-back" id="text"><b>
	  	<p>Would you like to help others by providing your suggestions.If you think so, Please </p>
	  	<p>select among the categories you will like to help others.</p>
	  	<p>Please select emotion categories you will like to help with.Please be sensible while</p>
	  	<p>replying to emotions</p></b>
	  </div>
	  <div class="well well-back" id="supporter-group">
	  <div class="row">
		  <div class="col-md-4"><form:label class="checkbox-inline" path=""><input type="checkbox" value="1" id="happy" ><b>Happy</b></form:label></div>
		   <div class="col-md-4"><form:label class="checkbox-inline" path=""><input type="checkbox" value="2" id="surprise" ><b>Surprised</b></form:label></div>
		   <div class="col-md-4"><form:label class="checkbox-inline" path=""><input type="checkbox" value="3" id="sorry" ><b>Sorry</b></form:label></div>
	  </div>
	   <div class="row">
		  <div class="col-md-4"><form:label class="checkbox-inline" path=""><input type="checkbox" value="4" id="angry" ><b>Angry</b></form:label></div>
		  <div class="col-md-4"><form:label class="checkbox-inline" path=""><input type="checkbox" value="5" id="disgust" ><b>Disgust</b></form:label></div>
		  <div class="col-md-4"><form:label class="checkbox-inline" path=""><input type="checkbox" value="6" id="blue" ><b>Feeling Blue</b></form:label></div>
	  </div>
	   <div class="row">
		  <div class="col-md-4"><form:label class="checkbox-inline" path=""><input type="checkbox" value="7" id="sad" ><b>Sad</b></form:label></div>
		  <div class="col-md-4"><form:label class="checkbox-inline" path=""><input type="checkbox" value="8" id="embarrassed" ><b>Embarrassed</b></form:label></div>
		  <div class="col-md-4"><form:label class="checkbox-inline" path=""><input type="checkbox" value="9" id="hurt" ><b>Hurt</b></form:label></div>
	  </div>
	  </div>
	  <div class="form-group"> 
	    <div class="col-md-offset-4 col-md-5">
	      <button type="submit" class="btn btn-primary" id="save">Save</button>
	    </div>
	  </div>
	</form:form>
	</div>
</body>
</html>