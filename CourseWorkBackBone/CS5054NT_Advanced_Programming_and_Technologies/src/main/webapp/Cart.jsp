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
<title>Cart Items</title>
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
	String query = "Select C.CartID, P.Name, P.Category, P.Brand, P.Price, P.Stock, P.Rating FROM Cart C JOIN Product P ON C.ProductID = P.ProductID JOIN users U ON C.UserID = U.id WHERE U.id = '9';";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	ArrayList<String> id = new ArrayList();
	ArrayList<String> Name = new ArrayList();
	ArrayList<String> Category = new ArrayList();
	ArrayList<String> Brand = new ArrayList();
	ArrayList<String> Price = new ArrayList();
	ArrayList<String> Stock = new ArrayList();
	ArrayList<String> Rating = new ArrayList();
	while(rs.next()){
		id.add(rs.getString("C.CartID"));
		Name.add(rs.getString("P.Name"));
		Category.add(rs.getString("P.Category"));
		Brand.add(rs.getString("P.Brand"));
		Price.add(rs.getString("P.Price"));
		Stock.add(rs.getString("P.Stock"));
		Rating.add(rs.getString("P.Rating"));
	}
	%>
	
	<table>
		<tr>
  			<th>Name</th>
		    <th>Category</th>
		    <th>Brand</th>
		    <th>Price</th>
		    <th>Stock</th>
		    <th>Rating</th>
  		</tr>
		<%
	for(int i=0; i<id.size(); i++){
		%>	
  		
  		<tr>
		    <td><%= Name.get(i) %></td>
		    <td><%= Category.get(i) %></td>
		    <td><%= Brand.get(i) %></td>
		    <td><%= Price.get(i) %></td>
		    <td><%= Stock.get(i) %></td>
		    <td><%= Rating.get(i) %></td>
  		</tr>		
		<%
	}
	%>
	
	</table>
	
	
</body>
</html>