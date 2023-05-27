package controller.view;



import java.io.IOException;
import java.util.ArrayList;

import controller.attributes.Product;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAO.ProductDAO;

@WebServlet("/viewProduct")
public class viewProduct extends HttpServlet{
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	ProductDAO pdao=new ProductDAO();
	ArrayList<Product> productList = pdao.fetchProductRecord();
	request.setAttribute("productList", productList);
	RequestDispatcher rd= request.getRequestDispatcher("templates/product.jsp");
	rd.forward(request, response);
}
}