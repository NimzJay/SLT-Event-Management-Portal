<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Arrays"%>
<%@page import="dbCon.DBconnection"%>
<%@page import="util.Session"%>

<%
	String driverName = "com.mysql.jdbc.Driver";

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException ex) {
		System.out.println("Error" + ex);
		ex.printStackTrace();

	}

	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Invitee List | Event Management Admin Portal</title>
<link rel="stylesheet" type="text/css" href="Styles\styles.css">
<link rel="stylesheet" type="text/css" href="Styles\admin.css">
<link rel="stylesheet" type="text/css" href="Styles\user.css">
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

<body style="background-color: #0d022b;">

	<div id="" class="container-fluid" style="background-color: #0d022b;">
		<div class="row vh-100">

			<div id="" class="col-2 sidebar pr-0">
				<div style="padding: 30% 0% 0% 30%;" class="">
					<a id="brand" href="index.html"><img src="Pix\favicon.png"
						width="30px" height="30px" alt="LOGO"></a>
				</div>
				<div>
					<a href="EventAdd.jsp"><i style="padding-right: 14%;"
						class="far fa-calendar-plus"></i>Event Add</a>
				</div>
				<div>
					<a href="EventUpdate.jsp"><i style="padding-right: 14%;"
						class="fas fa-edit"></i>Event Update</a>
				</div>
				<div>
					<a href="EventDelete.jsp"><i style="padding-right: 14%;"
						class="far fa-calendar-times"></i>Event Delete</a>
				</div>
				<div>
					<a href="EventView.jsp"><i style="padding-right: 14%;"
						class="far fa-calendar-alt"></i>Event View</a>
				</div>
				<div>
					<a href="InviteeAdd.jsp"><i style="padding-right: 14%;"
						class="fas fa-user-plus"></i>Invitee Add</a>
				</div>
				<div>
					<a href="InviteeUpdate.jsp"><i style="padding-right: 14%;"
						class="fas fa-user-edit"></i>Invitee Update</a>
				</div>
				<div>
					<a href="InviteeDelete.jsp"><i style="padding-right: 14%;"
						class="fas fa-user-times"></i>Invitee Delete</a>
				</div>
				<div>
					<a class="active" href="InviteeView.jsp"><i
						style="padding-right: 14%;" class="fas fa-users"></i>Invitee List</a>
				</div>
				
			</div>

			<div class="col-10 event " style="background-color: white;">
				<div style="height: 10%;"
					class="row w-auto align-items-center p-4 d-flex bd-highlight justify-content-end">
					<div class="searchbar p-2 bd-highlight shadow-bottom">
						<input class="search_input align-middle" type="text" name=""
							placeholder="Search Events"> <a href="#"
							class="search_icon"><i class="fas fa-search"></i></a>


					</div>
					<a style="font-size: 10px; margin-left: 1%;" class="p-2  bell"
						href="" title="Notifications"><i class="far fa-bell fa-2x"></i></a>
					<a style="font-size: 10px; margin-left: 1%;" class="p-2  settings"
						href="" title="Settings"><i class="fas fa-cog fa-2x"></i></a>
					<form class="settings logout" name="Logout" action="Logout"
						method="POST">
						<button class="btn settings" type="submit" value="" name="logout"
							title="Sign Out">
							<i style="font-size: 20px;"
								class="mt-2 fas fa-power-off fa-2x power"></i>
						</button>
					</form>

				</div>
				<div class="px-5 mx-4">
					<h2 class="" style="font-family: Calibri Light;">Invitee List</h2>
					<div class="forms table-wrapper-scroll-y">
						<table class="table table-responsive table-hover">
							<thead>
								<tr>
									<th scope="col">uid</th>
									<th scope="col">First Name</th>
									<th scope="col">Last Name</th>
									<th scope="col">Username</th>
									<th scope="col">Password</th>
									<th scope="col">Email</th>
									<th scope="col">NIC</th>
									<th scope="col">Mobile</th>
									<th scope="col">User Type</th>
								</tr>
							</thead>
							<%
								try {
									con = DBconnection.getconn();
									st = con.createStatement();
									String sql = ("SELECT * from sltemp_user");

									rs = st.executeQuery(sql);
									while (rs.next()) {
							%>
							<tbody>
								<tr>
									<td scope="row"><%=rs.getString("uid")%></td>
									<td><%=rs.getString("fname")%></td>
									<td><%=rs.getString("lname")%></td>
									<td><%=rs.getString("username")%></td>
									<td><%=rs.getString("password")%></td>
									<td><%=rs.getString("email")%></td>
									<td><%=rs.getString("nic")%></td>
									<td><%=rs.getString("mobile")%></td>
									<td><%=rs.getString("userType")%></td>
								</tr>
							</tbody>
							<%
								}
								} catch (Exception ex) {
									System.out.println("Error" + ex);
									ex.printStackTrace();
								}
							%>
						</table>

					</div>
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