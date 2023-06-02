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
String title = request.getParameter("title");
String name = request.getParameter("name");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;
			try{
			con = DriverManager.getConnection(connectionUrl+database, userid, password);
			statement=con.createStatement();
			
			int id = 0;
			
			
			//String sqli ="insert into jobseeker_score (id,jobseeker_id,jobseeker_name,test_title,score) values("+id+","+resultSet.getString("id")+","+resultSet.getString("name")+","+title+","+score+")";
			String sql="INSERT INTO jobseeker_apply_job (jobseeker_id, jobseeker_name, email, phone_no, skills, location, your_self, photo, test_title, score) SELECT jobseeker_id, jobseeker_name, email, phone_no, skills, location, your_self, photo, test_title, score FROM jobseeker_score where jobseeker_id ='"+session.getAttribute("id")+"'";
			statement.executeUpdate(sql);
			
			
			sql = "UPDATE jobseeker_apply_job SET job_id = '"+job_id+"', job_title = '"+name+"', accepted = '0' WHERE jobseeker_id = "+session.getAttribute("id")+" and test_title='"+title+"'";
			
			int i = statement.executeUpdate(sql);
			statement.close();
			con.close();
			if(i >0){
			response.sendRedirect("jobseeker_manage_result.jsp");
			}
			}
			
			 catch (Exception e) {
			e.printStackTrace();
			}
			
		
		 %>		
	