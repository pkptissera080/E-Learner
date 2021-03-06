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
		
		<a href="index.jsp" class="w3-bar-item w3-button w3-padding w3-blue">Home</a>
		<a href="contact.jsp" class="w3-bar-item w3-button w3-padding">Contact</a>
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


		<div class="w3-container w3-text-grey">
			<h1>My Classes</h1>
			<p>
				<b id="cls_count"></b> Classes
			</p>
			<p><label id="nocls" class="ntfndlbl w3-margin w3-hide-small dnone">No Classes were assigned to you yet...</label></p>
		</div>

		<!-- Product grid -->
		<div class="w3-row w3-padding-24" style="min-height: 700px;">
			<%
				try {
				Statement statement = null;
				ResultSet resultSet = null;
				Integer rowcount = 0;

				DB_Connection obj_DB_Connection = new DB_Connection();
				Connection connection = obj_DB_Connection.get_connection();
				statement = connection.createStatement();
				String sql = "SELECT * FROM sub_tbl WHERE sub_teacher='"+session.getAttribute("user_username")+"' ";

				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
					rowcount++;
			%>
			<div class="w3-col l3 s6">
				<div class="w3-container">
					<div class="teacher_div">
						<form action="myclass.jsp" method="get">
						<h4 class="grdlbl"><%=resultSet.getString("sub_grade")%></h4>
						<h6 class="sublbl"><%=resultSet.getString("sub_name")%> </h6>
						<input type="text" name="sub_grade_val" value="<%=resultSet.getString("sub_grade")%>" class="dnone">
						<input type="text" name="sub_name_val" value="<%=resultSet.getString("sub_name")%>" class="dnone">
						<center>
							<button type="submit" class="cls_btn">Enter Class</button>
						</center>
						</form>
					</div>
				</div>
			</div>
			<%
				}
				%>
				<script> document.getElementById("cls_count").innerHTML= <%out.print(rowcount);%>; </script>
				<%
				if(rowcount.equals(0)){
					%>
					<script> document.getElementById("nocls").style.display="inline"; </script>
					<%
				}else{

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			%>

		</div>



		<div class="w3-black w3-center w3-padding-24">
			<i class="fab fa-facebook-f mright"></i><i class="fas fa-envelope mright"></i><i class="fab fa-instagram mright"></i>
		</div>

		<!-- End page content -->
	</div>


	<script type="text/javascript" src="js/main.js"></script>

</body>
</html>
