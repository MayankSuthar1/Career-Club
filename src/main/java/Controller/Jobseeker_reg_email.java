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

@WebServlet("/Jobseeker_reg_email")
public class Jobseeker_reg_email extends HttpServlet {
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
        String recipient = request.getParameter("email");
        String subject = "Welcome to Careerclub - Your New User Registration";
       
        String content ="\r\n"
        		+ "Hey "+recipient+",\r\n"
        		+ "\r\n"
        		+ "Welcome to Careerclub! We are delighted to have you as a new member of our platform.\r\n"
        		+ "\r\n"
        		+ "Congratulations on successfully creating your user profile. With your new account, you now have access to a wide range of features and opportunities.\r\n"
        		+ "\r\n"
        		+ "We are confident that our platform will meet your needs and expectations. Whether you are looking for information, connecting with like-minded individuals, or exploring new possibilities, Careerclub has you covered.\r\n"
        		+ "\r\n"
        		+ "If you have any questions or need assistance, our support team is here to help. Simply reach out to us at careerclub2023@gmail.com , and we will be more than happy to assist you.\r\n"
        		+ "\r\n"
        		+ "Thank you once again for joining us. We look forward to your active participation and contribution to our vibrant community.\r\n"
        		+ "\r\n"
        		+ "Best regards,\r\n"
        		+ "\r\n"
        		+ "Admin\r\n"
        		+ "Careerclub";
        
        String resultMessage = "";
     
        try {
        	
    		
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/jobseeker_login_register.jsp").forward(
                    request, response);
        }
    }
}