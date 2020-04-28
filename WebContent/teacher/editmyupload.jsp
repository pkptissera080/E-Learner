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
				<h3>Edit my Upload</h3>

				<form action="myclass.jsp" method="GET">
					<button type="submit" class="cls_btn w3-margin">
						<i class="fas fa-times"></i>
					</button>
					<input type="text" name="sub_grade_val" value="<%=sub_grade_val%>"
						class="dnone"> <input type="text" name="sub_name_val"
						value="<%=sub_name_val%>" class="dnone">
				</form>
				<div style="padding: 5px 10px;">
					<%
						try {
						Statement statement = null;
						ResultSet resultSet = null;

						DB_Connection obj_DB_Connection = new DB_Connection();
						Connection connection = obj_DB_Connection.get_connection();
						statement = connection.createStatement();
						String sql = "SELECT * FROM datatable WHERE data_id='" + request.getParameter("data_id") + "'";
						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
					%>

					<div class="w3-rest" style="margin-bottom: 16px;">
						<div class="w3-container w3-padding-16">
							<form action="../editmyuploadServlet" method="POST" enctype="multipart/form-data">
							<P class="dnone">
								<input class="w3-input w3-border" type="text"
									placeholder="title" name="data_id" style="max-width: 300px;"
									value="<%=request.getParameter("data_id")%>">
									<input class="w3-input w3-border" type="text"
									placeholder="title" name="sub_grade_val" style="max-width: 300px;"
									value="<%=request.getParameter("sub_grade_val")%>">
									<input class="w3-input w3-border" type="text"
									placeholder="title" name="sub_name_val" style="max-width: 300px;"
									value="<%=request.getParameter("sub_name_val")%>">
							</P>
							<P>
								<input class="w3-input w3-border" type="text"
									placeholder="title" name="data_title" style="max-width: 300px;"
									value="<%=resultSet.getString("data_title")%>" required>
							</P>
							<p>
								<textarea class="w3-input w3-border" name="data_description"
									rows="4" cols="50" placeholder="description"
									style="max-width: 300px;" required minlength="10"><%=resultSet.getString("data_description")%></textarea>
							</p>
							<p id="uploadedfile">
								<label>Uploaded file : <label
									class="w3-green w3-padding"><%=resultSet.getString("data_name")%></label></label>
									<input type="text" value="<%=resultSet.getString("data_name")%>" name="uploadedfile" class="dnone">
							</p>
							<p id="changebtn">
								<label class="cls_btn" onclick="toggleinput()">
									Change file <i class="far fa-file mleft"></i>
								</label>
							</p>
							<p id="inputfile" class="dnone">
								<input class="w3-input w3-border" type="file" name="inputfile" 
									style="max-width: 300px;"
									accept=".png, .jpg, .jpeg, .pdf">
							</p>
							<p id="cancelbtn" class="dnone">
								<label class="cls_btn" onclick="toggleinput()">cancel</label>
							</p>
							<hr>
							<p id="cancelbtn">
								<button class="w3-button w3-padding w3-green" type="submit">
									Save Changes <i class="far fa-save mleft"></i>
								</button>
							</p>
							</form>
						</div>
					</div>
					<%
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
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


	<script type="text/javascript" src="js/main.js"></script>
	<script>
		//document.getElementById('newsupload').style.display = 'block';
	</script>
</body>
</html>
