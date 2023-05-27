package controller.attributes;

import java.io.IOException;

import database.helper.AESEncryption;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAO.InsertDAO;


public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("EmailSignUp");
		String username = request.getParameter("UsernameSignUp");
		String password = request.getParameter("PasswordSignUp");
		String encryptedPassword = AESEncryption.encrypt(password);
				
		InsertDAO udao = new InsertDAO();
		@SuppressWarnings("unused")
		String message = udao.registerUser(email, username, encryptedPassword);
		if(message == "Successfully Added"){
			response.sendRedirect("home.jsp");
		} else {
			request.setAttribute("errorMessageregister", "Email is already registered. Please use a different email address.");
	        RequestDispatcher rd = request.getRequestDispatcher("login&signup.jsp");
	        rd.forward(request, response);
		}

	}

}