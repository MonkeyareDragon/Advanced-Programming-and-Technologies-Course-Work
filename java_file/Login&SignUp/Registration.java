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
		String id = request.getParameter("id");
		String name = request.getParameter("name");
    if(request.getParameter("password")==request.getParameter("confirm_password")){
		  String password = request.getParameter("confirm_password");
      System.out.println(id+" "+name+" "+gender+" "+password);
		
      StudentDao sdao = new StudentDao();
      String message = sdao.registerStudent(id,name,gender,password);

      response.setContentType("text/html");

      PrintWriter out = response.getWriter();
      out.println("<h1>"+message+"</h1>");


      RequestDispatcher rd = request.getRequestDispatcher("StudentRegistration.html");
      rd.include(request, response);	
		
    }
    else{
      
    }
	}

}

