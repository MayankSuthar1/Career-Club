package Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.annotation.*;

import Util.DBconnection;

/**
 * Servlet implementation class jobseeker_result_process
 */
@WebServlet("/jobseeker_result_process")
public class jobseeker_result_process extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jobseeker_result_process() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("id");
		String driver = "com.mysql.cj.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String database = "pro";
		String userid = "root";
		String password = "root";
		String job_id = request.getParameter("job_id");
		HttpSession session = request.getSession();
		try {
		Class.forName(driver);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		String title = request.getParameter("title");
		String score = request.getParameter("score");
		String outof = request.getParameter("outof");


				
		
					try{
					con = DriverManager.getConnection(connectionUrl+database, userid, password);
					statement=con.createStatement();
					
					int id = 0;
					
					String sql ="select * from jobseeker_profile where id = "+session.getAttribute("id")+"";
					resultSet = statement.executeQuery(sql);
					
					
					String sqli ="insert into jobseeker_score values("+id+","+resultSet.getString("id")+","+resultSet.getString("name")+","+title+","+score+")";
					System.out.println(session.getAttribute("id"));
					statement.executeQuery(sqli);
					
					resultSet.close();
					statement.close();
					con.close();
					
					response.sendRedirect("jobseeker_result.jsp?title="+title+"&score="+score+"&outof="+outof+"");
					}
					
					 catch (Exception e) {
					e.printStackTrace();
					}
					
				
				
	}

}
