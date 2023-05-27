package controller.attributes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAO.InsertDAO;

import java.io.IOException;

/**
 * Servlet implementation class AddCart
 */

public class PurchaseProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String cartid = request.getParameter("cartid");
		String quantity = request.getParameter("quantity");
		
				
		InsertDAO udao = new InsertDAO();
		String message = udao.addPurchase(cartid, quantity);
		if(message == "Successfully Added"){
			response.sendRedirect("addtocart.jsp");
		}
	}

}
