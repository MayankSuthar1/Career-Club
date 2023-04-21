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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.annotation.*;

import Util.DBconnection;


/**
 * Servlet implementation class profile_rec
 */
@WebServlet("/Jobseeker_edit_profile")
@MultipartConfig(maxFileSize = 1617721555)
public class Jobseeker_edit_profile extends HttpServlet {

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
	HttpSession session = request.getSession();
try {

// Initialize the database
Connection con = DBconnection.initializeDatabase();

// Create a SQL query to insert data into demo table
// demo table consists of two columns, so two '?' is used

String id = request.getParameter("id");

String name = request.getParameter("name");
String email =request.getParameter("email");
String phone_no =request.getParameter("num");
String skills =request.getParameter("skills");
String your_self =request.getParameter("your_self");
String submit = request.getParameter("submit");
String delete = request.getParameter("delete");

if(id != null)
{

PreparedStatement ps = null;

try
{


	//for update
	String sql="Update jobseeker_profile set name=?,email=?,phone_no=?,skills=?,your_self=? where id='" + id + "'";
	ps = con.prepareStatement(sql);
	if(submit != null)	{	 
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, phone_no);
	ps.setString(4, skills);
	ps.setString(5, your_self);
	
	
	int i = ps.executeUpdate();
	
	
	//for upload logo
 
	 Part filePart = request.getPart("photo");
	 InputStream inputStream = null;
	 String fileName = getFileName(filePart);
		sql="Update jobseeker_profile set photo=? where id='" + id + "'";
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
	
    
	    
if(i > 0)
	{

	response.sendRedirect("jobseeker_index.jsp");
	}
	else
	{
	System.out.println("jobseeker_edit_profile.jsp");
	} }

else if (delete != null)
{
    // code to delete data from the database
	Statement st=con.createStatement();
	String sqli="Update jobseeker_reg set login_time= 0 where id='" + session.getAttribute("id") + "'";
	st.executeUpdate(sqli);
	String sqll="DELETE FROM jobseeker_profile WHERE id='" + session.getAttribute("id") + "'";
	int i=st.executeUpdate(sqll);
	
	if(i>0){
	response.sendRedirect("jobseeker_login_register.jsp");
	}
	else{
		response.sendRedirect("jobseeker_edit_profile.jsp");
	}
	
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