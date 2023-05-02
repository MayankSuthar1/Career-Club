
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/pro";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String id = request.getParameter("id");


if(id != null)
{
Connection con = null;
Statement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);


	//for update
	
	

	
	String sql="INSERT INTO jobseeker_buyed_course (course_id, logo, course_name, category, description, video_link) SELECT id, logo, course_name, category, description, video_link FROM admin_course where id ='"+id+"'";
	//String sql="insert into jobseeker_buyed_course select * from admin_course where id='2'";
	ps = con.createStatement();

	int i = ps.executeUpdate(sql);

	String sqll="UPDATE jobseeker_buyed_course SET id = '"+session.getAttribute("id")+"' WHERE course_id = '"+id+"'";
	ps = con.createStatement();
	ps.executeUpdate(sqll);
	
	if(i > 0)
	{

	response.sendRedirect("jobseeker_buyed_course.jsp");
	}
	else
	{
		response.sendRedirect("jobseeker_course.jsp");
	} 

    // code to delete data from the database
	
	
}

catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}

%>