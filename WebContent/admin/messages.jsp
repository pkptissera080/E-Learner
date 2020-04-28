<%@page import="common.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
	if ((session.getAttribute("user_type")) == null || !(session.getAttribute("user_type")).equals("admin")) {
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

		<a href="index.jsp" class="w3-bar-item w3-button w3-padding">Home</a>
		<a href="messages.jsp"
			class="w3-bar-item w3-button w3-padding w3-blue">Messages</a>
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
				<img src="../images/avatar1.png" alt="avatar"
					class="useravatar w3-margin-right"> <i
					class="fa fa-sign-out cp" title="logout" onclick="logout()"></i>
			</p>

		</header>


		<!-- Product grid -->
		<div class="w3-row w3-padding-24 w3-margin" style="min-height: 700px;">

			<h2 class="w3-margin">Messages</h2>
			<hr>

			<%
				try {
				Statement statement = null;
				ResultSet resultSet = null;

				DB_Connection obj_DB_Connection = new DB_Connection();
				Connection connection = obj_DB_Connection.get_connection();
				statement = connection.createStatement();
				String sql = "SELECT * FROM messages ORDER BY msg_datentime DESC";

				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
			%>
			<div class="w3-twothird" style="margin-bottom: 20px;">
				<div class="w3-container">
					<div class="admin_div w3-padding">
						<form action="../deletemessageServlet" method="POST">
							<button class="w3-button w3-right">
								<i class="fas fa-trash-alt cp w3-text-red"
									style="font-size: 20px;"></i>
							</button>
							<input type="number" name="msg_id"
								value="<%=resultSet.getString("msg_id")%>" class="dnone">
						</form>
						<h4 class="w3-text-gray">
							<b><%=resultSet.getString("msg_name")%></b>
						</h4>
						<p>
							<i style="font-size: 12px;" class="w3-text-blue"><%=resultSet.getString("msg_type")%></i>
						</p>
						<p class="w3-text-blue-gray"><%=resultSet.getString("msg_email")%></p>
						<p><%=resultSet.getString("msg_message")%></p>
						<p><%=resultSet.getString("msg_datentime")%></p>
					</div>
				</div>
			</div>
			<%
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>


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

