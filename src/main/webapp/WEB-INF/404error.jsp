<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 Not Found</title>
<style>
	.center {
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  align-items: center;
	  height: 100vh;
	}
	.img-fluid {
	  max-width: 100%;
	  height: auto;
	}
</style>


</head>
<body>
	<div class="center">
		
		<img src="images/error/404 page.png" class="img-fluid"/>
		<h5>404 Not Found</h5>
		<h4 style="font-size: 1.5rem;">Whoops! That page doesen’t exist.</h4>
		
		<a style="margin-top: 1rem; padding: 0.5rem 1rem; border: 1px solid #007bff; border-radius: 0.25rem; color: #007bff; text-decoration: none;" href="home.jsp"> Home Page</a>
	</div>
</body>
</html>