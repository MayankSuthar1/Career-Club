package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Import Database Connection Class file
import java.sql.*;
import Util.DBconnection;

/**
 * Servlet implementation class Rec_reg
 */
@WebServlet("/Rec_reg")
public class Rec_reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	

	protected void doPost(HttpServletRequest request,HttpServletResponse response)		throws ServletException, IOException
	{
		try {

			// Initialize the database
			Connection con = DBconnection.initializeDatabase();

			// Create a SQL query to insert data into demo table
			// demo table consists of two columns, so two '?' is used
			PreparedStatement st = con.prepareStatement("insert into rec_reg values(?,?,?,?)");

			// For the first parameter,
			// get the data using request object
			// sets the data to st pointer
			
			// Same for second parameter
			int id = 0;
			int login_time = 0;
			st.setInt(1,id);
			st.setString(2, request.getParameter("email"));
			st.setString(3, request.getParameter("password"));
			st.setInt(4, login_time);		
			// Execute the insert command using executeUpdate()
			// to make changes in database
			st.executeUpdate();

			// Close all the connections
			st.close();
			con.close();

		
			
			// Get a writer pointer
			// to display the successful result
			PrintWriter out = response.getWriter();
			RequestDispatcher rd=request.getRequestDispatcher("Rec_reg_email");  
			rd.forward(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}