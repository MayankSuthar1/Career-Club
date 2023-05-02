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

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.*;

import Util.DBconnection;


/**
 * Servlet implementation class profile_rec
 */
@WebServlet("/Admin_edit_course")
@MultipartConfig(maxFileSize = 1617721555)
public class Admin_edit_course extends HttpServlet {

	private static final long serialVersionUID = 1L;

private String getFileName(Part part) {
    String contentDisposition = part.getHeader("content-disposition");
    String[] tokens = contentDisposition.split(";");
    for (String token : tokens) {
        if (token.trim().startsWith("filename")) {
            return token.substring(token.indexOf("=") + 2, token.length()-1);
        }
    }
    return "";
}

protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
{
try {

// Initialize the database
Connection con = DBconnection.initializeDatabase();

// Create a SQL query to insert data into demo table
// demo table consists of two columns, so two '?' is used

String id = request.getParameter("id");
String course_name = request.getParameter("course_name");
String category =request.getParameter("category");
String des =request.getParameter("des");
String vlink =request.getParameter("vlink");

if(id != null)
{

PreparedStatement ps = null;

try
{


	//for update
	String sql="Update admin_course set course_name=?,category=?,description=?,video_link=? where id='" + id + "'";
	ps = con.prepareStatement(sql);

	ps.setString(1, course_name);
	ps.setString(2, category);
	ps.setString(3, des);
	ps.setString(4, vlink);
	
	
	
	int i = ps.executeUpdate();
	
String sqli="Update jobseeker_buyed_course set course_name=?,category=?,description=?,video_link=? where course_id='" + id + "'";
	ps = con.prepareStatement(sqli);
	
	ps.setString(1, course_name);
	ps.setString(2, category);
	ps.setString(3, des);
	ps.setString(4, vlink);
	ps.executeUpdate();
	//for upload logo
	 
	 Part filePart = request.getPart("logo");
	 InputStream inputStream = null;
	 String fileName = getFileName(filePart);
		sql="Update admin_course set logo=? where id='" + id + "'";
		ps = con.prepareStatement(sql);
		// Get the uploaded image
	     
	   // Check if an image was selected
	    if ( fileName.isEmpty() == false ) {
	    	
			
			  if (filePart != null) { 
				  inputStream = filePart.getInputStream(); 
				  } 
			  if (inputStream != null) 
			  { // fetches input stream of the upload file for the blob column 
			  ps.setBlob(1, inputStream); 
			  } 
			  ps.executeUpdate();
	    }
	    
	    sqli="Update jobseeker_buyed_course set logo=? where course_id='" + id + "'";
		ps = con.prepareStatement(sqli);
		// Get the uploaded image
	     
	   // Check if an image was selected
	    if ( fileName.isEmpty() == false ) {
	    	
			
			  if (filePart != null) { 
				  inputStream = filePart.getInputStream(); 
				  } 
			  if (inputStream != null) 
			  { // fetches input stream of the upload file for the blob column 
			  ps.setBlob(1, inputStream); 
			  } 
			  ps.executeUpdate();
	    }
	
	    
	    
	    
if(i > 0)
	{

	response.sendRedirect("admin_manage_course.jsp");
	}
	else
	{
		response.sendRedirect("admin_edit_course.jsp");	
		} 


	

ps.close();
con.close();
}
catch (Exception e) {
e.printStackTrace();
}
}





// Get a writer pointer
// to display the successful result
PrintWriter out = response.getWriter();

}
catch (Exception e) {
e.printStackTrace();
}
}
}