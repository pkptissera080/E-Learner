<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>E learner</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="../images/logo/logo.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">
<!--===============================================================================================-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<!--===============================================================================================-->
</head>

<body style="background-color: #666666;">

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form id="login_form" class="login100-form validate-form"
					action="../loginServelet" method="POST">

					<span class="login100-form-title p-b-43">
						<center>
							<div class="title">
								<img src="../images/logo/logo.png"
									style="width: 70px; height: 70px;"><br> <label><b
									class="e_ltr">E</b> Learner</label>
							</div>
						</center>
					</span>

					<div class="wrap-input100 validate-input"
						style="margin-bottom: 20px;">
						<input class="input100" type="text" name="lg_username"
							id="lg_email_id" onfocus="clr_err()" required> <span
							class="focus-input100"></span> <span class="label-input100">Username</span>
					</div>

					<div class="wrap-input100 validate-input"
						style="margin-bottom: 20px;">
						<input class="input100" type="password" onkeyup="encrypt()"
							id="lg_password_id" onfocus="clr_err()" required> <span
							class="focus-input100"></span> <span class="label-input100">Password</span>
					</div>
					
					<input type="text" id="lg_cryptopassword_id" name="lg_password" class="dnone">

					<div class="text-right">
						<label id="login_err_lbl" class="err_lbl"></label>
					</div>

					<div class="container-login100-form-btn"
						style="margin-bottom: 20px;">
						<button type="submit" id="login_submit" class="login100-form-btn">login</button>
					</div>

					<center>
						<div class="show-progress" id="login_loading_bar"></div>
					</center>

					<div class="text-center p-t-46 p-b-20"
						onclick="redirect_register()" style="cursor: pointer;">
						<span class="txt2">Create an account <a
							href="registration.jsp">Sign up</a>
						</span>
					</div>

				</form>

				<div class="login100-more"
					style="background-image: url('../images/bg_1.jpeg');">
					<div class="centered"></div>
				</div>
			</div>
		</div>
	</div>


	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/js_login.js"></script>
	<!--===============================================================================================-->
	<script>
		(function($) {
			"use strict";

			/*==================================================================
			[ Focus Contact2 ]*/
			$('.input100').each(function() {
				$(this).on('blur', function() {
					if ($(this).val().trim() != "") {
						$(this).addClass('has-val');
					} else {
						$(this).removeClass('has-val');
					}
				})
			})
			$('.input100').each(function() {

				if ($(this).val().trim() != "") {
					$(this).addClass('has-val');
				} else {
					$(this).removeClass('has-val');
				}
			})
		})(jQuery);
	</script>
	<!--===============================================================================================-->

</body>

</html>