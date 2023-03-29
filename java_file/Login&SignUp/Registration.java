package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databases.UserDAO;
@WebServlet("/registration")
public class Registration extends HttpServlet{

	public void service(HttpServletRequest request,HttpServletResponse response ) throws IOException, ServletException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		
		System.out.println(email+" "+password);
		
		UserDAO udao = new UserDAO();
		String message = udao.registerUser(email,password);
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		out.println("<h1>"+message+"</h1>");

		
		RequestDispatcher rd = request.getRequestDispatcher("Registration.html");
		rd.include(request, response);	
		

		
	}

}
