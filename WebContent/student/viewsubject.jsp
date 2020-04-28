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
			<button class="w3-bar-item w3-button" style="font-weight: normal; padding-left: 30px;"><%=request.getParameter("grade_val")%></button>
			<div class="w3-bar-block w3-padding-large w3-medium">
			<%
				try {

				Statement statement = null;
				ResultSet resultSet = null;
				String grd_val = request.getParameter("grade_val");

				DB_Connection obj_DB_Connection = new DB_Connection();
				Connection connection = obj_DB_Connection.get_connection();
				statement = connection.createStatement();
				String sql = "SELECT * FROM sub_tbl WHERE sub_grade = '"+grd_val+"'";

				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
			%>
			<form action="viewsubject.jsp" method="GET">
				<button type="submit" class="w3-bar-item w3-button">
						<i class="fas fa-book mright"></i><%=resultSet.getString("sub_name")%></button>
				<input type="text" name="sub_val"
					value="<%=resultSet.getString("sub_name")%>" class="dnone">
				<input type="text" name="grade_val"
					value="<%=request.getParameter("grade_val")%>" class="dnone">
			</form>
			<%
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			</div>
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
	<div class="w3-main" style="margin-left: 250px">

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


		<!-- Product grid -->
		<div class="w3-row w3-padding-24" style="min-height: 700px;">
			<div style="padding: 5px 10px;">
				<h3>
					<%=request.getParameter("sub_val")%>
					</h1>
					<div style="height: 600px; overflow: auto; margin-bottom: 50px;">
						<div id="ntfound" class="dnone">
							<center>
								<img src="../images/ntfound.jpg" style="height: 200px;"> <label
									class="ntfndlbl w3-margin w3-hide-small">No Materials
									found</label>
							</center>
						</div>
						<div style="padding: 5px 10px;">
							<%
								try {
								Statement statement = null;
								ResultSet resultSet = null;
								String grade_val = request.getParameter("grade_val");
								String sub_val = request.getParameter("sub_val");
								Integer divcount = 0;

								DB_Connection obj_DB_Connection = new DB_Connection();
								Connection connection = obj_DB_Connection.get_connection();
								statement = connection.createStatement();
								String sql = "SELECT * FROM datatable WHERE grade='"+grade_val+"' &&  subject='"+sub_val+"' ORDER BY date_n_time DESC";
								resultSet = statement.executeQuery(sql);
								while (resultSet.next()) {

									divcount++;
							%>

							<div class="w3-rest" style="margin-bottom: 16px;">
								<div class="w3-container w3-padding-16">
									<div class="std_div w3-padding">
										<label><i class="fas fa-ellipsis-v mright"></i><%=resultSet.getString("data_title")%></label><br>
										<p>
											<i class="fas fa-align-left mright"></i><%=resultSet.getString("data_description")%></p>
										<label class="w3-right"><i class="far fa-clock mright"></i><%=resultSet.getString("date_n_time")%></label><br>
										<br>
										<center>
											<form action="../downloadFileServlet" method="POST">
												<button class="w3-button w3-green" type="submit"">
													Download
													<%=resultSet.getString("data_name")%>
													<i class="fas fa-cloud-download-alt"></i>
												</button>
												<input type="text" name="data_name"
													value="<%=resultSet.getString("data_name")%>" class="dnone">
											</form>
										</center>
									</div>
								</div>
							</div>
							<%
								}
							if (divcount.equals(0)) {
								out.print("<script>document.getElementById('ntfound').style.display ='block';</script>");
							} else {

							}

							} catch (Exception e) {
								e.printStackTrace();
							}
							%>
						</div>
					</div>
			</div>
		</div>

		<div class="w3-black w3-center w3-padding-24">
			<i class="fab fa-facebook-f mright"></i><i
				class="fas fa-envelope mright"></i><i
				class="fab fa-instagram mright"></i>
		</div>
		

		<!-- End page content -->
	</div>

	<script type="text/javascript">
		var nullcheck = document.getElementById("gradelbl").innerHTML;
		if (nullcheck == "Grade null") {
			location = "index.jsp";
		}
	</script>
	<script type="text/javascript" src="js/main.js"></script>

</body>
</html>
