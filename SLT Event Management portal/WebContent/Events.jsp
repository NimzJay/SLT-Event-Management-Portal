<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.time.LocalDate"%>

<%@page import="dbCon.DBconnection"%>
<%@page import="util.Session"%>

<%
	Statement st = null;
	ResultSet rs = null;
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Events | Event Management Portal</title>
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


</head>

<body>
	<%
				try {
					String sessionUser = Session.getUser();
					System.out.println("Event Session UN: " + sessionUser);
					LocalDate today = LocalDate.now();
				    System.out.println("Current date: "+ today);
					Connection con = DBconnection.getconn();
					st = con.createStatement();
					String sql = ("SELECT * FROM sltemp_event WHERE eDate >= '" + today + "'");
					rs = st.executeQuery(sql);
					while (rs.next()) {
						//String bt = rs.getString("bTitle");
						//Sesh.setbTitle(bt);
	%>
	<div id="" class="container-fluid" style="background-color: #0d022b;">
		<div class="row vh-100">

			<div id="" class="col-2 sidebar pr-0">
				<div style="padding: 20% 3% 10% 20%;" class="">
					<a id="brand" href="index.html"><img src="Pix\favicon.png"
						width="50px" height="50px" alt="LOGO"></a><br>
				</div>
				<div class="active" title="Home">
					<a href="index.html"><i style="padding-right: 14%;"
						class="fas fa-home"></i>Home</a>
				</div>
				<div>
					<a class="active" href="EventsUpcoming.jsp" title="Events"><i
						style="padding-right: 14%;" class="far fa-calendar-check"></i>Events</a>
				</div>
				<div>
					<a href="#calendar" title="Calendar"><i
						style="padding-right: 14%;" class="far fa-calendar-alt"></i>Calendar</a>
				</div>
				<div>
					<a href="#gallery" title="Gallery"><i
						style="padding-right: 14%;" class="fas fa-images"></i>Gallery</a>
				</div>
				<div>
					<a href="#contact" title="Contact Us"><i
						style="padding-right: 14%;" class="fas fa-phone"></i>Contact Us</a>
				</div>
				<div>
					<a href="#news" title="Help"><i style="padding-right: 14%;"
						class="far fa-question-circle"></i>Help</a>
				</div>
			</div>

			<div class="col event " style="background-color: white;">
				<div style="height: 10%;"
					class="row w-auto align-items-center p-4 d-flex bd-highlight justify-content-end">
					<div class="searchbar p-2 bd-highlight shadow-bottom">
						<input class="search_input align-middle" type="text" name=""
							placeholder="Search Events"> <a href="#"
							class="search_icon"><i class="fas fa-search"></i></a>
					</div>
					<!-- <a style="font-size: 10px; margin-left: 1%;" class="p-2  bell"
						href="" title="Notifications"><i class="far fa-bell fa-2x"></i></a>
					<a style="font-size: 10px; margin-left: 1%;" class="p-2  settings"
						href="" title="Settings"><i class="fas fa-cog fa-2x"></i></a> <a
						style="font-size: 10px; margin-left: 1%;" class="p-2  power"
						href="" title="Sign Out"><i class="fas fa-power-off fa-2x"></i></a> -->
				</div>
				<div class="px-5">
					<h2 class="mb-3" style="font-family: Calibri Light;">Events</h2>
					<ul class=" epill nav nav-pills mb-3" id="pills-tab" role="tablist">
						<li id="pill" class="nav-item pill-1 mx-2"><a
							class=" nav-link active rounded-5" id="pills-all-tab"
							data-toggle="pill" href="#pills-all" role="tab"
							aria-controls="pills-all" aria-selected="true">All</a></li>
						<li id="pill" class="nav-item pill-2 mx-2"><a
							class=" nav-link" id="pills-current-tab" data-toggle="pill"
							href="#pills-current" role="tab" aria-controls="pills-current"
							aria-selected="false">Current</a></li>
						<li id="pill" class="nav-item pill-3 mx-2"><a
							class=" nav-link" id="pills-upcoming-tab" data-toggle="pill"
							href="#pills-upcoming" role="tab" aria-controls="pills-upcoming"
							aria-selected="false">Upcoming</a></li>
						<li id="pill" class="nav-item pill-4 mx-2"><a
							class=" nav-link" id="pills-completed-tab" data-toggle="pill"
							href="#pills-completed" role="tab"
							aria-controls="pills-completed" aria-selected="false">Completed</a>
						</li>
					</ul>
					<div class="tab-content mx-4" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-all"
							role="tabpanel" aria-labelledby="pills-home-tab">Welcome
							back</div>
						<div class="tab-pane fade" id="pills-current" role="tabpanel"
							aria-labelledby="pills-profile-tab"><%=rs.getString("eName") %>

						</div>
						<div class="tab-pane fade" id="pills-upcoming" role="tabpanel"
							aria-labelledby="pills-contact-tab">tre</div>
						<div class="tab-pane fade" id="pills-completed" role="tabpanel"
							aria-labelledby="pills-contact-tab">tre</div>
					</div>

					<%
	}
	
	
}catch (Exception ex){
	System.out.println("Error" + ex);
	ex.printStackTrace();
	
	//<input type="button" value="Delete">
	 //<input type="button" value="Update"/>
}
%>

				</div>
			</div>

			<div id="" class="col-3 calendar "
				style="background-color: rgb(226, 219, 245);">
				<div style="height: 10%;"
					class="row align-items-center px-auto d-flex bd-highlight mb-3 mr-2 justify-content-end">
					<a style="font-size: 10px; margin-left: 1%;" class="p-2  bell"
						href="" title="Notifications"><i
						class="mt-2 far fa-bell fa-2x"></i></a> <a
						style="font-size: 10px; margin-left: 1%;" class="p-2  settings"
						href="" title="Settings"><i class="mt-2 fas fa-cog fa-2x"></i></a>
					<form class="settings logout" name="Logout" action="Logout"
						method="POST">
						<button class="btn settings" type="submit" value="" name="logout"
							title="Sign Out">
							<i style="font-size: 20px;"
								class="mt-2 fas fa-power-off fa-2x power"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
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