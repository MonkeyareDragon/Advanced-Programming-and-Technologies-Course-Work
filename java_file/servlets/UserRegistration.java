package servlets;

import java.io.IOException;
import database.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("EmailSignUp");
		String username = request.getParameter("UsernameSignUp");
		String password = request.getParameter("PasswordSignUp");
		
		System.out.println(email+username+password);
				
		UserDAO udao = new UserDAO();
		@SuppressWarnings("unused")
		String message = udao.registerUser(email, username, password);
		if(message == "Successfully Added"){
			response.sendRedirect("login&signup.jsp");
		}

	}

}
