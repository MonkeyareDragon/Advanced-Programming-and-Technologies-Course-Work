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
<title>Users</title>
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
	String query = "Select * from users";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	ArrayList<String> id = new ArrayList();
	ArrayList<String> email = new ArrayList();
	ArrayList<String> username = new ArrayList();
	ArrayList<String> password = new ArrayList();
	while(rs.next()){
		id.add(rs.getString("id"));
		email.add(rs.getString("email"));
		username.add(rs.getString("username"));
		password.add(rs.getString("password"));
	}
	%>
	
	<table>
		<tr>
  			<th>User ID</th>
		    <th>Email</th>
		    <th>User Name</th>
		    <th>Password</th>
  		</tr>
		<%
	for(int i=0; i<id.size(); i++){
		%>	
  		
  		<tr onclick="profileedit('<%= id.get(i) %>')">
		    <td><%= id.get(i) %></td>
		    <td><%= email.get(i) %></td>
		    <td><%= username.get(i) %></td>
		    <td><%= password.get(i) %></td>
  		</tr>		
		<%
	}
	%>
	
	</table>
	
<script>
function profileedit(val){
	window.location.href = "EditProfile.jsp?" + val;
	}
</script>
	
</body>
</html>