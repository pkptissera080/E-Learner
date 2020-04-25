<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1><%= session.getAttribute( "user_username") %></h1>
	<h1><%= session.getAttribute( "user_type") %></h1>
	
	<h2> <a href="access/login.jsp">logout</a></h2>
</body>
</html>