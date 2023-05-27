package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import database.helper.ConnectionProvider;

public class UpdateDAO {
	public String updateProduct(String id, String name, String category, String brand,
			 String photo, String price, String stock, String rating) {
			String message = "";
			try {
				
				Connection con = ConnectionProvider.getConnection();
				String query = "UPDATE Product\n"
						+ "SET Name=?, Category=?, Brand=?, ProductPhoto=?, Price=?, Stock=?, Rating=?\n"
						+ "WHERE ProductID=?;";;
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1,name);
				pst.setString(2,category);
				pst.setString(3,brand);
				pst.setString(4,photo);
				pst.setString(5,price);
				pst.setString(6,stock);
				pst.setString(7,rating);
				pst.setString(8,id);
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
	
	 public String editProfile(String id, String username) {
			String message = "";
			try {
				
				Connection con = ConnectionProvider.getConnection();
				String query = "UPDATE users\n"
						+ "SET username=?\n"
						+ "WHERE id=?;";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1,username);
				pst.setString(2,id);
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
