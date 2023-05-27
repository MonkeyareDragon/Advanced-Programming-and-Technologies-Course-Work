<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.DAO.InsertDAO"%>
<%@page import="database.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
<%
    // Check if user is logged in
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("loggedInId") == null) {
        response.sendRedirect(request.getContextPath() + "/login&signup.jsp");
        
    } 
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Add to Cart</title>
    <link rel="stylesheet" href="style.css">
    <style>
    body {
  font-family: Arial, sans-serif;
  margin: 0;
}

header {
  background-color: #333;
  color: #fff;
  padding: 20px;
}

nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

nav li {
  display: inline-block;
  margin-right: 20px;
}

nav a {
  color: #fff;
  text-decoration: none;
}

main {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

h1 {
  font-size: 36px;
  margin-top: 0;
}


.product-box{
	padding: 10px;
}

.product-list {
  list-style: none;
  margin: 0;
  padding: 0;
  margin-bottom: 10px;
}

.product-list li {
  display: flex;
  border: 1px solid #ccc;
  margin-bottom: 20px;
}

.product-list li img {
  max-width: 200px;
  margin-right: 20px;
}

.product-list li .product-info {
  flex: 1;
}

.product-list li h2 {
  font-size: 24px;
  margin-top: 0;
}

.product-list li p {
  margin-top: 0;
}

.product-list li .price {
  font-size: 18px;
  font-weight: bold;
  color: #000000;
}

.product-list li form {
  display: flex;
  margin-top: 10px;
}

.product-list li form label {
  margin-right: 10px;
}

.product-list li form select {
  margin-right: 10px;
  padding: 5px;
  border-radius: 5px;
  border: 1px solid #ccc;
}

.product-list li form button {
  padding: 5px 10px;
  border-radius: 5px;
  border: none;
  background-color: #000000;
  color: #fff;
  cursor: pointer;
  margin: 7px;
}

.product-list li form button:hover {
  background-color: #8c8c8c;
}
    
  </style>
  </head>

  <body>
    <header>
      <nav>
        <ul>
          <li><a href="home.jsp">Back to Home</a></li>
          <li><a href="viewProduct">Products</a></li>
        </ul>
      </nav>
    </header>
    <main>
    	<%
    String attributeName = "loggedInId";
    String attributeValue = (String) session.getAttribute(attributeName);
    System.out.println(attributeValue);
    Connection con = ConnectionProvider.getConnection();
	String query = "Select C.CartID, P.Name, P.Category, P.Brand, P.Price, P.Stock, P.Rating FROM Cart C JOIN Product P ON C.ProductID = P.ProductID JOIN users U ON C.email = U.email WHERE U.email = '"+attributeValue+"'";
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
      <h1>Add to Cart</h1>
      <%
	for(int i=0; i<id.size(); i++){
		%>	
      <ul class="product-list">
        <li>
          <img src="product1.jpg" alt="Product 1">
          <div class= "product-box">
          <div class="product-info">
            <h2>Name of Product:<%= Name.get(i) %></h2>
            <p>Name of Category:<%=Category.get(i) %></p>
            <p>Name of Brand:<%= Brand.get(i) %></p>
            <p class="price">Each Price: Rs.<%= Price.get(i) %></p>
            <form  method="post">
              <label for="quantity1">Quantity:</label>
              <select id="quantity1" name="quantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
              </select>
              <input type="hidden" name="cartid" value="<%= id.get(i) %>">
              <button type="submit" onclick="javascript: form.action='PurchaseProduct';" >Purchase</button>
              <button type="submit" onclick="javascript: form.action='RemoveCart';">Remove</button>
            </form>
          </div>
          </div>
        </li>
      </ul>
      <%
	}
	%>
    </main>
  </body>
</html>
