package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import database.UserDAO;

/**
 * Servlet implementation class DeleteProfile
 */
public class DeleteProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
	
				
		UserDAO udao = new UserDAO();
		String message = udao.deleteProfile(id);
		if(message == "Successfully Added"){
			response.sendRedirect("User.jsp");
		}
	}

}
