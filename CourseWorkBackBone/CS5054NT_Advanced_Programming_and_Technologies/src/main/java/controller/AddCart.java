package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import database.UserDAO;

/**
 * Servlet implementation class AddCart
 */
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String productid = request.getParameter("productid");
		
				
		UserDAO udao = new UserDAO();
		String message = udao.addCart(userid, productid);
		if(message == "Successfully Added"){
			response.sendRedirect("index.jsp");
		}
	}

}
