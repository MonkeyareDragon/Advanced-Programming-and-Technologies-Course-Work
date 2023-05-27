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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Admin Dashboard</title>

    <!-- Font Awesome -->
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/fontawesome.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/solid.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/brands.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">

    <!-- Latest compiled and minified Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="style/styles.css">
    
  </head>
  <body>
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
        <div class="main-title">
          <p class="font-weight-bold">Dashboard</p>
        </div>

        <div class="main-cards">
        <%
    Connection con = ConnectionProvider.getConnection();
	String query = "SELECT COUNT(*) AS Sum FROM Product";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	ArrayList<String> noofproduct = new ArrayList();
	while(rs.next()){
		noofproduct.add(rs.getString("Sum"));
	}
	%>
	<%
	for(int i=0; i<noofproduct.size(); i++){
		%>	
          <div class="card">
            <div class="card-inner">
              <p class="text-primary">PRODUCTS</p>
              <span class="material-icons-outlined text-blue">inventory_2</span>
            </div>
            <span class="text-primary font-weight-bold"><%= noofproduct.get(i) %></span>
          </div>
 	<%
	}
	%>
	<%
	String query2 = "SELECT COUNT(*) AS Sum FROM Purchase";
	Statement stmt2 = con.createStatement();
	ResultSet rs2 = stmt.executeQuery(query2);
	ArrayList<String> noofpurchase = new ArrayList();
	while(rs2.next()){
		noofpurchase.add(rs2.getString("Sum"));
	}
	%>
	<%
	for(int i=0; i<noofpurchase.size(); i++){
		%>	
          <div class="card">
            <div class="card-inner">
              <p class="text-primary">PURCHASE ORDERS</p>
              <span class="material-icons-outlined text-orange">add_shopping_cart</span>
            </div>
            <span class="text-primary font-weight-bold"><%= noofpurchase.get(i) %></span>
          </div>
	<%
	}
	%>
	<%
	String query3 = "SELECT COUNT(*) AS Sum FROM Cart";
	Statement stmt3 = con.createStatement();
	ResultSet rs3 = stmt.executeQuery(query3);
	ArrayList<String> noofcart = new ArrayList();
	while(rs3.next()){
		noofcart.add(rs3.getString("Sum"));
	}
	%>
	<%
	for(int i=0; i<noofcart.size(); i++){
		%>
          <div class="card">
            <div class="card-inner">
              <p class="text-primary">Add to Cart</p>
              <span class="material-icons-outlined text-green">shopping_cart</span>
            </div>
            <span class="text-primary font-weight-bold"><%= noofcart.get(i) %></span>
          </div>
	<%
	}
	%>
	<%
	String query4 = "SELECT COUNT(*) AS Sum FROM users";
	Statement stmt4 = con.createStatement();
	ResultSet rs4 = stmt.executeQuery(query4);
	ArrayList<String> noofcustomer = new ArrayList();
	while(rs4.next()){
		noofcustomer.add(rs4.getString("Sum"));
	}
	%>
	<%
	for(int i=0; i<noofcustomer.size(); i++){
		%>
          <div class="card">
            <div class="card-inner">
              <p class="text-primary">Customers</p>
              <span class="material-icons-outlined text-red">account_circle</span>
            </div>
            <span class="text-primary font-weight-bold"><%= noofcustomer.get(i) %></span>
          </div>

        </div>
	<%
	}
	%>
        <div class="charts">

          <div class="charts-card">
            <p class="chart-title">Top 5 Products</p>
            <div id="bar-chart"></div>
          </div>

          <div class="charts-card">
            <p class="chart-title">Purchase and Sales Orders</p>
            <div id="area-chart"></div>
          </div>

        </div>
      </main>
      <!-- End Main -->
	
    </div>

    <!-- Scripts -->
    <!-- ApexCharts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
    <!-- Custom JS -->
    <script src="scripts/scripts.js"></script>
  </body>
</html>
}