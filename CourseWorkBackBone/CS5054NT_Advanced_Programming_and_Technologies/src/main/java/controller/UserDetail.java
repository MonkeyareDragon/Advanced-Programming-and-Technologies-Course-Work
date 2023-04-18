package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import database.UserDAO;

/**
 * Servlet implementation class UserDetail
 */
public class UserDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String photo = request.getParameter("photo");
		String firstname = request.getParameter("fname");
		String lastname = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String description = request.getParameter("description");
		String paymentmethod = request.getParameter("payment");
		
				
		UserDAO udao = new UserDAO();
		String message = udao.registerUserDetails(photo, firstname, lastname, gender, description, paymentmethod);
		if(message == "Successfully Added"){
			response.sendRedirect("index.jsp");
		}

	}

}
