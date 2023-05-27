package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.helper.ConnectionProvider;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

public class UserDAO {
	public String currentUser(String email) {
		String currentUser=email;
		return currentUser;
	}
	
	
	public Users fetchUserRecord(String currentUser){
		
		System.out.println("Current user: " + currentUser);
		Users user = null;
		Connection con = null;
		String query = "SELECT * FROM UserDetails WHERE email = '" + currentUser + "'";
		System.out.println(query);

		try {
			con = ConnectionProvider.getConnection();
			
			PreparedStatement st = con.prepareStatement(query);
			ResultSet table = st.executeQuery();
			while(table.next()) {
				String userDetailsId = table.getString(1);
				String firstName = table.getString(2);
				String lastName = table.getString(3);
				String gender = table.getString(4);
				String description = table.getString(5);
				String userPhoto=table.getString(7);
				String email=table.getString(8);
				System.out.println("hello");
				System.out.println( userDetailsId+firstName+ lastName+ gender+ description+ userPhoto + email );
				
				user = new Users(userDetailsId,firstName,lastName,gender,description, userPhoto, email);
					
				System.out.println (user);
			}
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return user;
	}
	
	public String updatePassword(String oldPassword, String newPassword , String currentUser){
		System.out.println("Current user: " + currentUser);
		Connection con = null;
		String message="";
		String query = "SELECT password FROM users WHERE email = '" + currentUser + "'";
		System.out.println(query);

		try {
			con = ConnectionProvider.getConnection();
			PreparedStatement st = con.prepareStatement(query);
			ResultSet table = st.executeQuery();
			String oldPassword1="";
			while(table.next()) {
				
				
				oldPassword1=table.getString(1);
				System.out.println( oldPassword+oldPassword1+ newPassword);
			}
			if (oldPassword.equals(oldPassword1)) {
				
				String query2 = "UPDATE users SET Password = "+newPassword+" WHERE email = '"+currentUser+"'";
				PreparedStatement pst = con.prepareStatement(query2);
				int rows = pst.executeUpdate();
				if(rows >= 1) {
					message = "Password Successfully Updated";
				}
			}else {
				message="Wrong old password!";
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			message= e.getMessage();
			
		}
		
		return message;
	}
	
	
	public String updateUserInfo(String profilePhoto, String firstName, String lastName, String email, String gender, String currentUser){
		System.out.println("Current user: " + currentUser);
		Connection con = null;
		String message="";

		try {
			con = ConnectionProvider.getConnection();		
				String query2 = "UPDATE UserDetails SET FirstName = '"+firstName+"', LastName = '"+lastName+"', "
						+ "Email = '"+email+"', Gender='"+gender+"', UserPhoto='"+profilePhoto+"'"
						+ " WHERE Email = '"+currentUser+"'";
				
				PreparedStatement pst = con.prepareStatement(query2);
				int rows = pst.executeUpdate();
				if(rows >= 1) {
					message = "User Successfully Updated";
				}
				else {
					message="Not Updated! Something must be wrong";
				}
			
			
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			message= e.getMessage();
			
		}
		
		return message;
	}
					
	}