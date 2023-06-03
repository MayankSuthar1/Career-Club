package Controller;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
@WebServlet("/Admin_rec_delete_email")
public class Admin_rec_delete_email extends HttpServlet {
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
    	String rec_name = request.getParameter("rec_name");
    	String id = request.getParameter("id");
    	
        String recipient = request.getParameter("email");
        String subject = "Profile Deletion Issue - Request for Profile Creation";
        
        String content = "Dear "+rec_name+",\r\n"
        		+ "\r\n"
        		+ "I hope this email finds you well. I am writing to bring to your attention that my company profile has been deleted from the platform. Unfortunately, it seems there was an issue that led to the removal of my profile by the admin.\r\n"
        		+ "\r\n"
        		+ "I kindly request your assistance in rectifying this matter as soon as possible. Could you please guide me on the steps to recreate my company profile? I understand that there might be certain procedures to follow, and I am more than willing to comply.\r\n"
        		+ "\r\n"
        		+ "Having had a positive experience with your recruiting services in the past, I value the opportunity to reestablish my presence on the platform. Your support in resolving this issue promptly would be greatly appreciated.\r\n"
        		+ "\r\n"
        		+ "Thank you for your attention to this matter. I look forward to your prompt response and guidance on how to proceed with recreating my company profile.\r\n"
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
            getServletContext().getRequestDispatcher("/admin_rec_js_ok_delete_process.jsp?id="+id+"&rec_delete=ok").forward(
                    request, response);
        }
    }
}