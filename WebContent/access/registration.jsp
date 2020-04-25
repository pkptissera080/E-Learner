<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% session.invalidate(); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>E learner</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="js/jquery-1.6.2.js"></script>
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../images/logo/logo.png" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">
    <!--===============================================================================================-->
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <!--===============================================================================================-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
     <!--===============================================================================================-->
</head>

<body style="background-color: #666666;">


    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">

                <form id="register_form" class="login100-form validate-form">

                    <span class="login100-form-title p-b-43">
                        <center>
							<div class="title">
								<img src="../images/logo/logo.png"
									style="width: 70px; height: 70px;"><br> <label><b
									class="e_ltr">E</b> Learner</label>
							</div>
						</center>
                    </span>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" name="u_reg_nic" id="u_reg_nic_id" onfocus="clr_err()">
                        <span class="focus-input100"></span>
                        <span class="label-input100">NIC</span>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" name="u_reg_uname" id="u_reg_uname_id" onfocus="clr_err()">
                        <span class="focus-input100" ></span>
                        <span class="label-input100">Username</span>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" name="u_reg_email" id="u_reg_email_id" onfocus="clr_err()">
                        <span class="focus-input100"></span>
                        <span class="label-input100">Email</span>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="password" id="u_reg_pass_id"
                            onfocus="clr_err()" onkeyup="encrypt()">
                        <span class="focus-input100"></span>
                        <span class="label-input100">Password</span>
                    </div>
                    
                    <input type="text" id="u_reg_cryptopass_id" name="u_reg_pass" class="dnone">

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="password" name="u_reg_conpass" id="u_reg_conpass_id"
                            onfocus="clr_err()">
                        <span class="focus-input100"></span>
                        <span class="label-input100">Confirm Password</span>
                    </div>

                    <div class="text-right">
                        <label class="button btnsolid" id="u_reg_type_view" onclick="change_user_type()">Student</label>
                        <input type="text" value="student" name="u_reg_type" id="u_reg_type_id" style="display: none;">
                    </div>

                    <div class="text-right">
                        <label id="u_register_err_lbl" class="err_lbl"></label>
                        <input type="text" id="u_register_err_lbl_val" style="display: none;">
                    </div>

                    <div class="container-login100-form-btn" style="margin-bottom: 20px;">
                        <button type="button" id="u_register_submit" class="login100-form-btn"
                            onclick="u_register_check()">Sign up as a Student</button>
                    </div>

                    <center>
                        <div class="show-progress" id="register_loading_bar"></div>
                    </center>

                    <div class="text-center p-t-46 p-b-20 cpointer" onclick="redirect_login()">
                        <span class="txt2">Already have an account
                            <a href="login.jsp">login</a>
                        </span>
                    </div>
                </form>

                <div class="login100-more" style="background-image: url('../images/bg_1.jpeg');">
                    <div class="centered">
                    </div>
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
    <script src="js/js_register.js"></script>
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