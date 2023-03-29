package databases;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class UserDAO {
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/student";
		String username = "root";
		String password1 = "";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		return con;
	}
	public String registerUser(String email,String password) {
		Connection con=null;
		try {
			con=getConnection();
			String query = "insert into user_registration values(?,?)";	
					
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1,email);
			st.setString(2,password);
			int rows = st.executeUpdate();
			
			
			if (rows >= 1) {
				return "Successfully Added";
			}
			else {
				return "Some problem";
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return e.getMessage();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return e.getMessage();
			
		}
	}
	public ResultSet checkLogin(String email, String password) {
		try {
			String query="select * from user_registration where email=? and password=?";
			Connection con=getConnection();
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1,email);
			st.setString(2,password);
			ResultSet table = st.executeQuery();
			return table;
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public ResultSet fetchStudentRecord(){
		try {
			String query = "select * from user_registration";
			Connection con=getConnection();
			PreparedStatement pst=con.prepareStatement(query);
			ResultSet table = pst.executeQuery();
			return table;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
}

