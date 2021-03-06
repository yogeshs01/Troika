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
<title>Create Emotion</title>
</head>
<style>
.well-back{
	background-color:#ffffff;
}
.container-back{
	background-color:#ffffff;
}
.header-color{
	color:#337AB7;
}
</style>
<body>
<div class="container-fluid container-back">
	<form:form action="createEmotion" method="post" commandName="createEmotionForm" class="form-horizontal" id="createEmotionForm">
	  <div class="form-group">
	  	<div>
	  		<h1><b class="header-color">Create Emotion</b></h1>
	  	</div>
	    <div class="col-md-offset-11 col-md-2">
	      <button type="submit" class="btn btn-primary" id="save">Save</button>
	    </div>
	  </div>
	  <div class="well well-back" id="emotion-group">
	  <div class="row">
		  <div class="col-md-4"><label class="radio-inline"><input name="radioGroup" type="radio" value="1" id="happy" checked><b>Happy</b></label></div>
		   <div class="col-md-4"><label class="radio-inline"><input type="radio" name="radioGroup" value="2" id="surprise" ><b>Surprised</b></label></div>
		   <div class="col-md-4"><label class="radio-inline"><input type="radio" name="radioGroup" value="3" id="sorry" ><b>Sorry</b></label></div>
	  </div>
	   <div class="row">
		  <div class="col-md-4"><label class="radio-inline"><input type="radio" name="radioGroup" value="4" id="angry" ><b>Angry</b></label></div>
		  <div class="col-md-4"><label class="radio-inline"><input type="radio" name="radioGroup" value="5" id="disgust" ><b>Disgust</b></label></div>
		  <div class="col-md-4"><label class="radio-inline"><input type="radio" name="radioGroup" value="6" id="blue" ><b>Feeling Blue</b></label></div>
	  </div>
	   <div class="row">
		  <div class="col-md-4"><label class="radio-inline"><input type="radio" name="radioGroup" value="7" id="sad" ><b>Sad</b></label></div>
		  <div class="col-md-4"><label class="radio-inline"><input type="radio" name="radioGroup" value="8" id="embarrassed" ><b>Embarrassed</b></label></div>
		  <div class="col-md-4"><label class="radio-inline"><input type="radio" name="radioGroup" value="9" id="hurt" ><b>Hurt</b></label></div>
	  </div>
	  </div>
	  <div class="well well-back" id="type-group">
	  <div class="row">
		  <div class="col-md-4"><label class="radio-inline"><input type="radio" name="radioGroup2" value="0" id="public" ><b>Public</b></label></div>
		  <div class="col-md-4"><label class="radio-inline"><input type="radio" name="radioGroup2" value="1" id="private" checked><b>Private</b></label></div>
	  </div>
	  <div class="row">
	  	<div class="col-md-4"><label class="checkbox-inline" ><input type="checkbox" value="1" id="seekhelp" checked><b>SeekHelp</b></label></div>
	  </div>
	  </div>
	  <div class="well well-back">
	  	<textarea class="form-control" rows="7"></textarea>
	  </div>

	</form:form>
	</div>
</body>
</html>