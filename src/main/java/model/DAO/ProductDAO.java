package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import controller.attributes.Product;
import database.helper.ConnectionProvider;


public class ProductDAO {
	
	public ArrayList<Product> fetchProductRecord(){
		ArrayList<Product> productList = new ArrayList<>();
		Connection con;
		String query = "select * from Product";
		try {
			con = ConnectionProvider.getConnection();
			
			PreparedStatement st = con.prepareStatement(query);
			ResultSet table = st.executeQuery();
			while(table.next()) {
				int productID = table.getInt(1);
				String name = table.getString(2);
				String category = table.getString(3);
				String brand = table.getString(4);
				String productPhoto = table.getString(5);
				double price=table.getDouble(6);
				int stock=table.getInt(7);
				double rating=table.getDouble(8);
				
				Product product = new Product(productID,name,category,brand,productPhoto, price, stock, rating);
				productList.add(product);	
				System.out.println (product);
			}
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		finally {
			
			
		}
		return productList;
	}
					
	}