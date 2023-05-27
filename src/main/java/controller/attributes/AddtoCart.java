package controller.attributes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DAO.InsertDAO;

import java.io.IOException;

/**
 * Servlet implementation class AddCart
 */

public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String attributeName = "loggedInId";
	    String attributeValue = (String) session.getAttribute(attributeName);
		String email = attributeValue;
		String productid = request.getParameter("productid");
		
				
		InsertDAO udao = new InsertDAO();
		String message = udao.addCart(email, productid);
		if(message == "Successfully Added"){
			response.sendRedirect("home.jsp");
		}
	}

}
