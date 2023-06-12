package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Admin_logout")
public class Admin_logout extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Invalidate the session
        request.getSession().invalidate();

        // Clear the user's cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }

     // Prevent the user from going back to the previous page
        out.println("<html><head><title>Logged Out</title></head><body>");
        out.println("<script type='text/javascript'>");
        out.println("window.history.forward();");
        out.println("function noBack() {");
        out.println("window.history.forward();");
        out.println("}");
        out.println("</script>");
        out.println("<h3>You have been logged out.</h3>");
        out.println("<a href='admin_login.jsp' onclick='noBack();'>Click here to go back to index page</a>");
        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
