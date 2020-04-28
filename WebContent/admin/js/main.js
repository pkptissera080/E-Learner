function logout() {
	location='../access/login.jsp';
}

function loadHome(){
	location='index.jsp';
}

//Accordion 
function myAccFunc(yy) {
	
	var x = document.getElementById("demoAcc"+yy+"");
	if (x.className.indexOf("w3-show") == -1) {
		x.className += " w3-show";
	} else {
		x.className = x.className.replace(" w3-show", "");
	}
}

// Click on the "Jeans" link on page load to open the accordion for demo purposes
//document.getElementById("myBtn").click();

// Open and close sidebar
function w3_open() {
	document.getElementById("mySidebar").style.display = "block";
	document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
	document.getElementById("mySidebar").style.display = "none";
	document.getElementById("myOverlay").style.display = "none";
}

function togglinput(xx){
	document.getElementById("inputuname"+xx+"").classList.toggle("dnone");
	document.getElementById("displayuname"+xx+"").classList.toggle("dnone");
	document.getElementById("delbtn"+xx+"").classList.toggle("dnone");
	document.getElementById("savbtn"+xx+"").classList.toggle("dnone");
	document.getElementById("edibtn"+xx+"").classList.toggle("dnone");
	document.getElementById("clsbtn"+xx+"").classList.toggle("dnone");
}