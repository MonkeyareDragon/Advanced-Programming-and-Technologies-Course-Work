package controller.update;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DAO.UserDAO;



@WebServlet("/update-password")
	
	public class UpdatePassword extends HttpServlet {
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session = request.getSession(false);
			String attributeName = "loggedInId";
			String currentUser = (String) session.getAttribute(attributeName);
			
			String oldPassword = request.getParameter("currentPassword");
			String newPassword = request.getParameter("newPassword");
			
		
			
			String message =  new UserDAO().updatePassword(oldPassword,newPassword, currentUser);
			
			HttpSession session1=request.getSession();
			session1.setAttribute("updatePasswordMessage", message);
			response.sendRedirect("templates/userProfile.jsp");
			
		}
	}

