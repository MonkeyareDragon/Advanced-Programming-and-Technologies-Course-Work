package controller.view;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Payment;
import model.Users;
import model.DAO.PaymentDAO;
import model.DAO.UserDAO;



@WebServlet("/profile")

public class ViewProfile extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session.getAttribute("loggedInId") == null) {
			response.sendRedirect(request.getContextPath() + "/login&signup.jsp");
    	}
		String attributeName = "loggedInId";
		String currentUser = (String) session.getAttribute(attributeName);
		
		UserDAO udao=new UserDAO();
		Users user=udao.fetchUserRecord(currentUser);
		System.out.println( user.getUserDetailsId()+user.getFirstName()+ user.getLastName());
		
		
		
		PaymentDAO pdao=new PaymentDAO();
		Payment userPayment=pdao.fetchPaymentRecord(currentUser);
		if (userPayment == null) {
			userPayment= new Payment("","","","","");
		}
		System.out.println( userPayment.getPaymentMethod()+userPayment.getCardNo()+ userPayment.getCvcNo());
		request.setAttribute("currentUser", user);
		request.setAttribute("userPayment", userPayment);
		RequestDispatcher rd= request.getRequestDispatcher("templates/userProfile.jsp");
		rd.forward(request,response);
	}
	

}