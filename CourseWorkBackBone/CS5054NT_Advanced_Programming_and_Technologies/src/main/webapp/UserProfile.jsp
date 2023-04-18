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
<meta charset="ISO-8859-1">
<title>Users Profile</title>
<style>
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
.herf{
	font-family: arial, sans-serif;
	margin-top: 10px;
}
</style>
</head>
<body>

	<%
	Connection con = UserDAO.getConnection();
	String query = "Select * from UserDetails";
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
  		
  		<tr onclick="profileedit('<%= id.get(i) %>')">
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
	
<script>
function profileedit(val){
	window.location.href = "EditProfileDetails.jsp?" + val;
	}
</script>
	
</body>
</html>