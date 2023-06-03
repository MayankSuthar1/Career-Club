package Controller;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
@WebServlet("/Admin_jobseeker_delete_email")
public class Admin_jobseeker_delete_email extends HttpServlet {
    /**
	 * 
	 */
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
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
    	String name = request.getParameter("name");
    	String id = request.getParameter("id");
    	
        String recipient = request.getParameter("email");
        String subject = "Profile Deletion and Request for Re-Creation";
        
        String content = "\r\n"
        		+ "Dear "+name+",\r\n"
        		+ "\r\n"
        		+ "We hope this email finds you well. We regret to inform you that your user profile has been deleted by our system administrator due to certain issues that were encountered. We understand the inconvenience this may have caused and sincerely apologize for any frustration caused.\r\n"
        		+ "\r\n"
        		+ "To rectify this situation, we kindly request you to recreate your profile on our platform. We have taken measures to address the problem that led to the deletion, ensuring a smoother experience for you moving forward.\r\n"
        		+ "\r\n"
        		+ "We greatly appreciate your understanding and cooperation. Should you encounter any difficulties during the profile creation process or have any questions, please do not hesitate to contact our support team, who will be more than happy to assist you.\r\n"
        		+ "\r\n"
        		+ "Thank you for your attention to this matter, and we look forward to welcoming you back to our platform soon.\r\n"
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
            getServletContext().getRequestDispatcher("/admin_rec_js_ok_delete_process.jsp?id="+id+"&js_delete=ok").forward(
                    request, response);
        }
    }
}