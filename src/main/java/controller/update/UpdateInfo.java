package controller.update;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.DAO.UserDAO;

@WebServlet("/update-info")
@MultipartConfig
public class UpdateInfo extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String attributeName = "loggedInId";
		String currentUser = (String) session.getAttribute(attributeName);
		
		
		
		Part profilePhoto=request.getPart("profilePhoto");
		String name=request.getParameter("newName");
		String email=request.getParameter("newEmail");
		String gender = request.getParameter("newGender");
		
		System.out.println(name+"99999");
		String[] names = name.split(" ");
		String firstName = names[0];
		String lastName = names[1];
		
		
		String idForPhoto=new UserDAO().currentUser(currentUser);
		System.out.println(idForPhoto);
		
		String[] idsForPhoto = idForPhoto.split("@");
		String photoId = idsForPhoto[0];
		System.out.println(photoId);
	
		String userProfilePath="profile/"+photoId+".png";
		
		
		String message =  new UserDAO().updateUserInfo(userProfilePath, firstName, lastName,email, gender , currentUser);
		
		
		if (message.equals("Successfully Updated") && profilePhoto != null && profilePhoto.getInputStream().available()>0){
			String imagePath="/home/kabin/eclipse-workspaceow/Java-Group-Course-Work/src/main/webapp/images/";
			String fullPath=imagePath+userProfilePath;
			
			profilePhoto.write(fullPath);
		}
		HttpSession session1=request.getSession();
		session1.setAttribute("updateInfoMessage", message);
		response.sendRedirect("templates/userProfile.jsp");
		
	}
}