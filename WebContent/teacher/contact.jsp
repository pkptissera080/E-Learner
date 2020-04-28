<%@page import="common.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
if ((session.getAttribute("user_type")) == null || !(session.getAttribute("user_type")).equals("teacher")) {
	out.println("<script type=\"text/javascript\">");
	out.println("location='../index.jsp';");
	out.println("</script>");
} else {

}
%>
<!DOCTYPE html>
<html>
<title>E learner</title>
<meta charset="UTF-8">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="../images/logo/logo.png" />
<!--===============================================================================================-->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">
<!--===============================================================================================-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

<style>
.w3-sidebar a {
	font-family: "Roboto", sans-serif
}

body, h1, h2, h3, h4, h5, h6, .w3-wide {
	font-family: "Montserrat", sans-serif;
}
</style>

<body class="w3-content" style="max-width: 1200px">

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top"
		style="z-index: 3; width: 250px" id="mySidebar">
		<div class="w3-container w3-display-container w3-padding-16">
			<i onclick="w3_close()"
				class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
			<h3 class="w3-wide">
				<div class="title cp" onclick="loadHome()">
					<center>
						<img src="../images/logo/logo.png"
							style="width: 70px; height: 70px;"><br> <label><b
							class="e_ltr">E</b> Learner</label>
					</center>
				</div>
			</h3>
		</div>
		
		<a href="index.jsp" class="w3-bar-item w3-button w3-padding ">Home</a>
		<a href="contact.jsp" class="w3-bar-item w3-button w3-padding w3-blue">Contact</a>
	</nav>

	<!-- Top menu on small screens -->
	<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
		<div class="w3-bar-item w3-padding-24 w3-wide">
			<div class="titlesml">
				<center>
					<img src="../images/logo/logo.png"
						style="width: 30px; height: 30px; margin-right: 10px;"> <label><b
						class="e_ltrsml">E</b> Learner</label>
				</center>
			</div>
		</div>
		<a href="javascript:void(0)"
			class="w3-bar-item w3-button w3-padding-24 w3-right"
			onclick="w3_open()"><i class="fa fa-bars"></i></a>
	</header>


	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 250px">

		<!-- Push down content on small screens -->
		<div class="w3-hide-large" style="margin-top: 83px"></div>

		<!-- Top header -->
		<header class="w3-container w3-xlarge">
			<p class="w3-right">
				<label class="w3-margin-right"><%=session.getAttribute("user_username")%></label>
				<img src="../images/avatar3.png" alt="avatar"
					class="useravatar w3-margin-right"> <i
					class="fa fa-sign-out cp" title="logout" onclick="logout()"></i>
			</p>

		</header>


		<div style="min-height: 700px;">
		<div class="w3-container" id="contact">
			<h2>Contact</h2>
			<p>If you have any questions, do not hesitate to ask them.</p>
			<i class="fa fa-map-marker w3-text-red" style="width: 30px"></i>
			flower street,colombo 7<br> <i class="fa fa-phone w3-text-red"
				style="width: 30px"></i> Phone: +00 151515<br> <i
				class="fa fa-envelope w3-text-red" style="width: 30px"> </i> Email:
			info@elerner.com<br>
			<form action="../sendMessageServlet" method="POST">
				<p>
					<input class="w3-input w3-padding-16 w3-border" type="text"
						placeholder="Name" readonly name="name" value="<%=session.getAttribute("user_username")%>">
						<input class="w3-input w3-padding-16 w3-border dnone" type="text"
						placeholder="type" readonly name="type" value="<%=session.getAttribute("user_type")%>">
				</p>
				<p>
					<input class="w3-input w3-padding-16 w3-border" type="text"
						placeholder="Email" readonly name="email" value="<%=session.getAttribute("user_email")%>">
				</p>
				<p>
					<input class="w3-input w3-padding-16 w3-border" type="text"
						placeholder="Message" required name="message" minlength="10">
				</p>
				<p>
					<button class="w3-button w3-black w3-padding-large" type="submit">SEND
						MESSAGE</button>
				</p>
			</form>
		</div>
		</div>



		<div class="w3-black w3-center w3-padding-24">
			<i class="fab fa-facebook-f mright"></i><i class="fas fa-envelope mright"></i><i class="fab fa-instagram mright"></i>
		</div>

		<!-- End page content -->
	</div>


	<script type="text/javascript" src="js/main.js"></script>

</body>
</html>
