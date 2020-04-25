
function clr_err() {
    document.getElementById("login_err_lbl").innerHTML = "";
}

function redirect_register() {
    window.location.replace("registration.jsp");
}

encrypt();
function encrypt(){
	document.getElementById("lg_cryptopassword_id").value = CryptoJS.MD5(document.getElementById("lg_password_id").value);
}