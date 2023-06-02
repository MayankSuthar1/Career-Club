package Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.*;

import Util.DBconnection;

/**
 * Servlet implementation class Rec_reg
 */
@WebServlet("/Rec_create_profile")
public class Rec_create_profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	

	protected void doPost(HttpServletRequest request,HttpServletResponse response)	throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		try {

			// Initialize the database
			Connection con = DBconnection.initializeDatabase();

			// Create a SQL query to insert data into demo table
			// demo table consists of two columns, so two '?' is used
			PreparedStatement st = con.prepareStatement("insert into rec_profile values(?,?,?,?,?,?,?,?)");

			// For the first parameter,
			// get the data using request object
			// sets the data to st pointer
			
			// Same for second parameter
			String id = (String) session.getAttribute("id");			
			int admin_checked = 0 ;
			st.setString(1,id);
			st.setString(2, request.getParameter("com_name"));
			st.setString(3, request.getParameter("com_email"));
			st.setString(4, request.getParameter("business"));
			st.setString(5, request.getParameter("address"));
			st.setString(6, request.getParameter("con_num"));
			st.setString(7, request.getParameter("name"));
			st.setInt(8,admin_checked);
			// Execute the insert command using executeUpdate()
			// to make changes in database
			st.executeUpdate();
			//updating that user is login for first time and now its have profile so that next time it will redirect to the index page
			Statement stmt = con.createStatement();
			String company_email =request.getParameter("com_email");
			String sql ="Update rec_reg set login_time=1 where id='" + id + "'";
			stmt.executeUpdate(sql);
			// Close all the connections
			st.close();
			stmt.close();
			con.close();

		
			
			// Get a writer pointer
			// to display the successful result
			PrintWriter out = response.getWriter();
			RequestDispatcher rd=request.getRequestDispatcher("recruiter_index.jsp");  
			rd.forward(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}