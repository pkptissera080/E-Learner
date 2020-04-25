function u_register_check() {

	var u_reg_nic_val_id = document.getElementById("u_reg_nic_id").value;
	var u_reg_uname_val_id = document.getElementById("u_reg_uname_id").value;
	var u_reg_email_val_id = document.getElementById("u_reg_email_id").value;
	var u_reg_pass_val_id = document.getElementById("u_reg_pass_id").value;
	var u_reg_conpass_val_id = document.getElementById("u_reg_conpass_id").value;

	var atr_register_loading_bar = document
			.getElementById("register_loading_bar");
	var atr_register_err_lbl = document.getElementById("u_register_err_lbl");
	var atr_register_submit = document.getElementById("u_register_submit");

	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

	atr_register_err_lbl.innerHTML = ""; // clr err

	if (u_reg_nic_val_id == "") {
		atr_register_err_lbl.innerHTML = "NIC is required !";
		atr_register_loading_bar.classList.remove("progress");

	} else if (u_reg_uname_val_id == "") {

		atr_register_err_lbl.innerHTML = "Username is required !";
		atr_register_loading_bar.classList.remove("progress");

	} else if (u_reg_email_val_id == "") {

		atr_register_err_lbl.innerHTML = "Email is required !";
		atr_register_loading_bar.classList.remove("progress");

	} else if (u_reg_email_val_id.match(mailformat)) {

		if (u_reg_pass_val_id == "") {

			atr_register_err_lbl.innerHTML = "Password is required !";
			atr_register_loading_bar.classList.remove("progress");

		} else if (u_reg_pass_val_id.length < 6) {

            atr_register_err_lbl.innerHTML = "Password must contain at least of 6 characters !";
            atr_register_loading_bar.classList.remove("progress");

		} else if (u_reg_conpass_val_id == "") {

			atr_register_err_lbl.innerHTML = "Confirm your password !";
			atr_register_loading_bar.classList.remove("progress");

		} else if (u_reg_conpass_val_id != u_reg_pass_val_id) {

			atr_register_err_lbl.innerHTML = "Password Mismatch !";
			document.getElementById("u_reg_pass_id").value = "";
			document.getElementById("u_reg_conpass_id").value = "";
			atr_register_loading_bar.classList.remove("progress");

		} else {

			$.ajax({
				type : 'POST',
				url : '../registerServlet',
				data : $("#register_form").serialize(),
				beforeSend : function() {
					$(".show-progress").addClass('progress');
					$("#u_register_submit").attr("disabled", true);
				},
				success : function(feedback) {
					console.log(feedback);
					document.getElementById("u_register_err_lbl_val").value = feedback;
					var u_register_err_lbl_val = document.getElementById("u_register_err_lbl_val").value;
					if(u_register_err_lbl_val == 'Success'){
						//Registration successful !
                        var r = confirm(
                            'Registration successful !\n\n' +
                            "Login now ? "
                        );
                        if (r == true) {
                            location = "login.jsp";
                        } else {
                            location.reload();
                        }
					}else{
						$("#u_register_err_lbl").html(feedback);
						$(".show-progress").removeClass('progress');
						$("#u_register_submit").html("signup");
						$("#u_register_submit").attr("disabled", false);
					}

				},
				error : function(error) {
					console.log(error);
					$(".show-progress").removeClass('progress');
					$("#u_register_submit").html("signup");
					$("#u_register_submit").attr("disabled", false);
				}
			})

		}

	} else {
		atr_register_submit.innerHTML = "Sign up";
		atr_register_err_lbl.innerHTML = "Invalid Email !";
		atr_register_loading_bar.classList.remove("progress");
	}

}

function change_user_type() {
	var utype = document.getElementById("u_reg_type_id").value;
	if (utype == "student") {
		document.getElementById("u_reg_type_id").value = "teacher";
		document.getElementById("u_reg_type_view").innerHTML = "teacher";
		document.getElementById("u_register_submit").innerHTML = "Sign up as a Teacher";
	} else if (utype == "teacher") {
		document.getElementById("u_reg_type_id").value = "student";
		document.getElementById("u_reg_type_view").innerHTML = "Student";
		document.getElementById("u_register_submit").innerHTML = "Sign up as a Student";
	}
}

function clr_err() {
	document.getElementById("u_register_err_lbl").innerHTML = "";
}

function redirect_login() {
	window.location.replace("login.jsp");
}
encrypt();
function encrypt(){
	document.getElementById("u_reg_cryptopass_id").value = CryptoJS.MD5(document.getElementById("u_reg_pass_id").value);
}