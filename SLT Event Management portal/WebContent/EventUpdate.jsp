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
	String nic = request.getParameter("nic");
	String driverName = "com.mysql.jdbc.Driver";

	//Connection con = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Event Update | Event Management Admin Portal</title>
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
					<a class="active" href="EventUpdate.jsp"><i
						style="padding-right: 14%;" class="fas fa-edit"></i>Event
						Update</a>
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
					<a href="InviteeView.jsp"><i style="padding-right: 14%;"
						class="fas fa-users"></i>Invitee List</a>
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
					<h2 class="" style="font-family: Calibri Light;">Update Event
					</h2>
					<div class="forms">
						<div class="forms">
							<form class="EventUpdate" method="POST" name="admin">
								<div class="form-row">
									<div class="form-group col-sm-2">
										<label for="inputEmail4">Event ID</label>
									</div>
									<div class="form-group col-sm-4">
										<input class="form-control form-control-sm" type="text"
											id="eeid" name="eeid" required />
									</div>
									<div class="form-group col-sm-3">
										<input class="btn btn-primary" type="submit" value="Search"
											name="btnAdd">
									</div>
									<%
										String eeid = request.getParameter("eeid");
										Session.setEid(eeid);
									%>
								</div>
							</form>
						</div>

						<%
								System.out.println("Admin: " + eeid);
								try {
									String sql = ("SELECT * FROM sltemp_event WHERE eid = '" + eeid + "'");
									Connection con = DBconnection.getconn();
									PreparedStatement st = con.prepareStatement(sql);
									ResultSet rs = st.executeQuery(sql);
									while (rs.next()) {
							%>
						<form id="register" action="EventUpdate" method="POST"
							name="admin">
							<div class="form-row">
								<div class="form-group col-sm-3">
									<label for="inputEmail4">Event Name</label>
								</div>
								<div class="form-group col-sm-8">
									<input type="text" class="form-control form-control-sm"
										name="ename" value="<%=rs.getString("eName")%>" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-sm-3">
									<label for="inputPassword4">Event Type</label>
								</div>
								<div class="form-group col-sm-8">
									<input type="text" class="form-control form-control-sm"
										id="etype" name="etype" value="<%=rs.getString("eType")%>"
										required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-sm-3">
									<label for="inputAddress">Event Description</label>
								</div>
								<div class="form-group col-sm-8">
									<input type="text" class="form-control form-control-sm"
										id="edesc" name="edesc" value="<%=rs.getString("eDesc")%>"
										required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-sm-3">
									<label for="inputAddress">Event Venue</label>
								</div>
								<div class="form-group col-sm-8">
									<input type="text" class="form-control form-control-sm"
										id="venue" value="<%=rs.getString("eVenue")%>" name="venue"
										required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-sm-3">
									<label for="inputAddress">Venue Capacity</label>
								</div>
								<div class="form-group col-sm-8">
									<input type="text" class="form-control form-control-sm"
										id="capacity" name="capacity"
										value="<%=rs.getString("capacity")%>" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-sm-3">
									<label for="inputAddress">Event Date</label>
								</div>
								<div class="form-group col-sm-8">
									<input type="date" class="form-control form-control-sm"
										id="edate" name="edate" value="<%=rs.getString("eDate")%>"
										required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-sm-3">
									<label for="inputAddress">Start Time</label>
								</div>
								<div class="form-group col-sm-8">
									<input type="text" class="form-control form-control-sm"
										id="stime" name="stime" value="<%=rs.getString("startTime")%>"
										required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-sm-3">
									<label for="inputAddress">End Time</label>
								</div>
								<div class="form-group col-sm-8">
									<input type="text" class="form-control form-control-sm"
										id="etime" name="etime" value="<%=rs.getString("endTime")%>"
										required>
								</div>
							</div>
							<br>
							<div class="form-row">
								<div class="form-group col-md-3"></div>

								<div class="form-group col-md-3">
									<input type="submit" class="btn btn-primary btn-block"
										value="Update Event">
								</div>
								<div class="form-group col-md-3">
									<input type="reset" value="Reset"
										class="btn btn-primary btn-block">
								</div>
							</div>
							<%
									}
									} catch (Exception ex) {
										System.out.println("Error: " + ex);
										ex.printStackTrace();
									}
								%>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div><br><br><br>



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