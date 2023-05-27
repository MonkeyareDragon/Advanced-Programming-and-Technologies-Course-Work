package controller.attributes;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import model.DAO.UpdateDAO;

/**
 * Servlet implementation class AddProduct
 */
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		String photo = request.getParameter("photo");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		String rating = request.getParameter("rating");
		
				
		UpdateDAO udao = new UpdateDAO();
		String message = udao.updateProduct(id, name, category, brand, photo, price, stock, rating);
		if(message == "Successfully Added"){
			response.sendRedirect("product.jsp");
		}

	}


}
