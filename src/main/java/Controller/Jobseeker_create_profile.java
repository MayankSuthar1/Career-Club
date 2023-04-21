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
@WebServlet("/Jobseeker_create_profile")
@MultipartConfig(maxFileSize = 1617721555)
public class Jobseeker_create_profile extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
{
	HttpSession session = request.getSession();
try {

// Initialize the database
Connection con = DBconnection.initializeDatabase();

// Create a SQL query to insert data into demo table
// demo table consists of two columns, so two '?' is used
PreparedStatement st = con.prepareStatement("insert into jobseeker_profile values(?,?,?,?,?,?,?,?)");

String id = (String) session.getAttribute("id");

st.setString(1,id);
st.setString(2,request.getParameter("name"));
st.setString(3,request.getParameter("email"));
st.setString(4,request.getParameter("num"));
st.setString(5,request.getParameter("skills"));
st.setString(6,request.getParameter("location"));
st.setString(7,request.getParameter("your_self"));
InputStream inputStream = null;
Part filePart = request.getPart("photo");
       if (filePart != null) {    
          inputStream = filePart.getInputStream();
       }
       if (inputStream != null) {
               // fetches input stream of the upload file for the blob column
               st.setBlob(8, inputStream);
           }



    
    
   
     
st.executeUpdate();
Statement stmt = con.createStatement();
String email =request.getParameter("email");
String sql ="Update jobseeker_reg set login_time=1 where email='" + email + "'";
stmt.executeUpdate(sql);
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