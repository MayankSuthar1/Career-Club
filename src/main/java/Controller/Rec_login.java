package Controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Util.DBconnection;

/**
 * Servlet implementation class Admin_Login
 */
@WebServlet("/Rec_login")
public class Rec_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Getting all data form use/customer
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		//Creating Sesssion
		HttpSession hs = request.getSession();
		try {
			//Creating Result Set
			
			//Query to check login details
			 ResultSet resultset = DBconnection.getResultFormSqlQuery("select * from rec_reg where email='"+email+"' and password='"+password+"'");
			//checking whether the details of user are null or not
			if (resultset.next()) {
				//Storing the login details in session
				hs.setAttribute("email", resultset.getString("email"));
				//Redirecting response to the index.html
				// Check if user has logged in before
		        if (resultset.getInt("login_time") == 0) {
		            // Redirect to create profile page
		            response.sendRedirect("recruiter_create_profile.jsp");
		            
		           
		         
		        } else {
		            // Redirect to home page
		            response.sendRedirect("recruiter_index.jsp");
		        }
			//	response.sendRedirect("recruiter_index.jsp");	
			}
			else {
				//if wrong credentials are entered
				String message = "you have enter worng credentials";
				hs.setAttribute("credential", message);
				//Redirecting response to the admin_login.html
				response.sendRedirect("recruiter_login_register.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}