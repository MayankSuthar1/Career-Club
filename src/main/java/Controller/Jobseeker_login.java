package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Jobseeker_login")
public class Jobseeker_login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String dbDriver ="com.mysql.cj.jdbc.Driver";
		String dbURL = "jdbc:mysql:// localhost:3306/";
		String dbName = "pro";
		String dbUsername ="root";
		String dbPassword = "root";
        try {
        	try {
				Class.forName(dbDriver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		Connection conn = DriverManager.getConnection(dbURL + dbName,dbUsername,dbPassword);

            // Query the database for the user
            String query = "SELECT * FROM jobseeker_reg WHERE email = ? AND password = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet result = statement.executeQuery();
            HttpSession session = request.getSession();
            if (result.next()) {
                // Valid credentials, create a session and store the session ID
            	
                String sessionId = result.getString("id");
                session.setAttribute("email", email);
                session.setAttribute("id", sessionId);
                if (result.getInt("login_time") == 0) {
		            // Redirect to create profile page
		            response.sendRedirect("jobseeker_create_profile.jsp");
		            
		           
		         
		        } else {
		            // Redirect to home page
		            response.sendRedirect("jobseeker_index.jsp");
		        }

            result.close();
            statement.close();
            conn.close();
        } 
            else {
				//if wrong credentials are entered
				String message = "you have enter worng credentials";
				session.setAttribute("credential", message);
				//Redirecting response to the admin_login.jsp
				response.sendRedirect("jobseeker_login_register.jsp");
			}
        }
            catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
