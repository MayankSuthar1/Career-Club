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
 * Servlet implementation class profile_rec
 */
@WebServlet("/Admin_create_course")
@MultipartConfig(maxFileSize = 1617721555)
public class Admin_create_course extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
{
	HttpSession session = request.getSession();
try {

// Initialize the database
Connection con = DBconnection.initializeDatabase();

// Create a SQL query to insert data into demo table

PreparedStatement st = con.prepareStatement("insert into admin_course values(?,?,?,?,?,?)");

int id = 0 ;
st.setInt(1,id);
InputStream inputStream = null;
Part filePart = request.getPart("logo");
       if (filePart != null) {    
          inputStream = filePart.getInputStream();
       }
       if (inputStream != null) {
               // fetches input stream of the upload file for the blob column
               st.setBlob(2, inputStream);
           }
st.setString(3,request.getParameter("course_name"));
st.setString(4,request.getParameter("category"));
st.setString(5,request.getParameter("des"));
st.setString(6,request.getParameter("vlink"));

int i=st.executeUpdate();

if(i>0){
	response.sendRedirect("admin_manage_course.jsp");
}
else{
	response.sendRedirect("admin_create_course.jsp");
}

// Close all the connections
st.close();
con.close();



// Get a writer pointer
// to display the successful result
PrintWriter out = response.getWriter();
RequestDispatcher rd=request.getRequestDispatcher("jobseeker_index.jsp");  
rd.forward(request, response);
}
catch (Exception e) {
e.printStackTrace();
}
}
}