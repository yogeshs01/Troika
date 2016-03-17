<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home Page</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/home.css" />

<script type="text/javascript">
var userId='${userId}';
$(document).ready(function(){
	
	jQuery("#createEmotion").click(function(){
		
		jQuery('.col-lg-12').load('createEmotion');
	})
	
});

</script>
</head>
<body>

   <nav class="navbar-band navbar-header-color no-margin">
   				<img class="navbar-image" alt="" src="../resources/images/login_image.jpg" height="70" width="250" style='border:1px solid #000000'>
                <span class="navbar-user" href="#">Welcome ${userName}</span>

    </nav>
    <div id="wrapper">
        <div id="sidebar-wrapper" style="height:100%;">
            <ul class="sidebar-nav nav-pills nav-stacked" id="menu">
 
                <li class="active">
                    <a href="#" id="createEmotion"><span class="fa-stack fa-lg pull-left"><i class="fa fa-dashboard fa-stack-1x "></i></span> Create Emotion</a>
                </li>
                <li>
                    <a href="#" id="myEmotions"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x "></i></span> My Emotion</a>
                </li>
                <li>
                    <a href="#" id="support"><span class="fa-stack fa-lg pull-left"><i class="fa fa-server fa-stack-1x "></i></span>Support</a>
                </li>
                <li>
                    <a href="#" id="myAccount"> <span class="fa-stack fa-lg pull-left"><i class="fa fa-wrench fa-stack-1x "></i></span>My Account</a>
                </li>
            </ul>
        </div>
                <div class="row">
                    <div class="col-lg-12">
						<jsp:include page="/WEB-INF/views/createEmotion.jsp"/>
                    </div>
                </div>
    </div>
</body>
</html>