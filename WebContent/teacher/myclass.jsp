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

		<a href="index.jsp" class="w3-bar-item w3-button w3-padding">My
			Classes</a> <a href="javascript:void(0)"
			class="w3-bar-item w3-button w3-padding w3-blue">My Classroom</a> <a
			href="contact.jsp" class="w3-bar-item w3-button w3-padding">Contact</a>
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

		<%
			String sub_grade_val = request.getParameter("sub_grade_val");
		String sub_name_val = request.getParameter("sub_name_val");
		%>

		<div class="w3-container w3-text-grey">
			<h1>
				<b class="fdbg" id="sub_grade_val"><%=request.getParameter("sub_grade_val")%></b>
			</h1>
			<h2>
				<b class="fdbg" id="sub_name_val"><%=request.getParameter("sub_name_val")%></b>
			</h2>
			<hr>
		</div>

		<!-- Product grid -->
		<div class="w3-row w3-padding-24" style="min-height: 700px;">
			<div style="padding: 5px 10px;">
				<h3>My uploads</h3>
				<button type="submit" class="cls_btn w3-margin"
					onclick="document.getElementById('newsupload').style.display='block'">Upload</button>
				<div style="height: 600px; overflow: auto; margin-bottom: 50px;">
					<div id="ntfound" class="dnone">
						<center>
							<img src="../images/ntfound.jpg" style="height: 200px;"> <label
								class="ntfndlbl w3-margin w3-hide-small">No Uploads
								found</label>
						</center>
					</div>
					<div style="padding: 5px 10px;">
						<%
							try {
							Statement statement = null;
							ResultSet resultSet = null;
							Integer divcount = 0;

							DB_Connection obj_DB_Connection = new DB_Connection();
							Connection connection = obj_DB_Connection.get_connection();
							statement = connection.createStatement();
							String sql = "SELECT * FROM datatable WHERE grade='" + sub_grade_val + "' && subject='" + sub_name_val
							+ "' ORDER BY date_n_time DESC";
							resultSet = statement.executeQuery(sql);
							while (resultSet.next()) {

								if (resultSet.getString("teacher_name").equals(session.getAttribute("user_username"))) {
							divcount++;
						%>

						<div class="w3-rest" style="margin-bottom: 16px;">
							<div class="w3-container w3-padding-16">
								<div class="teacher_div">
									<form action="../deleteUploadServlet" method="POST">
										<button class="w3-button w3-right">
											<i class="fas fa-trash-alt cp w3-text-red"
												style="font-size: 20px;"></i>
										</button>
										<input type="number" name="data_id"
											value="<%=resultSet.getString("data_id")%>" class="dnone">
										<input type="text" name="sub_grade_val"
											value="<%=sub_grade_val%>" class="dnone"> <input
											type="text" name="sub_name_val" value="<%=sub_name_val%>"
											class="dnone">
									</form>
									<form action="editmyupload.jsp" method="GET">
										<button class="w3-button w3-right">
											<i class="fas fa-edit cp w3-text-gray"
												style="font-size: 20px;"></i>
										</button>
										<input type="number" name="data_id"
											value="<%=resultSet.getString("data_id")%>" class="dnone">
										<input type="text" name="sub_grade_val"
											value="<%=sub_grade_val%>" class="dnone"> <input
											type="text" name="sub_name_val" value="<%=sub_name_val%>"
											class="dnone">
									</form>
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
							} else {
						}
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

	<!-- Newupload Modal -->
	<div id="newsupload" class="w3-modal">
		<div class="w3-modal-content w3-animate-zoom" style="padding: 100px">
			<div class="w3-container w3-white w3-center">
				<i
					onclick="document.getElementById('newsupload').style.display='none'"
					class="fa fa-remove w3-right w3-button w3-transparent w3-large"></i>
				<center>
					<h2>New Upload</h2>
					<form action="../uploadFileServlet" method="POST"
						enctype="multipart/form-data">
						<p>
							<input class="w3-input w3-border" type="text" placeholder="title"
								name="title" style="max-width: 300px;" required>
						</p>
						<p>
							<textarea class="w3-input w3-border" name="description" rows="4"
								cols="50" placeholder="description" style="max-width: 300px;"
								required minlength="10"></textarea>
						</p>
						<div class="dnone">
							<p>
								<input class="w3-input w3-border" type="text"
									placeholder="grade" name="grade" style="max-width: 300px;"
									value="<%=sub_grade_val%>" id="grade_input">
							</p>
							<p>
								<input class="w3-input w3-border" type="text"
									placeholder="subject" name="subject" style="max-width: 300px;"
									value="<%=sub_name_val%>" id="subject_input">
							</p>
							<p>
								<input class="w3-input w3-border" type="text"
									placeholder="teacher_name" name="teacher_name"
									style="max-width: 300px;"
									value="<%=session.getAttribute("user_username")%>">
							</p>
							<p>
								<input class="w3-input w3-border" type="text"
									placeholder="teacher_email" name="teacher_email"
									style="max-width: 300px;"
									value="<%=session.getAttribute("user_email")%>">
							</p>
						</div>
						<p>
							<input class="w3-input w3-border" type="file" name="file"
								required style="max-width: 300px;"
								accept=".png, .jpg, .jpeg, .pdf">
						</p>
						<button type="submit" class="w3-button w3-block w3-blue"
							style="max-width: 300px;">
							Upload <i class="fas fa-upload mleft"></i>
						</button>
					</form>
				</center>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="js/main.js"></script>
	<script>
		//document.getElementById('newsupload').style.display = 'block';
	</script>
</body>
</html>
