<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<html lang="en">
<head>
    <title>E learner</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/logo/logo.png" />
    <!--===============================================================================================-->
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <!--===============================================================================================-->
</head>
<script type="text/javascript">
    setTimeout(function(){

    	var usertype_check_val = "<%= session.getAttribute( "user_type") %>"
    
        if(usertype_check_val == "null"){
            window.location.href = "access/login.jsp";
        }
        else{
            if(usertype_check_val == "student"){
                window.location.href = "student/index.jsp";
            }
            else if(usertype_check_val == "teacher"){
                window.location.href = "teacher/index.jsp";
            }
            else {
                window.location.href = "admin/index.jsp";
            }
        }
         }, 1000);
</script>
<style>
    body,
    html {
        height: 100%;
        margin: 0;
    }

    .bg {
        /* The image used */
        background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("images/bg_1.jpeg");

        /* Full height */
        height: 100%;

        /* Center and scale the image nicely */
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }

    .centered {
        align-items: center;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    .progress {
        border-radius: 5px;
        width: 100%;
        height: 4px;
        position: relative;
        background: #03A9F4;
    }

    .progress::before {
        position: absolute;
        content: "";
        width: 0%;
        height: 4px;
        top: 0;
        left: 0;
        background-color: #FFC107;
        animation: wait 1s infinite;
        -webkit-animation: wait 1s infinite;
        -moz-animation: wait 1s infinite;
    }

    @keyframes wait {
        10% {
            width: 10%
        }

        30% {
            width: 30%
        }

        50% {
            width: 50%
        }

        70% {
            width: 70%
        }

        100% {
            width: 100%
        }
    }

    .title {
        font-family: 'Poppins', sans-serif;
        font-size: 30px;
        line-height: 1.2;
        width: 200px;
        padding: 50px;
        color:white;
    }
    .e_ltr{
        background: #03A9F4;
        padding: 5px 15px;
        border-radius: 50%;
        font-size: 25px;
    }
</style>

<body class="bg">
    <div id="loading_div" style="width: 100%; height: 100%;">
        <div class="centered">
            <div class="title">
                <center>
                    <img src="images/logo/logo.png" style="width: 70px;height :70px;"><br>
                    <label><b class="e_ltr">E</b> Learner</label>
                </center>
            </div>
            <div class="progress"></div>
        </div>
    </div>
</body>
</html>

