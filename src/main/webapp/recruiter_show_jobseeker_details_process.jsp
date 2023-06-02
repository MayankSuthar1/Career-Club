
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/pro";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String accept = request.getParameter("accept");
String delete = request.getParameter("delete");
String js_id = request.getParameter("js_id");
String test = request.getParameter("test");
String job_id = request.getParameter("job_id");


if(js_id != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
Statement st=con.createStatement();


//rec process
if(accept != null)
{
   
	
	String sqli="Update jobseeker_apply_job set accepted = 1 where jobseeker_id='" + js_id + "' and test_title='" + test + "' and job_id='" + job_id + "'";
	int i=st.executeUpdate(sqli);
	if(i>0){
		response.sendRedirect("recruiter_show_jobseeker_details.jsp?test_title="+test+"&job_id="+job_id+"");
		}
		else{
			response.sendRedirect("recruiter_jobseeker_details.jsp");
		}
}
else if(delete != null){
	 // code to delete data from the database
	
	String sql="DELETE FROM jobseeker_apply_job WHERE jobseeker_id='" + js_id + "' and test_title='" + test + "' and job_id='" + job_id + "'";
	int i=st.executeUpdate(sql);
	
	if(i>0){
		response.sendRedirect("recruiter_show_jobseeker_details.jsp?test_title="+test+"&job_id="+job_id+"");
	}
	else{
		response.sendRedirect("recruiter_jobseeker_details.jsp");
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