package controller.attributes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAO.DeleteDAO;

import java.io.IOException;

/**
 * Servlet implementation class AddCart
 */

public class RemoveCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cartid = request.getParameter("cartid");
		
				
		DeleteDAO udao = new DeleteDAO();
		String message = udao.removeCart(cartid);
		if(message == "Successfully Added"){
			response.sendRedirect("addtocart.jsp");
		}
	}

}
