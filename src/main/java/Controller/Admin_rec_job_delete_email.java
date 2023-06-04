package Controller;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
@WebServlet("/Admin_rec_job_delete_email")
public class Admin_rec_job_delete_email extends HttpServlet {
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
    	String email = request.getParameter("email");
    	String id = request.getParameter("id");
    	String job_id = request.getParameter("job_id");
    	String job_title = request.getParameter("job_title");
    	String company_name = request.getParameter("company_name");
    	
        String recipient = request.getParameter("email");
        String subject = "Job Deletion and Request to Reapply";
        
        String content = "Dear "+email+",\r\n"
        		+ "\r\n"
        		+ "I hope this email finds you well.\r\n"
        		+ "\r\n"
        		+ "I am writing to inform you that the profile for the job listing you created at "+company_name+" has been removed by our system administrators due to an issue that we encountered. As a result, the applicant's profile associated with the job has been deleted.\r\n"
        		+ "\r\n"
        		+ "I kindly request you to inform the interested candidates about this situation and ask them to recreate their profiles on our platform. This will allow them to apply for the position once again.\r\n"
        		+ "\r\n"
        		+ "The specific details for the job are as follows:\r\n"
        		+ "\r\n"
        		+ "Job Title: "+job_title+"\r\n"
        		+ "Company: "+company_name+"\r\n"
        		+ "\r\n"
        		+ "We apologize for any inconvenience caused by this technical glitch, and we appreciate your understanding and cooperation in rectifying the situation promptly.\r\n"
        		+ "\r\n"
        		+ "Please let us know if you have any questions or require any further assistance regarding this matter. We value your partnership and are committed to providing a seamless experience for both recruiters and applicants on our platform.\r\n"
        		+ "\r\n"
        		+ "Thank you for your attention to this matter.\r\n"
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
            getServletContext().getRequestDispatcher("/admin_rec_js_ok_delete_process.jsp?id="+id+"&job_id="+job_id+"&rec_job_delete=ok").forward(
                    request, response);
        }
    }
}