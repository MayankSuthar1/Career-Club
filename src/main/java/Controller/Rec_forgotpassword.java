package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Rec_forgotpassword")
public class Rec_forgotpassword extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String host;
    private String port;
    private String user;
    private String pass;
    
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 // reads form fields
        String recipient = request.getParameter("mail");
        String subject = "Password Reset Request - Action Required";
        
 
        String resultMessage = "";
     
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");  
    		Connection con=DriverManager.getConnection(  
    		"jdbc:mysql:// localhost:3306/pro","root","root");  
    		      
    		PreparedStatement ps=con.prepareStatement(  
    		"select * from rec_reg where email=?");  
    		ps.setString(1,recipient);  
    		ResultSet rs=ps.executeQuery(); 
    	boolean s = rs.next();
    	
    	
    	String link ="http://localhost:8080/project/recruiter_resetpassword.jsp?id="+rs.getString("id")+"";
    	
    		String content = "Hey "+recipient+",\r\n"
    				+ "\r\n"
    				+ "We have received a request to reset the password associated with your account. To ensure the security of your account, please follow the instructions below to reset your password.\r\n"
    				+ "\r\n"
    				+ "Please click on the following link to reset your password:\r\n"
    				+ ""+link+"";
    		
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/recruiter_login_register.jsp").forward(
                    request, response);
        }
    }
}