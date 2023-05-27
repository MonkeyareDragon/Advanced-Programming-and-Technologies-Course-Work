package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.helper.ConnectionProvider;
import model.Payment;

public class PaymentDAO {
	
	

	public String currentUser(String email) {
		String currentUser = email;
		return currentUser;
	}
	
	
	
	public Payment fetchPaymentRecord(String currentUser) {
		String query1 = "SELECT * FROM payment WHERE email = '" + currentUser + "'";
		System.out.println(query1);
		Connection con=null;
		Payment userPayment=null;
		try {
			 con = ConnectionProvider.getConnection();
			
			PreparedStatement st = con.prepareStatement(query1);
			ResultSet table = st.executeQuery();
			while(table.next()) {
				String paymentMethod = table.getString(2);
				String cardNo = table.getString(3);
				String cvc = table.getString(4);
				String expiryDate = table.getString(5);
				System.out.println("hello");
				System.out.println(paymentMethod+cardNo+cvc+expiryDate );
				
				userPayment = new Payment(paymentMethod, cardNo,cvc, expiryDate, currentUser);
				System.out.println(query1);
				System.out.println (userPayment);
			}	
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return userPayment;
	}
	
	
	public String RegisterUpdatePaymentDetails(Payment userPay, String currentUser){
		System.out.println("Current user: " + currentUser);
		Payment userPayment = null;
		Connection con = null;
		String message=null;
		
		String query1 = "SELECT * FROM payment WHERE email = '" + currentUser + "'";
		

		try {
			 con = ConnectionProvider.getConnection();
			
			PreparedStatement st = con.prepareStatement(query1);
			ResultSet table = st.executeQuery();
			while(table.next()) {
				String paymentMethod = table.getString(2);
				String cardNo = table.getString(3);
				String cvc = table.getString(4);
				String expiryDate = table.getString(5);
				System.out.println("hello");
				System.out.println(paymentMethod+cardNo+cvc+expiryDate );
				
				userPayment = new Payment(paymentMethod, cardNo,cvc, expiryDate, currentUser);
				System.out.println(query1);
				System.out.println (userPayment);
			}	
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		if (userPayment == null) {
			try {
				String query="insert into payment(PaymentMethod, CardNumber, CVC, ExpiryDate, UserID) values(?,?,?,?,?)";
				con=ConnectionProvider.getConnection();
				PreparedStatement pay = con.prepareStatement(query);
				pay.setString(1,userPay.getPaymentMethod());
				pay.setString(2,userPay.getCardNo());
				pay.setString(3,userPay.getCvcNo());
				pay.setString(4,userPay.getExpirationDate());
				pay.setString(5,userPay.getUserId());
				int rows = pay.executeUpdate();
				if(rows >= 1) {
					message = "Payment Successfully Added";
				}
				System.out.println(query);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				message=e.getMessage();			}
			
			
		}else {
			String query2="UPDATE payment SET PaymentMethod ='"+userPay.getPaymentMethod()+"', "
					+ "CardNumber='"+userPay.getCardNo()+"', CVC='"+userPay.getCvcNo()+"', ExpiryDate='"+userPay.getExpirationDate()+"' "
							+ "WHERE email = '"+userPay.getUserId()+"'";
			
			try {
				PreparedStatement pay = con.prepareStatement(query2);
				int rows = pay.executeUpdate();
				if(rows >= 1) {
					message = "Payment Successfully Updated";
				}
				System.out.println(query2);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				message=e.getMessage();			}
			
		
		
		
	
			System.out.println(query2);
		}
		
		return message;
	}
}