<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin Page</title>
	<style>
		body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
		}
		nav {
			background-color: #333;
			overflow: hidden;
		}
		nav a {
			float: left;
			color: white;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
			font-size: 18px;
		}
		nav a:hover {
			background-color: #ddd;
			color: black;
		}
		h1 {
			margin-top: 50px;
			margin-left: 20px;
			font-size: 32px;
		}
		p {
			margin-left: 20px;
			font-size: 18px;
		}
	</style>
</head>
<body>
	<nav>
		<a href="addproduct.jsp">Add Product</a>
		<a href="User.jsp">Edit User</a>
		<a href="UserProfile.jsp">Edit Profile</a>
		<a href="AllProduct.jsp">View All Product</a>
	</nav>
	<h1>Welcome to the Admin Page</h1>
	<p>Select an action from the navigation bar to get started.</p>
</body>
</html>
