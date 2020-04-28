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

		<a href="index.jsp" class="w3-bar-item w3-button w3-padding w3-blue">Home</a>
		<a href="messages.jsp" class="w3-bar-item w3-button w3-padding">Messages</a>
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

		<%
			try {
			Statement statement = null;
			ResultSet resultSet = null;
			Integer userstdcount = 0;
			Integer userthrcount = 0;

			DB_Connection obj_DB_Connection = new DB_Connection();
			Connection connection = obj_DB_Connection.get_connection();
			statement = connection.createStatement();
			String sql = "SELECT * FROM users";

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {

				if (resultSet.getString("user_type").equals("student")) {
			userstdcount++;
				}
				if (resultSet.getString("user_type").equals("teacher")) {
			userthrcount++;
				}
			}
		%>
		<div class="w3-row  w3-padding-24">
			<div class="w3-third cp">
				<div class="w3-container w3-padding ">
					<div class="admin_div w3-padding w3-orange  w3-text-white">
						<div class="w3-left">
							<i class="fa fa-user-graduate w3-xxxlarge"></i>
						</div>
						<div class="w3-right">
							<h3 id="std_count"><%=userstdcount%></h3>
						</div>
						<div class="w3-clear"></div>
						<h4>Students</h4>
						<label id="overview_water_msg_view" style="font-size: 10px;"></label>
					</div>
				</div>
			</div>
			<div class="w3-third cp">
				<div class="w3-container w3-padding ">
					<div class="admin_div w3-padding w3-blue  w3-text-white">
						<div class="w3-left">
							<i class="fa fa-user-tie w3-xxxlarge"></i>
						</div>
						<div class="w3-right">
							<h3 id="thr_count"><%=userthrcount%></h3>
						</div>
						<div class="w3-clear"></div>
						<h4>Teachers</h4>
						<label id="overview_water_msg_view" style="font-size: 10px;"></label>
					</div>
				</div>
			</div>
		</div>
		<%
			} catch (Exception e) {
			e.printStackTrace();
		}
		%>

		<!-- Product grid -->
		<div class="w3-row w3-padding-24" style="min-height: 700px;">

			<h2 class="w3-margin">Subjects & teachers</h2>
			<button type="submit" class="cls_btn w3-margin"
				onclick="document.getElementById('updatesubtea').style.display='block'">
				Add Subject<i class="fas fa-plus mleft"></i>
			</button>
			<hr>

			<%
				for (int i = 6; i <= 11; i += 1) {
			%>
			<%
				try {
				Statement statement = null;
				ResultSet resultSet = null;
				Integer subrowcount = 0;

				DB_Connection obj_DB_Connection = new DB_Connection();
				Connection connection = obj_DB_Connection.get_connection();
				statement = connection.createStatement();
				String sql = "SELECT * FROM sub_tbl WHERE sub_grade ='Grade " + i + "'";

				resultSet = statement.executeQuery(sql);
			%>
			<div class="w3-twothird" style="margin-bottom: 20px;"
				id="subdiv<%=i%>">
				<div class="w3-container">
					<div class="admin_div w3-padding">

						<h4 class="grdlbl">
							Grade
							<%=i%></h4>
						<%
							while (resultSet.next()) {
							subrowcount++;
							String sub_id = resultSet.getString("sub_id");
						%>

						<p>
							<%
								if (resultSet.getString("sub_teacher").equals("")) {
							%>

							<label><%=resultSet.getString("sub_name")%></label> : <label
								class="w3-red" style="padding: 2px 10px;"
								id="displayuname<%=sub_id%>"> <i>NotAssigned</i>
							</label>

							<%
								} else {
							%>

							<label><%=resultSet.getString("sub_name")%></label> : <label
								class="w3-text-green" id="displayuname<%=sub_id%>"><%=resultSet.getString("sub_teacher")%></label>
							<%
								}
							%>
						</p>

						<form action="../updatesubteacherServlet" method="POST">
							<select name="inputuname" class="w3-input w3-border dnone"
								style="max-width: 300px;" id="inputuname<%=sub_id%>">
								<%
									try {
									Statement statement2 = null;
									ResultSet resultSet2 = null;

									DB_Connection obj_DB_Connection2 = new DB_Connection();
									Connection connection2 = obj_DB_Connection2.get_connection();
									statement2 = connection2.createStatement();
									String sql2 = "SELECT * FROM users WHERE user_type ='teacher'";

									resultSet2 = statement2.executeQuery(sql2);
									while (resultSet2.next()) {
								%>
								<option value="<%=resultSet2.getString("user_username")%>"><%=resultSet2.getString("user_username")%></option>
								<%
									}

								} catch (Exception e) {
									e.printStackTrace();
								}
								%>
							</select> <input type="number" name="sub_id" value="<%=sub_id%>"
								style="width: 50px;" class="dnone">
							<button class="w3-button dnone" id="savbtn<%=sub_id%>"
								type="submit">
								<i class="fas fa-check-circle cp w3-text-green"
									style="font-size: 15px;"></i>
							</button>
						</form>

						<form action="../deletesubServlet" method="POST">
							<input type="number" name="sub_id" value="<%=sub_id%>"
								style="width: 50px;" class="dnone">
							<button class="w3-button dnone" id="delbtn<%=sub_id%>"
								type="submit">
								<i class="fas fa-trash-alt cp w3-text-red"
									style="font-size: 15px;"></i>
							</button>
						</form>
						<button class="w3-button dnone" onclick="togglinput(<%=sub_id%>)"
							id="clsbtn<%=sub_id%>">
							<i class="fas fa-times cp w3-text-gray" style="font-size: 15px;"></i>
						</button>
						<button class="w3-button" onclick="togglinput(<%=sub_id%>)"
							id="edibtn<%=sub_id%>">
							<i class="fas fa-edit cp w3-text-gray" style="font-size: 15px;"></i>
						</button>


						<%
							}
						if (subrowcount == 0) {
						%>
						<script>
							document.getElementById("subdiv<%=i%>").style.display = "none";
						</script>
						<%
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
						%>
					</div>
				</div>
			</div>
			<%
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

	<!-- Newupload Modal -->
	<div id="updatesubtea" class="w3-modal">
		<div class="w3-modal-content w3-animate-zoom" style="padding: 100px">
			<div class="w3-container w3-white w3-center">
				<i
					onclick="document.getElementById('updatesubtea').style.display='none'"
					class="fa fa-remove w3-right w3-button w3-transparent w3-large"></i>
				<center>
					<h2>Add Subject</h2>
					<form action="../insertsubServlet" method="POST">
						<p>
							<select name="sub_grade" class="w3-input w3-border"
								style="max-width: 300px;">
								<option value="Grade 6">Grade 6</option>
								<option value="Grade 7">Grade 7</option>
								<option value="Grade 8">Grade 8</option>
								<option value="Grade 9">Grade 9</option>
								<option value="Grade 10">Grade 10</option>
								<option value="Grade 11">Grade 11</option>
							</select>
						</p>
						<p>
							<input class="w3-input w3-border" type="text" placeholder="Subject Name"
								name="sub_name" style="max-width: 300px;" required  value="" id="grade_input">
						</p>
						<p>
							<select name="sub_teacher" class="w3-input w3-border"
								style="max-width: 300px;">
								<%
									try {
									Statement statement2 = null;
									ResultSet resultSet2 = null;

									DB_Connection obj_DB_Connection2 = new DB_Connection();
									Connection connection2 = obj_DB_Connection2.get_connection();
									statement2 = connection2.createStatement();
									String sql2 = "SELECT * FROM users WHERE user_type ='teacher'";

									resultSet2 = statement2.executeQuery(sql2);
									while (resultSet2.next()) {
								%>
								<option value="<%=resultSet2.getString("user_username")%>"><%=resultSet2.getString("user_username")%></option>
								<%
									}

								} catch (Exception e) {
									e.printStackTrace();
								}
								%>
							</select>
						</p>
						<button type="submit" class="w3-button w3-block w3-blue"
							style="max-width: 300px;">
							Add Subject
						</button>
					</form>
				</center>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="js/main.js"></script>

</body>
</html>

