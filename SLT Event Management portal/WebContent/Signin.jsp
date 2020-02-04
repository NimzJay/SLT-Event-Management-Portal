<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In | Event Management Portal</title>
<link rel="stylesheet" type="text/css" href="Styles\styles.css">
<link rel="icon" type="image/png" href="Pix\favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="lib/jquery-3.4.1.js"></script>
<script type="text/javascript" src="lib/jquery.validate.js"></script>
<script type="text/javascript" src="jQuery/LoginValidation.js"></script>
<link rel="stylesheet" type="text/css" href="Styles/validationLabel.css">

</head>
<body>
	<nav class="navbar navbar-expand-xl bg-light navbar-light sticky-top">
		<a class="navbar-brand" href="#"> <img src="Pix\favicon.png"
			width="40px" height="40px" class="d-inline-block align-top"
			alt="LOGO"> | <span>Event Management Portal</span>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar"
			style="text-align: center;">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-home pr-2"></i>Home &nbsp;</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-calendar-alt pr-2"></i>Calendar &nbsp;</a></li>
				<li class="nav-item"><a class="nav-link" href="event.html"><i
						class="fas fa-calendar-check pr-2"></i>Events &nbsp;</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-chair pr-2"></i>Seats &nbsp;</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-map-marked-alt pr-2"></i>Venues &nbsp;</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-phone pr-2"></i>Contact &nbsp; </a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-question-circle pr-2"></i>Help &nbsp; </a></li>
				<li class="nav-item active">&nbsp; &nbsp;<a
					class="btn btn-light text-secondary" href="Signin.jsp"><i
						class="fas fa-power-off"></i> Sing in </a>&nbsp; &nbsp;
				</li>
			</ul>
		</div>
	</nav>
	<div class="row no-gutters mh-100">
		<div id="" class="col-5"></div>
		<div id="" class="col-7">
			<img src="Pix/cover.png" alt="Login cover" class="img-fluid "
				style="max-height:auto; max-width:100%;">
		</div>
	</div>
</body>
</html>