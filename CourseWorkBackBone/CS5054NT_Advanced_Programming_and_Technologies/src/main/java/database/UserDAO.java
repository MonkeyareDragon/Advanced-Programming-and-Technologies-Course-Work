
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3307/advanced_programming_and_technologies_course_work?useSSL=false";
		String username = "root";
		String password = "";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password);
		return con;
		}

	public String registerUser(String email, String username, String pass) {
			String message = "";
			try {
				
				Connection con =  getConnection();
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
			} catch (SQLException | ClassNotFoundException e) {
				System.out.println(e.getMessage());
				message = e.getMessage();
			}
			return message;	
		}
	 
	 public boolean checkLogin(String email, String password) {
			boolean isValid = false;
			try {
				Connection con = getConnection();
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
	 
	 
	 public String registerUserDetails(String photo, String firstname, String lastname,
			 String gender, String description, String paymentmethod) {
			String message = "";
			try {
				
				Connection con =  getConnection();
				String query = "insert into UserDetails(FirstName, LastName, Gender, Description, PaymentMethod, UserPhoto) values(?,?,?,?,?,?)";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1,firstname);
				pst.setString(2,lastname);
				pst.setString(3,gender);
				pst.setString(4,description);
				pst.setString(5,paymentmethod);
				pst.setString(6,photo);
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
	 
	 
	 public String registerProduct(String name, String category, String brand,
			 String photo, String price, String stock, String rating) {
			String message = "";
			try {
				
				Connection con =  getConnection();
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
	 
	 public String editProfile(String id, String username, String email) {
			String message = "";
			try {
				
				Connection con =  getConnection();
				String query = "UPDATE users\n"
						+ "SET username=?, email=?\n"
						+ "WHERE id=?;";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1,username);
				pst.setString(2,email);
				pst.setString(3,id);
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
	 
	 public String editProfileDetails(String id, String firstname, String lastname, String gender
			 , String description, String paymentmethod, String userphoto) {
			String message = "";
			try {
				
				Connection con =  getConnection();
				String query = "UPDATE UserDetails\n"
						+ "SET FirstName=?, LastName=?, Gender=?, Description=?, PaymentMethod=?, UserPhoto=?\n"
						+ "WHERE UserDetailsID=?;";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1,firstname);
				pst.setString(2,lastname);
				pst.setString(3,gender);
				pst.setString(4,description);
				pst.setString(5,paymentmethod);
				pst.setString(6,userphoto);
				pst.setString(7,id);
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
				
				Connection con =  getConnection();
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
	 
	 public String addCart(String userid, String productid) {
			String message = "";
			try {
				
				Connection con =  getConnection();
				String query = "insert into Cart(UserID, ProductID) values(?,?)";
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
}
