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
String name = request.getParameter("id");
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

String title = request.getParameter("title");
String score = request.getParameter("score");
String outof = request.getParameter("outof");
		
		
		
			try{
			con = DriverManager.getConnection(connectionUrl+database, userid, password);
			statement=con.createStatement();
			
			int id = 0;
			
			
			
			//String sqli ="insert into jobseeker_score (id,jobseeker_id,jobseeker_name,test_title,score) values("+id+","+resultSet.getString("id")+","+resultSet.getString("name")+","+title+","+score+")";
			String sql="INSERT INTO jobseeker_score (jobseeker_id, jobseeker_name, email, phone_no, skills, location, your_self, photo) SELECT id, name, email, phone_no, skills, location, your_self, photo FROM jobseeker_profile where id ='"+session.getAttribute("id")+"'";
			statement.executeUpdate(sql);
			
			sql = "UPDATE jobseeker_score SET test_title = '"+title+"', score = '"+score+"' WHERE jobseeker_id = "+session.getAttribute("id")+"";;
			statement.executeUpdate(sql);
			
			
			statement.close();
			con.close();
			
			response.sendRedirect("jobseeker_apply_job.jsp?title="+title+"");
			}
			
			 catch (Exception e) {
			e.printStackTrace();
			}
			
		
		 %>		
	
	
	
		