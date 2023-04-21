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
@WebServlet("/Rec_edit_job")
@MultipartConfig(maxFileSize = 1617721555)
public class Rec_edit_job extends HttpServlet {

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
String job_id = request.getParameter("job_id");
String email = request.getParameter("email");
String job_title =request.getParameter("job_title");
String address =request.getParameter("address");
String job_type =request.getParameter("job_type");
String category =request.getParameter("category");
String des =request.getParameter("des");
String company_name = request.getParameter("company_name");
String website = request.getParameter("website");
String submit = request.getParameter("submit");
String delete = request.getParameter("delete");

if(job_id != null)
{

PreparedStatement ps = null;

try
{


	//for update
	String sql="Update rec_job set email=?,job_title=?,address=?,job_type=?,category=?,description=?,company_name=?,website=? where job_id='" + job_id + "'";
	ps = con.prepareStatement(sql);
			
	if(submit != null) {
	        /* InputStream inputStream = request.getPart("logo").getInputStream();
	           ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	           byte[] buffer = new byte[4096];
	           int bytesRead = -1;
	           while ((bytesRead = inputStream.read(buffer)) != -1) {
	               outputStream.write(buffer, 0, bytesRead);
	           }
	           byte[] imageBytes = outputStream.toByteArray();
	           outputStream.close();
	           inputStream.close(); 
	
 	ps.setBytes(1, imageBytes); */
 	 
    
	ps.setString(1, email);
	ps.setString(2, job_title);
	ps.setString(3, address);
	ps.setString(4, job_type);
	ps.setString(5, category);
	ps.setString(6, des);
	ps.setString(7, company_name);
	ps.setString(8, website);
	
	
	int i = ps.executeUpdate();
	
	//for upload logo
	
	 
	 Part filePart = request.getPart("logo");
	 InputStream inputStream = null;
	 String fileName = getFileName(filePart);
		sql="Update rec_job set logo=? where job_id='" + job_id + "'";
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

	response.sendRedirect("recruiter_index.jsp");
	}
	else
	{
	System.out.println("There is a problem in updating Record.");
	} }

else if (delete != null)
{
    // code to delete data from the database
	Statement st=con.createStatement();
	
	String sqll="DELETE FROM rec_job WHERE job_id='" + job_id + "'";
	int i=st.executeUpdate(sqll);
	
	if(i>0){
	response.sendRedirect("recruiter_index.jsp");
	}
	else{
		response.sendRedirect("recruiter_manage_jobs.jsp");
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
RequestDispatcher rd=request.getRequestDispatcher("recruiter_edit_job.jsp");  
rd.forward(request, response);
}
catch (Exception e) {
e.printStackTrace();
}
}
}