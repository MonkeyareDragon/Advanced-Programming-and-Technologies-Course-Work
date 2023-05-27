<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="controller.attributes.Product" %>
<%@ page import="model.DAO.DisplayDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
    // Check if user is logged in or admin
	String attributeName = "loggedInId";
	String attributeValue = (String) session.getAttribute(attributeName);
	try{
		if (session.getAttribute("loggedInId") == null) {
			response.sendRedirect(request.getContextPath() + "/login&signup.jsp");
    	}
    	if (attributeValue.equals("admin@admin.com")) {
    		System.out.println(attributeValue);
    	} else {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/accessdeniederror.jsp");
            rd.forward(request, response);
    	}
	}
    catch (Exception e){
    	response.setStatus(500);
        request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/500error.jsp");
        rd.forward(request, response);
    }
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Admin Dashboard</title>

    <!-- Font Awesome -->
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/fontawesome.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/solid.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/brands.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">

    <!-- Latest compiled and minified Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

    <!-- Responsive Tables -->
    <link rel="stylesheet" href="style/rwd-table.min.css?v=6.1.2">
    <link rel="stylesheet" href="style/docs.min.css?v=6.1.2">

    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="style/styles.css">

  </head>

  <body id="home" data-bs-spy="scroll" data-bs-target="#navbar">
    
    <div class="grid-container">

      <!-- Header -->
      <header class="header">
        <div class="menu-icon" onclick="openSidebar()">
          <span class="material-icons-outlined">menu</span>
        </div>
        <div class="header-left">
          <span class="material-icons-outlined">search</span>
        </div>
        <div class="header-right">
          <span class="material-icons-outlined">notifications</span>
          <span class="material-icons-outlined">email</span>
          <span class="material-icons-outlined">account_circle</span>
        </div>
      </header>
      <!-- End Header -->


   
      <!-- Sidebar -->
      <aside id="sidebar">
        <div class="sidebar-title">
          <div class="sidebar-brand">
            <span class="material-icons-outlined"></span> Admin's Inventory
          </div>
          <span class="material-icons-outlined" >close</span>
        </div>

        <ul class="sidebar-list">
          <li class="sidebar-list-item">
            <a href="adminhome.jsp" target="_parent">
              <span class="material-icons-outlined">dashboard</span> Dashboard
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="customer.jsp" target="_parent">
              <span class="material-icons-outlined">account_circle</span> Customers 
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="product.jsp" target="_parent">
              <span class="material-icons-outlined">fact_check</span> Products
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="purchaseorder.jsp" target="_parent">
              <span class="material-icons-outlined">add_shopping_cart</span> Purchase Orders
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="cartorder.jsp" target="_parent">
              <span class="material-icons-outlined">shopping_cart</span> Add to Carts
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="#" target="_parent">
              <span class="material-icons-outlined">poll</span> Reports
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="#" target="_parent">
              <span class="material-icons-outlined">settings</span> Settings
            </a>
          </li>
        </ul>
      </aside>
      <!-- End Sidebar -->

      <!-- Main -->
      <main class="main-container">
        <section id="demo">
          <div class="container-fluid">
              <div class="page-header">
                  <h2>Products</h2>
              </div>

              
		            <label for="search">Search Products:</label>
		            <input type="text" id="search" name="search">
		            <button type="submit">Search</button>
		            <button id="popup-button">Add Product</button>
				<form method="post" >
              <!--Pop-up Form-->
              <div class="popup-overlay"></div>
              <div class="popup-form">
              <h4>${sessionScope.addProduct}</h4>
              <%request.getSession().removeAttribute("addProduct");%>
                  <h1 class="form-header">Add Product</h1>
                  <form action="${pageContext.request.contextPath}/AddProduct" method="post" enctype="multipart/form-data">     
                      <div class="form-group">
                          <label class="form-label">Product Photo</label>
                          <div class="image-upload">
                              <div class="image-preview"></div>
                                  <label class="image-upload-label">Choose File</label>
                                  <input type="file" class="image-upload-input" id="file-upload" name="photo" accept="image/*" required>
                                  <span class="file-name"></span>
                              </div>
                          </div>           
                          <div class="form-group">
                              <label for="product_name" class="form-label">Product Name</label>
                              <input type="text" name="name" class="form-input" required>
                          </div>
                          <div class="form-group">
                              <label for="product_category" class="form-label">Product Category</label>
                              <select name="category" class="form-select" required>
                                  <option value="" disabled selected>Select Category</option>
                                  <option value="Men">Men</option>
                                  <option value="Women">Women</option>
                                  <option value="Kids">Kids</option>
                              </select>
                          </div>
                          <div class="form-group">
                              <label for="product_brand" class="form-label">Product Brand</label>
                              <input type="text" name="brand" class="form-input" required>
                          </div>
                          <div class="form-group">
                              <label for="product_price" class="form-label">Product Price</label>
                              <input type="number" name="price" class="form-input" required>
                          </div>
                          <div class="form-group">
                              <label for="product_stock" class="form-label">Product Stock</label>
                              <input type="number" name="stock" class="form-input" required>
                          </div>
                          <div class="form-group">
                              <label for="product_rating" class="form-label">Product Rating</label>
                              <input type="number" name="rating" class="form-input" min="0" max="5" step="0.1" required>
                          </div>
                          <button type="submit"  class="form-submit-btn" onclick="javascript: form.action='AddProduct';">Add Product</button>
                      </form>
                  <button class="close-button">&times;</button>
                </form>
              </div>
          </div>
	           

              <div data-responsive-table-toolbar="tech-companies"></div>
              <div class="table-responsive" id="tech-companies-wrapper" data-pattern="priority-columns" data-sortable="true">
                  <table cellspacing="0" id="tech-companies" class="table table-small-font table-tighten table-bordered table-striped">
                      <thead>
                      	<%
						try {
						Product[] products = DisplayDAO.executeQuery("SELECT * FROM Product");
						%>
                           <tr>
                              <th>Product ID</th>
                              <th data-priority="3">Photo</th>
                              <th data-priority="1">Name</th>
                              <th data-priority="3">Category</th>
                              <th data-priority="3">Brand</th>
                              <th data-priority="6">Price</th>
                              <th data-priority="6">Stock</th>
                              <th data-priority="6">Rating</th>
                          </tr>
                      </thead>
                      <tbody>
                       <% for (Product product : products) { 
    					%>
                         <tr onclick="profileedit('<%= product.getId() %>')">
                          	  <th>ID No.<span class="co-name"><%= product.getId() %></span></th>
                          	  <td><img src="<%= product.getPhoto() %>"></td>
               				  <td><%= product.getName() %></td>
            				  <td><%= product.getCategory() %></td>
             				  <td><%= product.getBrand() %></td>
            				  <td><%= product.getPrice() %></td>
            				  <td><%= product.getStock() %></td>
            				  <td><%= product.getRating() %></td>
        				</tr>
   					<% } %>
						</tbody>
                  		</table>

					<%
					} catch (SQLException e) {
    				e.printStackTrace();
					}
					%>
              </div>
          </div>
      </section>
          

      </main>
      <!-- End Main -->

    </div>

    <!-- Scripts -->
    <!-- ApexCharts -->
    <script>
function profileedit(val){
	window.location.href = "EditProduct.jsp?" + val;
	}
</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
    <!-- Custom JS -->
    <script src="scripts/scripts.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

        <!-- Latest compiled and minified Bootstrap JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

        <script src="scripts/rwd-table.js?v=6.1.2"></script>
        <script src="scripts/docs.min.js"></script>
  </body>
</html>