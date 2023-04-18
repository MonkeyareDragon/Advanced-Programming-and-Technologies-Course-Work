<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>User Details Form</title>
	<style>
		form {
			display: flex;
			flex-direction: column;
			align-items: center;
			margin-top: 50px;
		}
		label {
			margin-top: 20px;
			font-weight: bold;
			font-size: 18px;
		}
		input[type="text"], input[type="email"], select {
			width: 300px;
			height: 30px;
			border-radius: 5px;
			border: 1px solid #ccc;
			padding: 5px;
			margin-top: 10px;
			font-size: 16px;
		}
		textarea {
			width: 300px;
			height: 100px;
			border-radius: 5px;
			border: 1px solid #ccc;
			padding: 5px;
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
	<h1>User Details Form</h1>
	<form method="post" action="UserDetail">
		<label for="photo">Photo:</label>
		<input type="file" id="photo" name="photo">

		<label for="fname">First Name:</label>
		<input type="text" id="fname" name="fname" required>

		<label for="lname">Last Name:</label>
		<input type="text" id="lname" name="lname" required>

		<label for="gender">Gender:</label>
		<select id="gender" name="gender">
			<option value="">--Select--</option>
			<option value="male">Male</option>
			<option value="female">Female</option>
			<option value="other">Other</option>
		</select>

		<label for="description">Description:</label>
		<textarea id="description" name="description"></textarea>

		<label for="payment">Payment Method:</label>
		<input type="radio" id="payment" name="payment" value="paypal">
		<label for="paypal">PayPal</label>
		<input type="radio" id="payment" name="payment" value="credit-card">
		<label for="credit-card">Credit Card</label>

		<button type="submit">Submit</button>
	</form>
</body>
</html>
