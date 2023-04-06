package models.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider 
{
	private static Connection con;
	public static Connection getConnection() 
	{
		try {
			if (con == null) {
				//Loadin the driver class
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				
				//Creating the connection to database
				String url = "jdbc:mysql://localhost:3307/Course_Work_Backbone?useSSL=false";
				String username = "root";
				String password = "";
				con = DriverManager.getConnection(url,username,password);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
}
