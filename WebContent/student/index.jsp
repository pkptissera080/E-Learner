<%@page import="common.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
	if ((session.getAttribute("user_type")) == null || !(session.getAttribute("user_type")).equals("student")) {
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

		<div class="w3-padding-64 w3-large w3-text-grey"
			style="font-weight: bold">
			<a href="index.jsp" class="w3-bar-item w3-button w3-blue w3-padding">Home</a>
			<%
				for (int i = 6; i <= 11; i += 1) {
			%>
			<button class="w3-bar-item w3-button"
				style="font-weight: normal; padding-left: 30px;"
				onclick="myAccFunc(<%=i%>)" id="grd<%=i%>">
				Grade
				<%=i%><i class="fas fa-angle-down mleft"></i>
			</button>
			<div id="demoAcc<%=i%>"
				class="w3-bar-block w3-hide w3-padding-large w3-medium">
				<%
					try {
					Statement statement = null;
					ResultSet resultSet = null;
					Integer rowcount = 0;

					DB_Connection obj_DB_Connection = new DB_Connection();
					Connection connection = obj_DB_Connection.get_connection();
					statement = connection.createStatement();
					String sql = "SELECT * FROM sub_tbl";

					resultSet = statement.executeQuery(sql);
					while (resultSet.next()) {

						if (resultSet.getString("sub_grade").equals("Grade " + i + "")) {
					rowcount++;
				%>
				<form action="viewsubject.jsp" method="GET">
					<button type="submit" class="w3-bar-item w3-button">
						<i class="fas fa-book mright"></i><%=resultSet.getString("sub_name")%></button>
					<input type="text" name="sub_val"
						value="<%=resultSet.getString("sub_name")%>" class="dnone">
					<input type="text" name="grade_val" value="Grade <%=i%>"
						class="dnone">
				</form>
				<%
					} else {

				}

				}

				if (rowcount.equals(0)) {
				%>
				<script>
					document.getElementById("grd<%=i%>").style.display = "none";
				</script>
				<%
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
			</div>
			<%
				}
			%>
			<a href="contact.jsp" class="w3-bar-item w3-button w3-padding">Contact</a>
		</div>


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
	<div class="w3-main" style="margin-left: 250px;">

		<!-- Push down content on small screens -->
		<div class="w3-hide-large" style="margin-top: 83px"></div>

		<!-- Top header -->
		<header class="w3-container w3-xlarge">
			<p class="w3-right">
				<label class="w3-margin-right"><%=session.getAttribute("user_username")%></label>
				<img src="../images/avatar2.png" alt="avatar"
					class="useravatar w3-margin-right"> <i
					class="fa fa-sign-out cp" title="logout" onclick="logout()"></i>
			</p>

		</header>

		<div style="min-height: 700px;">
			<!-- Image header -->
			<div class="w3-display-container w3-container">
				<img src="../images/bg_1.jpeg" alt="Jeans" style="width: 100%">
				<div class="w3-display-topleft w3-text-white"
					style="padding: 24px 48px;">
					<h1 class="w3-jumbo w3-hide-small fdbg">Study materials</h1>
					<h2 class="w3-hide-large w3-hide-medium fdbg">Study materials</h2>
					<h1 class="w3-hide-small fdbg">COLLECTION 2020</h1>
				</div>
			</div>

			<br>
			<div class="w3-container w3-text-grey">
				<h4>Latest Study materials</h4>
				<hr>
			</div>

			<!-- latest study materials grid -->
			<div class="w3-row  w3-padding-24">
				<%
					try {
					Statement statement = null;
					ResultSet resultSet = null;
					Integer lsmcount = 0;

					DB_Connection obj_DB_Connection = new DB_Connection();
					Connection connection = obj_DB_Connection.get_connection();
					statement = connection.createStatement();
					String sql = "SELECT * FROM datatable ORDER BY date_n_time DESC";

					resultSet = statement.executeQuery(sql);
					while (resultSet.next()) {
						lsmcount++;
						if (lsmcount <= 8) {
				%>
				<div class="w3-quarter" style="margin-bottom: 16px;">
					<div class="w3-container w3-padding-16">
						<div class="std_div w3-padding">
							<form action="viewsubject.jsp" method="GET">
								<button type="submit" class="w3-bar-item w3-button" style="float: right;">
									<i class="fas fa-location-arrow"></i>
								</button>
								<input type="text" name="sub_val"
									value="<%=resultSet.getString("subject")%>" class="dnone">
								<input type="text" name="grade_val"
									value="<%=resultSet.getString("grade")%>" class="dnone">
							</form>
							<p class="w3-text-blue">
								<b><%=resultSet.getString("grade")%></b>
							</p>
							<p class="w3-text-green">
								<b><%=resultSet.getString("subject")%></b>
							</p>
							<p>
								<label class="w3-amber lbl"><%=resultSet.getString("data_title")%></label>
							</p>
							<p class="lbl"><%=resultSet.getString("teacher_name")%></p>
							<label style="color: lightgray; font-size: 10px; float: right;"><%=resultSet.getString("date_n_time")%></label>
							<form action="../downloadFileServlet" method="POST">
								<button class="w3-button w3-green" type="submit"">
									<i class="fas fa-cloud-download-alt"></i>
								</button>
								<input type="text" name="data_name"
									value="<%=resultSet.getString("data_name")%>" class="dnone">
							</form>
						</div>
					</div>
				</div>
				<%
					} else {
				}
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>

			</div>

		</div>
		<div class="w3-black w3-center w3-padding-24">
			<i class="fab fa-facebook-f mright"></i><i
				class="fas fa-envelope mright"></i><i
				class="fab fa-instagram mright"></i>
		</div>

		<!-- End page content -->
	</div>


	<script type="text/javascript" src="js/main.js"></script>

</body>
</html>
