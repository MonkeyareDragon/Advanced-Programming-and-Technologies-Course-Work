package controller.attributes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import model.DAO.UpdateDAO;

/**
 * Servlet implementation class EditProfile
 */
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String username = request.getParameter("username");
	
				
		UpdateDAO udao = new UpdateDAO();
		String message = udao.editProfile(id, username);
		if(message == "Successfully Added"){
			response.sendRedirect("customer.jsp");
		}
	}

}
