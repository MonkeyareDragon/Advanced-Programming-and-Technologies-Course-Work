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
<title>All Product</title>
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
	String query = "Select * from Product";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	ArrayList<String> id = new ArrayList();
	ArrayList<String> name = new ArrayList();
	ArrayList<String> category = new ArrayList();
	ArrayList<String> brand = new ArrayList();
	ArrayList<String> productphoto = new ArrayList();
	ArrayList<String> price = new ArrayList();
	ArrayList<String> stock = new ArrayList();
	ArrayList<String> rating = new ArrayList();
	while(rs.next()){
		id.add(rs.getString("ProductID"));
		name.add(rs.getString("Name"));
		category.add(rs.getString("Category"));
		brand.add(rs.getString("Brand"));
		productphoto.add(rs.getString("ProductPhoto"));
		price.add(rs.getString("Price"));
		stock.add(rs.getString("Stock"));
		rating.add(rs.getString("Rating"));
	}
	%>
	
	<table>
		<tr>
  			<th>ProductID</th>
		    <th>Product Name</th>
		    <th>Category</th>
		    <th>Brand</th>
		    <th>ProductPhoto</th>
		    <th>Price</th>
		    <th>Stock</th>
		    <th>Rating</th>
  		</tr>
		<%
	for(int i=0; i<id.size(); i++){
		%>	
  		
  		<tr onclick="profileedit('<%= id.get(i) %>')">
		    <td><%= id.get(i) %></td>
		    <td><%= name.get(i) %></td>
		    <td><%= category.get(i) %></td>
		    <td><%= brand.get(i) %></td>
		    <td><%= productphoto.get(i) %></td>
		    <td><%= price.get(i) %></td>
		    <td><%= stock.get(i) %></td>
		    <td><%= rating.get(i) %></td>
  		</tr>		
		<%
	}
	%>
	
	</table>
	
<script>
function profileedit(val){
	window.location.href = "EditProduct.jsp?" + val;
	}
</script>
	
</body>
</html>