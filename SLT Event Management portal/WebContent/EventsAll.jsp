<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.time.LocalDate"%>
<%@page import= "java.text.SimpleDateFormat"%>
<%@page import= "java.util.Arrays"%>
<%@page import="dbCon.DBconnection"%>
<%@page import="util.Session"%>
<%@page import="util.MonthGet"%>

<%@page import="java.util.Calendar" %>

<%
	Statement st = null;
	ResultSet rs = null;
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>All Events | Event Management Portal</title>
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

<body style="background-color: #0d022b;">
	<%
		try {
		
			Calendar now = Calendar.getInstance();

			SimpleDateFormat format = new SimpleDateFormat("dd");

			String[] days = new String[7];
			int delta = -now.get(Calendar.DAY_OF_WEEK) + 2; //add 2 if your week start on monday
			now.add(Calendar.DAY_OF_MONTH, delta);
			for (int i = 0; i < 7; i++) {
				days[i] = format.format(now.getTime());
				now.add(Calendar.DAY_OF_MONTH, 1);
			}
			System.out.println(Arrays.toString(days));
			
			
			
			int i = 0;
			String[] color = { "#FF5757", "#F0A000", "#E00083", "#009DE6" };

			String sessionUser = Session.getUser();
			System.out.println("Event Session UN: " + sessionUser);

			LocalDate today = LocalDate.now();
			//System.out.println("Current date: " + today);
			String dd = today.getDayOfWeek().toString();
			System.out.println("Current day: " + dd);

			Connection con = DBconnection.getconn();
			st = con.createStatement();
			String sql = ("SELECT * FROM sltemp_event");
			rs = st.executeQuery(sql);
	%>
	<div id="" class="container-fluid" style="background-color: #0d022b;">
		<div class="row vh-100">

			<div id="" class="col-2 sidebar pr-0 ">
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

				<div class="px-5 ">
					<h2 class="mb-3" style="font-family: Calibri Light;">All
						Events</h2><br>
					<div class="row no-gutters">
						<div class="col-12">
							<a href="EventsAll.jsp"
								class="navlinks active text-center mx-auto py-1 px-3 my-2">All</a> 
						
							<a href="EventsUpcoming.jsp"
								class="navlinks text-center mx-auto py-1 px-3 my-2">Upcoming</a>
						
							<a href="EventsCompleted.jsp"
								class="navlinks text-center mx-auto py-1 px-3 my-2">Completed</a>
						</div>
					</div>
					<br>
					<div id="events" class="row">
						<%
							while (rs.next()) {
								// Creating Calendar class instance.
								Calendar calendar = Calendar.getInstance();
								// Converting Date to Calendar.
								calendar.setTime(rs.getDate("eDate"));
								int month = calendar.get(Calendar.MONTH);
								String monthName = MonthGet.getMonthName(month);
								int year = calendar.get(Calendar.YEAR);
								int day = calendar.get(Calendar.DATE);
						%>
						<script>
								
							var innerDiv = document.createElement('div');
							innerDiv.classList.add("cont","shadow","col-lg-3","col-md-10","py-2","my-2","pt-3","mr-3","pl-4");
							innerDiv.style.backgroundColor = "<%=color[i]%>";
							innerDiv.id = "grad1"
													
							document.getElementById("events").appendChild(innerDiv);
							
							innerDiv.innerHTML = 
								'<h4 style="margin-bottom:-1%;"><%=rs.getString("eName")%></h1><br>'
								+'<p><i style="padding-right: 4%;" class="far fa-calendar-alt"></i><%=day%>&nbsp;<%=monthName%>&nbsp;<%=year%></P>'
								+'<p><i style="padding-right: 4%;" class="fas fa-map-marker-alt"></i><%=rs.getString("eVenue")%></p>'
								+''
								+''
								+'';
								
								
						</script>

						<% i += 1; } %>


					</div>
				</div>
			</div>

			<div class="col-3 calendar "
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
				<div class="subCont">
					<div class="row table pt-3 mx-auto px-3 no-gutters"
						style="height: 100%;">

						<p class="col-12"><%=today.getMonth()%>&nbsp;&nbsp;<%=today.getYear()%></p>
						<br>
						<script>
						
						var dd = '<%=dd%>';
													
							if (dd == "MONDAY") {
								document.getElementById("mon").style.backgroundColor = "#f8bc07"
								document.getElementById("mon").style.color = "white"
								
							} else if (dd == "TUESDAY") {
								document.getElementById("tue").style.backgroundColor = "#f8bc07"
								document.getElementById("tue").style.color = "white"
							
							} else if (dd == 'WEDNESDAY') {
								document.getElementById("wed").style.backgroundColor = "#f8bc07"
								document.getElementById("wed").style.color = "white"
							
							} else if (dd == "THURSDAY") {
								document.getElementById("thu").style.backgroundColor = "#f8bc07"
								document.getElementById("thu").style.color = "white"
							
							} else if (dd == "FRIDAY") {
								document.getElementById("fri").style.backgroundColor = "#f8bc07"
								document.getElementById("fri").style.color = "white"
							
							} else if (dd == "SATURDAY") {
								document.getElementById("sat").style.backgroundColor = "#f8bc07"
								document.getElementById("sat").style.color = "white"
							
							} else if (dd == "SUNDAY") {
								document.getElementById("sun").style.backgroundColor = "#f8bc07"
								document.getElementById("sun").style.color = "white"
							
							} else {

							
							}
						
						</script>
												
						<div id="mon"  class="col-2 week mx-auto text-center shadow m-2 py-2"
							style="width: 11%; flex: 0 0 11%; max-width: 11%;">
							<a href="#" title="Monday" data-value="1"><%=days[0]%></a><br>
							<span class="week">M</span>
						</div>

						<div id="tue" class="col-2 week mx-auto text-center shadow m-2 py-2"
							style="width: 11%; flex: 0 0 11%; max-width: 11%;">
							<a href="#" title="Tuesday" data-value="2"><%=days[1]%></a><br>
							<span class="week">T</span>
						</div>

						<div id="wed" class="col-2 week mx-auto text-center shadow m-2 py-2"
							style="width: 11%; flex: 0 0 11%; max-width: 11%;">
							<a href="#" title="Wednesday" data-value="3"><%=days[2]%></a><br>
							<span class="week">W</span>
						</div>

						<div id="thu" class="col-2 week mx-auto text-center shadow m-2 py-2"
							style="width: 11%; flex: 0 0 11%; max-width: 11%;">
							<a href="#" title="Thursday" data-value="4"><%=days[3]%></a><br>
							<span class="week">T</span>
						</div>

						<div id="fri" class="col-2 week mx-auto text-center shadow m-2 py-2"
							style="width: 11%; flex: 0 0 11%; max-width: 11%;">
							<a href="#" title="Friday" data-value="5"><%=days[4]%></a><br>
							<span class="week">F</span>
						</div>

						<div id="sat" class="col-2 week mx-auto text-center shadow m-2 py-2"
							style="width: 11%; flex: 0 0 11%; max-width: 11%;">
							<a href="#" title="Saturday" data-value="6"><%=days[5]%></a><br>
							<span class="week">S</span>
						</div>

						<div id="sun" class="col-2 week mx-auto text-center shadow m-2 py-2"
							style="width: 11%; flex: 0 0 11%; max-width: 11%;">
							<a href="#" title="Sunday" data-value="7"><%=days[6]%></a><br>
							<span class="week">S</span>
						</div>

					</div>
					<div class="row" style="height: 100%;">
						<div style="padding-top: 15%;"
							class="col-12 no-gutters align-self-end">
							<img src="Pix/al.png"
								style="height: 100%; width: 100%; background-size: cover;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%
		} catch (Exception ex) {
			System.out.println("Error" + ex);
			ex.printStackTrace();
		}
	%>

</body>

</html>