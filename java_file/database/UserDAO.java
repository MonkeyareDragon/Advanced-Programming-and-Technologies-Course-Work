
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		//Url of database is based on our mysql database.
		String url = "jdbc:mysql://localhost:3307/advanced_programming_and_technologies_course_work?useSSL=false";
		//username and password should be yours.
		String username = "root";
		String password = "";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password);
		return con;
		}

	public String registerUser(String email, String username, String pass) {
			String message = "";
			try {
				
				Connection con =  getConnection();
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
}
