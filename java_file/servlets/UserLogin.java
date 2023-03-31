package servlets;

import java.io.IOException;
import database.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class UserLogin extends HttpServlet {
	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String email = request.getParameter("EmailLogin");
		String password = request.getParameter("PasswordLogin");
		
		UserDAO sDao = new UserDAO();
		boolean isValid =  sDao.checkLogin(email,password);
		if(isValid == true) {
			HttpSession session = request.getSession();
			session.setAttribute("loggedInId",email);
			response.sendRedirect("index.jsp");
		}
		else {
			response.sendRedirect("login&signup.jsp");		
		}
		
	}
}

