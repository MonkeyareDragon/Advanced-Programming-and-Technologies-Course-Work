<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>505 HTTP Version Not Supported</title>
<style>
	.center {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		height: 100vh;
	}
	.img-fluid{
		max-width: 30%;
		height: auto;
	}
	
</style>
</head>
<body>
	<div class="center">
		<img src="images/error/505error.png" class="img-fluid"/>
		<p><b>505 Not Found</b></p>
		<h4 style="font-size: 1.5rem;">Sorry! The HTTP protocol version used in the request is not supported by the server.</h4>
		
		
		<a class="margin-top: padding:0.5rem 1rem; border: 1px solid #007bff; border-radius: o.25rem; color: #007bff; text-decoration: none;" href="home.jsp"> Home Page</a>
	</div>
</body>
</html>