<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up | Event Management Portal</title>
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
<script type="text/javascript" src="jQuery/RegisterValidation.js"></script>
<link rel="stylesheet" type="text/css" href="Styles/validationLabel.css">

</head>
<body>
	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-xl bg-transparent navbar-light">
		<a class="navbar-brand" href="index.html"> <img src="Pix\favicon.png" width="40px" height="40px"
				class="d-inline-block" alt="LOGO"> | <span
				style="font-size: 20pt; font-family:Calibri Light; font-style:italic; letter-spacing: 2px;;">SLT Event
				Management Portal</span>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar" style="text-align: center;">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item pr-3"><a id="btnav" class="nav-link" href="index.html"><i
							class="fas fa-home pr-2"></i>Home &nbsp;</a></li>
				<li class="nav-item pr-2"><a id="btnav" class="nav-link" href="EventsUpcoming.jsp"><i
							class="fas fa-calendar-check pr-2"></i>Events &nbsp;</a></li> 
				<li class="nav-item pr-3"><a id="btnav" class="nav-link" href="Calendar.jsp"><i class="fas fa-calendar-alt pr-2"></i>Calendar
						&nbsp;</a></li>
				<li class="nav-item pr-3"><a id="btnav" class="nav-link" href="#"><i class="fas fa-images pr-2"></i>Gallery
						&nbsp;</a></li>	
				<li class="nav-item"><a id="btnav" class="nav-link" href="#"><i class="fas fa-phone pr-2"></i>Contact Us&nbsp; </a>
				</li>
				<li class="nav-item active">&nbsp; &nbsp;<a id="btnav" class="btn btsi text-secondary btn-transparent bg-transparent"
						href="Signin.jsp"><i class="fas fa-power-off"></i> Sign in </a>&nbsp;
					&nbsp;
				</li>
			</ul>
		</div>
	</nav>
	<!-- Main Container -->
	<div class="row no-gutters align-items-center"
		style="background-image: url('https://i.pinimg.com/originals/1b/6f/e3/1b6fe372cd27b74088c5164beb60b2ca.png'); background-size: cover 100%; background-repeat: no-repeat;">
		<div class="col-md-5 shadow signup"
			style="padding: 2% 7% 2% 7%; background-color: rgba(255, 255, 255, 0.9);">
			<h4 class="display-4">Sign Up</h4>
			<h5 class="display-5"
				style="color: rgb(158, 157, 157); letter-spacing: 2px; font-family: Calibri;">Please&nbsp;Enter&nbsp;your&nbsp;Details!</h5>
			
			<!-- Login Form -->
			<form id="register" action="Register" method="POST">
				<div class="form-row">
					<div class="col">
						<label for="inputEmail4">Name</label>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<input type="text" class="form-control" name="fname"
							placeholder="First name">
					</div>
					<div class="form-group col-md-6">
						<input type="text" class="form-control" name="lname"
							placeholder="Last name">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="inputEmail4">Username</label> <input type="text"
							class="form-control" name="user">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="inputPassword4">Password</label> <input
							type="password" class="form-control" id="pass"
							placeholder="Password" name="pass">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<input type="password" class="form-control" id="repass"
							placeholder="Confirm Password" name="repass">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="inputAddress">Email</label> <input type="email"
							class="form-control" id="inputEmail"
							placeholder="johndoe@example.com" name="email">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="inputAddress">NIC</label> <input type="text"
							class="form-control" id="nic"
							placeholder="987654321V" name="nic">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="inputAddress">Phone</label> <input type="text"
							class="form-control" id="inputPhone" name="phone"
							placeholder="0777123456">
					</div>
				</div>
				
				<div class="form-row">
					<div class="form-group col-md-6">
						<input type="submit" class="btn btn-primary btn-block"
							value="Sign in">
					</div>
					<div class="form-group col-md-6">
						<input type="reset" value="Reset"
							class="btn btn-primary btn-block">
					</div>
					<br>
					<p>
						Already a Member? &nbsp;<a href="Signin.jsp">Sign In</a>
					</p>
					
				</div>
			</form>
		</div>
		<div class="col-md-6"></div>
	</div>

	<!-- Footer -->
	<footer class="page-footer font-small unique-color-dark"
		style="background-color: #0d022b; border-top-left-radius: 40px; border-top-right-radius: 40px;">
		<div class="shadow" style="background-color: #ffae3c;">
			<div class="container">
				<div class="row py-3 d-flex align-items-center">
					<div
						class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
						<h6 class="mb-0">Get Connected with Us on Social Networks!</h6>
					</div>
					<div class="col-md-6 col-lg-7 text-center text-md-right medias">
						<!-- Facebook -->
						<a href="https://www.facebook.com/SLtelecom" class="fb-ic"
							target="_blank"> <i
							class="fab fa-facebook-square white-text mr-3 fa-2x"> </i>
						</a>
						<!-- Twitter -->
						<a href="https://twitter.com/SriLankaTelecom" class="tw-ic"
							target="_blank"> <i
							class="fab fa-twitter-square white-text mr-3 fa-2x"> </i>
						</a>
						<!-- Google +-->
						<a href="https://plus.google.com/+srilankatelecom"
							class="gplus-ic" target="_blank"> <i
							class="fab fa-google-plus-square white-text mr-3 fa-2x"></i>
						</a>
						<!--Linkedin -->
						<a href="https://www.linkedin.com/company/sri-lanka-telecom"
							class="li-ic" target="_blank"> <i
							class="fab fa-linkedin white-text mr-3 fa-2x"> </i>
						</a>
						<!--Youtube-->
						<a href="https://www.youtube.com/user/srilankatelecom"
							class="yt-ic" target="_blank"> <i
							class="fab fa-youtube-square white-text fa-2x"> </i>
						</a>
					</div>
				</div>
			</div>
		</div>
		<br>

		<!-- Copyright -->
		<div class="footer-copyright text-center py-0.5"
			style="color: #eee; background-color: #0d022b; font-size: small;">
			<a href="index.html" style="color: #eee; text-decoration: none;">
				<img src="Pix/favicon.png" width="80px" height="80px" alt="Logo">
			</a><br> <br>Copyright &copy; 2020 &nbsp;-&nbsp; Sri Lanka
			Telecom PLC &nbsp; All rights reserved. <br> <br> <br>
		</div>
	</footer>
</body>
</html>