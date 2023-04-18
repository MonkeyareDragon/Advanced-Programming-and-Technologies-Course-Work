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
    <title>My Online Store</title>
    <style>
    
    /* Styles for the header and main navigation bar */
header {
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  height: 80px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
}

nav ul {
  margin: 0;
  padding: 0;
  display: flex;
}

nav li {
  list-style: none;
  margin: 0 10px;
}

nav a {
  color: #333;
  text-decoration: none;
  font-size: 18px;
  font-weight: bold;
}

/* Styles for the hero section */
.hero {
  background-image: url('hero-image.jpg');
  background-size: cover;
  height: 400px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  color: #fff;
}

.hero h1 {
  font-size: 48px;
  margin-bottom: 20px;
}

.hero p {
  font-size: 24px;
  margin-bottom: 40px;
}

.btn {
  display: inline-block;
  padding: 12px 30px;
  border-radius: 30px;
  background-color: #ffcc00;
  color: #333;
  font-size: 18px;
  font-weight: bold;
  text-decoration: none;
  transition: background-color 0.2s ease-out;
}

.btn:hover {
  background-color: #f7c200;
}

/* Styles for the secondary navigation bar */
    .secondary-nav {
background-color: #f7f7f7;
box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
height: 50px;
display: flex;
justify-content: center;
align-items: center;
margin-top: 40px;
}

.secondary-nav ul {
margin: 0;
padding: 0;
display: flex;
}

.secondary-nav li {
list-style: none;
margin: 0 10px;
}

.secondary-nav a {
color: #333;
text-decoration: none;
font-size: 18px;
font-weight: bold;
}

/* Styles for the product listings section */
.products {
display: grid;
grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
grid-gap: 30px;
margin-top: 40px;
}

.product {
background-color: #fff;
box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
padding: 20px;
text-align: center;
}

.product img {
max-width: 100%;
height: auto;
}

.product h2 {
font-size: 24px;
margin-bottom: 10px;
}

.product-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
  margin-top: 40px;
}

.product {
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  padding: 20px;
  text-align: center;
  width: 300px;
}

.product img {
  max-width: 100%;
  height: auto;
}

.product h2 {
  font-size: 24px;
  margin-bottom: 10px;
}

.product p {
  font-size: 18px;
  margin-bottom: 20px;
}

.product input {
  background-color: #ffcc00;
  border: none;
  color: #fff;
  font-size: 18px;
  font-weight: bold;
  padding: 10px 20px;
  transition: background-color 0.2s ease;
}

.product input:hover {
  background-color: #ffa500;
  cursor: pointer;
}

    
    </style>
  </head>
  <body>
    <header>
      <nav>
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#">Shop</a></li>
          <li><a href="#">About Us</a></li>
          <li><a href="#">Contact</a></li>
          <li><a href="Cart.jsp">Cart</a></li>
        </ul>
      </nav>
    </header>
    <main>
      <div class="hero">
        <h1>Welcome to My Online Store</h1>
        <p>Discover the best products for your everyday life.</p>
        <a href="#" class="btn">Shop Now</a>
      </div>
      <nav class="secondary-nav">
        <ul>
          <li><a href="index.jsp">Feature Products</a></li>
          <li><a href="MostLovePage.jsp">Most Loved</a></li>
          <li><a href="#">Newly Added</a></li>
        </ul>
      </nav>
      <section class="products">
      
        <!-- product listings go here -->
        <div class="product-container">
        <%
        Connection con = UserDAO.getConnection();
		String query1 = "Select * from Product;";
    	Statement stmt = con.createStatement();
    	ResultSet rs = stmt.executeQuery(query1);
    	ArrayList<String> id = new ArrayList();
    	ArrayList<String> name = new ArrayList();
    	ArrayList<String> category = new ArrayList();
    	ArrayList<String> brand = new ArrayList();
    	ArrayList<String> price = new ArrayList();
    	ArrayList<String> stock = new ArrayList();
    	ArrayList<String> rating = new ArrayList();
    	while(rs.next()){
    		id.add(rs.getString("ProductID"));
    		name.add(rs.getString("Name"));
    		category.add(rs.getString("Category"));
    		brand.add(rs.getString("Brand"));
    		price.add(rs.getString("Price"));
    		stock.add(rs.getString("Stock"));
    		rating.add(rs.getString("Rating"));
    	}
    	for(int i=0; i<id.size(); i++){
    		%>	
      		
      		<div class="product">
      		<form method="post">
    			<img src="product2.jpg" alt="Product 2">
    			<h2><%= name.get(i) %></h2>
    			<p>Description of brand: <%= brand.get(i) %></p>
    			<p>category: <%= category.get(i) %></p>
    			<p>price: <%= price.get(i) %></p>
    			<p>rating: <%= rating.get(i) %></p>
    			<p>stock: <%= stock.get(i) %></p>
    			<input type="hidden" name="productid" value="<%= id.get(i) %>">
    			<input type="hidden" name="userid" value="9">
    			<input type="submit" onclick="javascript: form.action='AddCart';" value="Add to Cart">
    		</form>
  			</div>		
    		<%
    	}
    	%>
  <!-- Add more product divs as needed -->
</div>
        
      </section>
    </main>

  </body>
</html>
