package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import database.UserDAO;

/**
 * Servlet implementation class EditProfileDetail
 */
public class EditProfileDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String firstname = request.getParameter("first-name");
		String lastname = request.getParameter("last-name");
		String gender = request.getParameter("gender");
		String description = request.getParameter("description");
		String paymentmethod = request.getParameter("payment-method");
		String userphoto = request.getParameter("photo");
	
				
		UserDAO udao = new UserDAO();
		String message = udao.editProfileDetails(id, firstname, lastname, gender, description, paymentmethod, userphoto);
		if(message == "Successfully Added"){
			response.sendRedirect("UserProfile.jsp");
		}
	}

}
