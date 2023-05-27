package controller.attributes;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import model.DAO.InsertDAO;

/**
 * Servlet implementation class AddProduct
 */

public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		String photo = request.getParameter("photo");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		String rating = request.getParameter("rating");
		
		InsertDAO udao = new InsertDAO();
		String message = udao.addProduct(name, category, brand, photo, price, stock, rating);
		if(message == "Successfully Added"){
			response.sendRedirect("product.jsp");
		}

	}


}