package model.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import database.helper.ConnectionProvider;
import controller.attributes.Product;

public class DisplayDAO {

	public static Product[] executeQuery(String sql) throws SQLException, ClassNotFoundException {
	    // Connect to the database
		Connection con = ConnectionProvider.getConnection();
		
	    // Create an SQL statement
	    java.sql.Statement statement = con.createStatement();

	    // Execute the SQL statement
	    ResultSet resultSet = statement.executeQuery(sql);

	    // Store the data in an ArrayList
	    ArrayList<Product> productList = new ArrayList<>();
	    while (resultSet.next()) {
	        int id = resultSet.getInt("ProductID");
	        String name = resultSet.getString("Name");
	        String category = resultSet.getString("Category");
	        String brand = resultSet.getString("Brand");
	        String photo = resultSet.getString("ProductPhoto");
	        double price = resultSet.getDouble("Price");
	        int stock = resultSet.getInt("Stock");
	        double rating = resultSet.getDouble("Rating");
	        Product product = new Product(id, name, category, brand, photo, price, stock, rating);
	        productList.add(product);
	    }

	    // Convert the ArrayList to an array
	    Product[] productArray = productList.toArray(new Product[0]);

	    // Close the result set, statement, and connection
	    resultSet.close();
	    statement.close();
	    con.close();

	    // Return the array of data
	    return productArray;
	}
	
	public boolean checkLogin(String email, String password) {
		boolean isValid = false;
		try {
			Connection con = ConnectionProvider.getConnection();
			String query = "select * from users where email=? and password=?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, email);
			st.setString(2, password);
			ResultSet table = st.executeQuery();
			if(table.next()) {
				isValid = true;
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isValid;
		
	}

}
