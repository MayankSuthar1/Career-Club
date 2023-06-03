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

@WebServlet("/Rec_jobseeker_accepted_application_email")
public class Rec_jobseeker_accepted_application_email extends HttpServlet {
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
    	
    	 String accept = request.getParameter("accept");
    	 String delete = request.getParameter("delete");
    	 String js_id = request.getParameter("js_id");
    	 String test = request.getParameter("test");
    	 String job_id = request.getParameter("job_id");
    	 String name = request.getParameter("name");

    	
        String recipient = request.getParameter("email");
        String subject = null;
        String content = null ;
       
       
        
        
        String resultMessage = "";
     
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");  
    		Connection con=DriverManager.getConnection(  
    		"jdbc:mysql:// localhost:3306/pro","root","root");  
    		      
    		PreparedStatement ps=con.prepareStatement(  
    		"select * from rec_job where job_id=?");  
    		ps.setString(1,job_id);  
    		ResultSet rs=ps.executeQuery();
    		boolean s = rs.next();
    		
    		if(accept != null) {
    	         subject = "Congratulations! Your Application Has Been Accepted for "+rs.getString("job_title")+" at "+rs.getString("company_name")+"";
    	       
    	         content ="Dear "+name+",\r\n"
    	        		+ "\r\n"
    	        		+ "We are delighted to inform you that your application for the position of "+rs.getString("job_title")+" at "+rs.getString("company_name")+" has been accepted. Congratulations! We were impressed by your qualifications and experience, and we believe you would be a valuable addition to our team.\r\n"
    	        		+ "\r\n"
    	        		+ "Job Details:\r\n"
    	        		+ "Job type: "+rs.getString("job_type")+"\r\n"
    	        		+ "Company: "+rs.getString("company_name")+"\r\n"
    	        		+ "Address: "+rs.getString("address")+"\r\n"
    	        		+ "Category: "+rs.getString("category")+"\r\n"
    	        		+ "\r\n"
    	        		+ "We appreciate the time and effort you put into your application and the opportunity to consider you for this position. Our recruitment team carefully reviewed all applications, and yours stood out as a strong match for our requirements.\r\n"
    	        		+ "\r\n"
    	        		+ "We would like to discuss the next steps in the process, including arranging an interview. Our team will be in touch with you shortly to schedule a convenient date and time. If you have any questions or need any additional information in the meantime, please feel free to contact our recruitment team at "+rs.getString("email")+" .\r\n"
    	        		+ "\r\n"
    	        		+ "Once again, congratulations on your acceptance! We look forward to further discussions and getting to know you better.\r\n"
    	        		+ "\r\n"
    	        		+ "Best regards,\r\n"
    	        		+ "\r\n"
    	        		+ "Admin\r\n"
    	        		+ "Careerclub\r\n";
    	        }
    	        
    	        else if (delete != null){
    	        	
    	        	subject = "Your application is not accepted for "+rs.getString("job_title")+" at "+rs.getString("company_name")+"";
    	            
    	            content ="Dear "+name+",\r\n"
    	            		+ "\r\n"
    	            		+ "We hope this email finds you well. We appreciate the time and effort you put into your application for the position of "+rs.getString("job_title")+" at "+rs.getString("company_name")+". We wanted to provide you with an update regarding the status of your application.\r\n"
    	            		+ "\r\n"
    	            		+ "Regrettably, we must inform you that your application for the position of "+rs.getString("job_title")+" at "+rs.getString("company_name")+" has not been accepted. We sincerely appreciate your interest in joining our team and the effort you put into your application. While your qualifications and experience were notable, we have selected another candidate whose skills and experience more closely align with our current needs.\r\n"
    	            		+ "\r\n"
    	            		+ "Please be assured that the selection process was thorough and highly competitive, with many qualified applicants. We recognize the time and effort you invested in your application, and we encourage you to continue pursuing opportunities that match your skills and career goals. The job market is dynamic, and new possibilities arise regularly.\r\n"
    	            		+ "\r\n"
    	            		+ "We value your interest in "+rs.getString("company_name")+", and we would be happy to consider your application for future positions that may arise. We will retain your information in our database, and should a suitable opportunity become available, we will reach out to you. Additionally, we recommend periodically visiting our career page and applying for other positions that align with your qualifications.\r\n"
    	            		+ "\r\n"
    	            		+ "If you have any questions or would like further feedback regarding your application, please do not hesitate to contact our recruitment team at "+rs.getString("email")+". We are here to assist you and provide any additional information you may require.\r\n"
    	            		+ "\r\n"
    	            		+ "Thank you for your understanding. We wish you the best of luck in your job search and future endeavors.\r\n"
    	            		+ "\r\n"
    	            		+ "Best regards,\r\n"
    	            		+ "\r\n"
    	            		+ "Admin\r\n"
    	            		+ "CareerClub\r\n";
    	        	
    	        }
    		
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            if(accept != null) {
            getServletContext().getRequestDispatcher("/recruiter_show_jobseeker_details_process.jsp?accept=true&js_id="+js_id+"&test="+test+"&job_id="+job_id+"").forward(
                    request, response);
            }
            else if(delete != null) {
                getServletContext().getRequestDispatcher("/recruiter_show_jobseeker_details_process.jsp?delete=true&js_id="+js_id+"&test="+test+"&job_id="+job_id+"").forward(
                        request, response);
                }
        }
    }
}