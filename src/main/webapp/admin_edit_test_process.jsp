<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Util.DBconnection" %>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Base64"%>
<%@page import="javax.imageio.*"%>
<%@page import="java.awt.image.*"%>


<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "pro";
String userid = "root";
String password = "root";
String job_id = request.getParameter("job_id");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;
byte[] imageData = null;


			String id = request.getParameter("id");
			String delete = request.getParameter("delete");
			String title = request.getParameter("title");
		
			if(delete != null){
				con = DriverManager.getConnection(connectionUrl+database, userid, password);
				Statement st=con.createStatement();
			
				String sqli="DELETE FROM admin_test_detail WHERE id='" + id + "'";
				int ii=st.executeUpdate(sqli);
				
				String sql="DELETE FROM admin_question_detail WHERE title='" + title + "'";
				int i=st.executeUpdate(sql);
				
				
				
				if(i>0 && ii>0){
					response.sendRedirect("admin_edit_test.jsp");
				}
				else{
					response.sendRedirect("admin_edit_test.jsp");
				}	
				st.close();
				con.close();
			}
		%>	