package controller.attributes;

import java.io.IOException;

import database.helper.AESEncryption;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DAO.DisplayDAO;

@WebServlet("/login")
@SuppressWarnings("serial")
public class UserLogin extends HttpServlet {
	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String email = request.getParameter("EmailLogin");
		String password = request.getParameter("PasswordLogin");
		
		String encryptedPassword = AESEncryption.encrypt(password);
		
		DisplayDAO sDao = new DisplayDAO();
		boolean isValid =  sDao.checkLogin(email,encryptedPassword);
		if(isValid == true) {
			HttpSession session = request.getSession();
			session.setAttribute("loggedInId",email);
			Cookie sessionCookie = new Cookie("sessionid", session.getId());
			sessionCookie.setMaxAge(60 * 60 * 24 * 7); // set cookie to expire in 7 days
			response.addCookie(sessionCookie);
			response.sendRedirect("home.jsp");
		}
		else {
			// User credentials are invalid, set an error message and forward back to the login page
	        request.setAttribute("errorMessage", "Invalid username or password. Please try again.");
	        RequestDispatcher rd = request.getRequestDispatcher("login&signup.jsp");
	        rd.forward(request, response);
		}
		
	}
}
