package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import database.helper.ConnectionProvider;

public class DeleteDAO {
	public String removeCart(String cartid) {
		String message = "";
		try {
			
			Connection con = ConnectionProvider.getConnection();
			String query = "DELETE FROM Cart WHERE CartID=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,cartid);
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
	
	public String deleteProduct(String id) {
		String message = "";
		try {
			
			Connection con = ConnectionProvider.getConnection();
			String query = "DELETE FROM Product WHERE ProductID=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,id);
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
	 public String deleteProfile(String id) {
			String message = "";
			try {
				
				Connection con = ConnectionProvider.getConnection();
				String query = "DELETE FROM users WHERE id=?";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1,id);
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
