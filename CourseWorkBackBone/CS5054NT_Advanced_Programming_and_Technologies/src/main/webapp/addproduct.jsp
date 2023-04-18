<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Add Product</title>
	<style>
		body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
			background-color: #f1f1f1;
		}
		header {
			background-color: #333;
			color: white;
			padding: 20px;
			text-align: center;
			font-size: 36px;
			font-weight: bold;
			box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5);
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			z-index: 1000;
		}
		form {
			background-color: white;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5);
			margin-top: 100px;
			margin-bottom: 50px;
			max-width: 800px;
			margin-left: auto;
			margin-right: auto;
		}
		h1 {
			font-size: 30px;
			margin-bottom: 20px;
		}
		label {
			font-weight: bold;
			font-size: 18px;
			display: block;
			margin-top: 20px;
		}
		input[type="text"], input[type="number"], select {
			width: 100%;
			height: 40px;
			border-radius: 5px;
			border: 1px solid #ccc;
			padding: 5px;
			margin-top: 10px;
			font-size: 16px;
			box-sizing: border-box;
		}
		select {
			appearance: none;
			-webkit-appearance: none;
			background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 10 5' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M5 5L0 0h10L5 5z' fill='%23000'/%3E%3C/svg%3E");
			background-size: 10px 5px;
			background-repeat: no-repeat;
			background-position-x: calc(100% - 10px);
			background-position-y: center;
			padding-right: 20px;
		}
		input[type="file"] {
			width: 100%;
			margin-top: 10px;
			font-size: 16px;
		}
		button {
			margin-top: 20px;
			width: 150px;
			height: 40px;
			border-radius: 5px;
			background-color: #4CAF50;
			color: white;
			font-size: 18px;
			border: none;
			cursor: pointer;
		}
		button:hover {
			background-color: #3E8E41;
		}
	</style>
</head>
<body>
	<header>Add Product</header>
	<form action="AddProduct" method="post">
		<h1>Add Product</h1>
		<label for="name">Name:</label>
		<input type="text" id="name" name="name" required>

		<label for="category">Category:</label>
		<select id="category" name="category">
			<option value="clothing">Clothing</option>
			<option value="electronics">Electronics</option>
			<option value="beauty">Beauty</option>
			<option value="home">Home</option>
			<option value="sports">Sports</option>
		</select>

		<label for="brand">Brand:</label>
		<input type="text" id="brand" name="brand" required>

		<label for="photo">Photo:</label>
		<input type="file" id="photo" name="photo" accept="image/*" required>

		<label for="price">Price:</label>
		<input type="number" id="price" name="price" min="0" step="1" required>

		<label for="stock">Stock:</label>
		<input type="number" id="stock" name="stock" min="0">

		<label for="rating">Rating:</label>
		<input type="number" id="rating" name="rating" min="0" max="5" step="0.1">

		<button type="submit">Add Product</button>
	</form>
</body>
</html>
    