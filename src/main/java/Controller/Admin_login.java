package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 * Servlet implementation class worker_login
 */
@WebServlet("/Admin_login")
public class Admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
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
            String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet result = statement.executeQuery();
            HttpSession session = request.getSession();
            
            if (result.next()) {
				//Storing the login details in session
				session.setAttribute("uname", result.getString("username"));
				//Redirecting response to the index.jsp
				response.sendRedirect("admin_home.jsp");	
			}
			else {
				//if wrong credentials are entered
				String message = "you have enter worng credentials";
				session.setAttribute("credential", message);
				//Redirecting response to the admin_login.jsp
				response.sendRedirect("admin_login.jsp");
			}
            
        }
            catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
