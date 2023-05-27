package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.helper.ConnectionProvider;

public class InsertDAO {
	
	public String registerUser(String email, String username, String pass) {
		String message = "";
		try {
			// Connect to the database
			Connection con = ConnectionProvider.getConnection();
			
			String sql = "SELECT * FROM users WHERE email = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
		        // Email is already registered, set an error message and forward back to the registration page
				message = "Unsuccessfull";
		    } else {
			//name of table should be based on our table name.
			//table column name should be based on our table.
			String query = "insert into users(email, username, password) values(?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,email);
			pst.setString(2,username);
			pst.setString(3,pass);
			int rows = pst.executeUpdate();
			if(rows >= 1) {
				message = "Successfully Added";
			}
			con.close();
		    }
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
			message = e.getMessage();
		}
		return message;	
	}
	
	 public String addCart(String userid, String productid) {
			String message = "";
			try {
				
				Connection con = ConnectionProvider.getConnection();
				String query = "insert into Cart(email, ProductID) values(?,?)";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1,userid);
				pst.setString(2,productid);
				int rows = pst.executeUpdate();
				if(rows >= 1) {
					message = "Successfully Added";
				}
				con.close();	
			} catch (SQLException | ClassNotFoundException e) {
				System.out.println(e.getMessage());
				message = e.getMessage();
			}
			return message;	
		}
	 
	 public String addPurchase(String cartid, String quantity) {
			String message = "";
			try {
				
				Connection con = ConnectionProvider.getConnection();
				String query = "insert into Purchase(CartID, Quantity) values(?,?)";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1,cartid);
				pst.setString(2,quantity);
				int rows = pst.executeUpdate();
				if(rows >= 1) {
					message = "Successfully Added";
				}
				con.close();	
			} catch (SQLException | ClassNotFoundException e) {
				System.out.println(e.getMessage());
				message = e.getMessage();
			}
			return message;	
		}
	 
	 public String addProduct(String name, String category, String brand,
			 String photo, String price, String stock, String rating) {
			String message = "";
			try {
				
				Connection con = ConnectionProvider.getConnection();
				String query = "insert into Product(Name, Category, Brand, ProductPhoto, Price, Stock, Rating) values(?,?,?,?,?,?,?)";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1,name);
				pst.setString(2,category);
				pst.setString(3,brand);
				pst.setString(4,photo);
				pst.setString(5,price);
				pst.setString(6,stock);
				pst.setString(7,rating);
				int rows = pst.executeUpdate();
				if(rows >= 1) {
					message = "Successfully Added";
				}
				con.close();	
			} catch (SQLException | ClassNotFoundException e) {
				System.out.println(e.getMessage());
				message = e.getMessage();
			}
			return message;	
		}
}
