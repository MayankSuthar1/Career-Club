
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/pro";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String id = request.getParameter("id");
String job_id = request.getParameter("job_id");
String rec_ok = request.getParameter("rec_ok");
String rec_delete = request.getParameter("rec_delete");
String js_ok = request.getParameter("js_ok");
String js_delete =request.getParameter("js_delete");
String rec_job_ok = request.getParameter("rec_job_ok");
String rec_job_delete = request.getParameter("rec_job_delete");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
Statement st=con.createStatement();


//rec process
if(rec_ok != null)
{
   
	
	String sqli="Update rec_profile set admin_checked = 1 where id='" + id + "'";
	int i=st.executeUpdate(sqli);
	if(i>0){
		response.sendRedirect("admin_recruiter_details.jsp");
		}
		else{
			response.sendRedirect("admin_home.jsp");
		}
}
else if(rec_delete != null){
	 // code to delete data from the database
	String sqll="Update rec_reg set login_time = 0 where id='" + id + "'";
	st.executeUpdate(sqll);
	
	String sql="DELETE FROM rec_profile WHERE id='" + id + "'";
	int i=st.executeUpdate(sql);
	
	if(i>0){
		response.sendRedirect("admin_recruiter_details.jsp");
	}
	else{
		response.sendRedirect("admin_home.jsp");
	}
	
}


//jobseeker process
else if(js_ok != null)
{
   
	
	String sqli="Update jobseeker_profile set admin_checked = 1 where id='" + id + "'";
	int i=st.executeUpdate(sqli);
	if(i>0){
		response.sendRedirect("admin_jobseeker_details.jsp");
		}
		else{
			response.sendRedirect("admin_home.jsp");
		}
}
else if(js_delete != null){
	 // code to delete data from the database
	String sqll="Update jobseeker_reg set login_time = 0 where id='" + id + "'";
	st.executeUpdate(sqll);
	
	String sql="DELETE FROM jobseeker_profile WHERE id='" + id + "'";
	int i=st.executeUpdate(sql);
	
	if(i>0){
		response.sendRedirect("admin_jobseeker_details.jsp");
		}
		else{
			response.sendRedirect("admin_home.jsp");
		}
	
}

// rec job process
else if(rec_job_ok != null)
{
   
	
	String sqli="Update rec_job set admin_checked = 1 where id='" + id + "' and job_id = '" + job_id + "' ";
	int i=st.executeUpdate(sqli);
	if(i>0){
		response.sendRedirect("admin_recruiter_jobs_details.jsp");
		}
		else{
			response.sendRedirect("admin_home.jsp");
		}
}
else if(rec_job_delete != null){
	 // code to delete data from the database
	
	
	String sql="DELETE FROM rec_job WHERE id='" + id + "' and job_id = '" + job_id + "'";
	int i=st.executeUpdate(sql);
	
	if(i>0){
		response.sendRedirect("admin_recruiter_jobs_details.jsp");
		}
		else{
			response.sendRedirect("admin_home.jsp");
		}
	
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}

%>