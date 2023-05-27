<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="controller.attributes.Product" %>
<%@ page import="model.DAO.DisplayDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    
    HttpSession session1 = request.getSession(false);
 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Programming Course Work</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="style/HomeCSS.css">

</head>
<body>
    
<!-- header section starts  -->

<header class="header">

    <a href="home.jsp" class="logo"> <i class="fas fa-shopping-cart"></i> shop </a>

    <nav class="navbar">
        <a href="home.jsp">home</a>
        <a href="viewProduct">products</a>
        <a href="login&signup.jsp"><button id="login-btn" class="Log-btn">Login</button></a>
        <a href="logout"><button id="logout-btn" class="Log-btn" >Logout</button></a>
    </nav>

    <div class="icons">
        <div id="menu-btn" class="fas fa-bars"></div>
        <div id="search-btn" class="fas fa-search"></div>
        <a href="addtocart.jsp" class="fas fa-shopping-cart"></a>
        <a href="profile" class="fa fa-user"></a>
    </div>

    <form action="Search" class="search-form">
        <input  name="" placeholder="search here..." id="search-box">
        <label  for="search-box" class="fas fa-search" ></label>
    </form>

</header>

<!-- header section ends -->



<!-- products section starts  -->

<section class="products" id="products">

    <h1 class="heading"> exclusive  </h1>

    <div class="filter-buttons">
  	<a href="home.jsp" class="buttons active" data-filter="all">All</a>
  	<a href="home+new&feature.jsp" class="buttons">New & Feature</a>
  	<a href="home+highest+price.jsp" class="buttons">Highest Price</a>
  	<a href="home+highest+rating.jsp" class="buttons">Highest Rating</a>
	</div>
	
	<form method="post">
    <div class="box-container">
    	
    	<%
    	
		try {
			Product[] products = DisplayDAO.executeQuery("SELECT * FROM Product");
			for (Product product : products) {
		%>
        <div class="box" data-item="featured">
            <div class="icons">
            	<input type="hidden" name="productid" value="<%= product.getId() %>">
                <a class="fas fa-shopping-cart"><input onclick="javascript: form.action='AddtoCart';" type="submit"  value="Add to Cart"> </a>
            </div>
            <div class="image">
                <img src="images/products/img.jpg" alt="">
            </div>
            <div class="content">
                <h3><%= product.getName() %></h3>
                <div class="price">
                    <div class="amount">Rs.<%= product.getPrice() %></div>
                </div>
                <div class="stars">
                <%
                for (int i = 1; i <= product.getRating(); i++) {
                %>
                	<i class="fas fa-star"></i>	
                <% 
                }
                
            	if(product.getRating() % 1 != 0 ){
            	%>
            		<i class="fas fa-star-half-alt"></i>
            	<% 
            	}
            	%>
                    <span>(<%= product.getRating() %>)</span>
                </div>
            </div>
        </div>
        <% } 
				
		} catch (SQLException e) {
    		e.printStackTrace();
		}
		%>
		
    </div>
</form>
</section>

<!-- products section ends -->





<!-- footer section starts  -->

<section class="footer">

    <div class="share">
        <a href="https://www.facebook.com/" class="fab fa-facebook-f"></a>
        <a href="https://twitter.com/" class="fab fa-twitter"></a>
        <a href="https://www.linkedin.com/" class="fab fa-linkedin"></a>
        <a href="https://www.instagram.com/" class="fab fa-instagram"></a>
    </div>

    <div class="credit"> &copy; copyright @ 2023 by <span>Mr. Mohit Maan Shrestha</span> </div>
    
</section>

<!-- footer section ends -->




<!-- custom js file link -->
<script src="scripts/Home.js"></script>
<script>
    function updateButton() {
        // Get the login and logout buttons
        var loginBtn = document.getElementById("login-btn");
        var logoutBtn = document.getElementById("logout-btn");

        // Check if the user is logged in
        if ('<%= session1 == null || session1.getAttribute("loggedInId") == null %>') {
            // User is logged in, hide the login button and show the logout button
           		loginBtn.style.display = "block";
            	logoutBtn.style.display = "none";
            	
            	
            }
        } else {
            // User is not logged in, show the login button and hide the logout button
        	loginBtn.style.display = "none";    
        	logoutBtn.style.display = "block";
            	
            }
        }
    }

// Call the updateButton() function when the page loads
window.onload = updateButton;
</script>



</body>
</html>