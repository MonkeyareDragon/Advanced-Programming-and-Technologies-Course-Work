package controller.attributes;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import model.DAO.DeleteDAO;

/**
 * Servlet implementation class DeleteProfile
 */
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
	
				
		DeleteDAO udao = new DeleteDAO();
		String message = udao.deleteProduct(id);
		if(message == "Successfully Added"){
			response.sendRedirect("product.jsp");
		}
	}

}

