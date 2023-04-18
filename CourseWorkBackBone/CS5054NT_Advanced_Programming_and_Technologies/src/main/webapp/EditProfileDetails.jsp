<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.UserDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Admin Edit Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-v8ANJhXZvafSNLq3QGd2voW8+YKtFp0Nay1RzpDzW8fbv7r0hJtFbFAgE/mW8Kv31/kM1cJmvlzF79Kj8ZbGSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
      body {
        background-color: #f9f9f9;
        font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
      }
      h1 {
        text-align: center;
        margin-top: 50px;
      }
      form {
        max-width: 600px;
        margin: auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
      }
      label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
        color: #444;
      }
      input[type="text"],
      input[type="email"],
      textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: none;
        border-radius: 5px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
        font-size: 16px;
        background-color: #f9f9f9;
        color: #444;
        font-weight: bold;
        letter-spacing: 1px;
      }
      input[type="file"] {
        margin-bottom: 20px;
      }
      select {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: none;
        border-radius: 5px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
        font-size: 16px;
        background-color: #f9f9f9;
        color: #444;
        font-weight: bold;
        letter-spacing: 1px;
      }
      input[type="submit"] {
        background-color: #007aff;
        color: #fff;
        cursor: pointer;
        transition: all 0.3s ease;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 18px;
        font-weight: bold;
        letter-spacing: 1px;
        box-shadow: 0px 5px 10px rgba(0, 122, 255, 0.3);
      }
      input[type="submit"]:hover {
        background-color: #0066cc;
      }
      .user-photo {
        margin-bottom: 20px;
        text-align: center;
      }
      .user-photo img {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        border: 5px solid #fff;
        box-shadow: 0px 0px 20px rgba(0,122, 255, 0.3);
	object-fit: cover;
}
.user-photo input[type="file"] {
display: none;
}
.user-photo label {
background-color: #007aff;
color: #fff;
cursor: pointer;
transition: all 0.3s ease;
border-radius: 50%;
padding: 10px 20px;
font-size: 18px;
font-weight: bold;
letter-spacing: 1px;
box-shadow: 0px 5px 10px rgba(0, 122, 255, 0.3);
}
.user-photo label:hover {
background-color: #0066cc;
}
.user-photo i {
font-size: 60px;
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>

  </head>
  <body>
  <%
  	Connection con = UserDAO.getConnection();
	String queryString = request.getQueryString();
	String query = "Select * from UserDetails WHERE UserDetailsID = " + queryString;
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	ArrayList<String> id = new ArrayList();
	ArrayList<String> firstname = new ArrayList();
	ArrayList<String> lastname = new ArrayList();
	ArrayList<String> gender = new ArrayList();
	ArrayList<String> description = new ArrayList();
	ArrayList<String> paymentmethod = new ArrayList();
	ArrayList<String> userphoto = new ArrayList();
	while(rs.next()){
		id.add(rs.getString("UserDetailsID"));
		firstname.add(rs.getString("FirstName"));
		lastname.add(rs.getString("LastName"));
		gender.add(rs.getString("Gender"));
		description.add(rs.getString("Description"));
		paymentmethod.add(rs.getString("PaymentMethod"));
		userphoto.add(rs.getString("UserPhoto"));
	}
	%>
	
	<table>
		<tr>
  			<th>UserDetails ID</th>
		    <th>First Name</th>
		    <th>Last Name</th>
		    <th>Gender</th>
		    <th>Description</th>
		    <th>Payment Method</th>
		    <th>User Photo</th>
  		</tr>
		<%
	for(int i=0; i<id.size(); i++){
		%>	
  		
  		<tr>
		    <td><%= id.get(i) %></td>
		    <td><%= firstname.get(i) %></td>
		    <td><%= lastname.get(i) %></td>
		    <td><%= gender.get(i) %></td>
		    <td><%= description.get(i) %></td>
		    <td><%= paymentmethod.get(i) %></td>
		    <td><%= userphoto.get(i) %></td>
  		</tr>		
		<%
	}
	%>
	
	</table>
	
    <h1>Admin Edit Profile</h1>
    <form action="EditProfileDetail" method="post">
      <div class="user-photo">
        <label for="user-photo-input">
          <input type="file" id="user-photo-input" accept="image/*" name="photo">
          <i class="fas fa-user-circle"></i>
        </label>
        <img src="https://via.placeholder.com/120x120?text=User+Photo" alt="User Photo">
      </div>
      <label for="first-name">First Name</label>
      <input type="text" id="first-name" name="first-name" value="<%= firstname %>">
      <label for="last-name">Last Name</label>
      <input type="text" id="last-name" name="last-name" value="<%= lastname %>">
      <label for="gender">Gender</label>
      <select id="gender" name="gender">
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="other">Other</option>
      </select>
      <label for="description">Description</label>
      <textarea id="description" name="description"><%= description %></textarea>
      <label for="payment-method">Payment Method</label>
      <select id="payment-method" name="payment-method">
        <option value="credit-card">Credit Card</option>
        <option value="paypal">PayPal</option>
        <option value="apple-pay">Apple Pay</option>
        <option value="google-pay">Google Pay</option>
        <option value="amazon-pay">Amazon Pay</option>
      </select>
      <input type="submit" value="Save Changes">
      <input type="hidden" name="id" value="<%= queryString %>">
    </form>
  </body>
