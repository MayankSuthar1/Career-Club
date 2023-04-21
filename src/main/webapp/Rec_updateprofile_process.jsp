
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/pro";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String id = request.getParameter("id");
String company_name = request.getParameter("com_name");
String company_email =request.getParameter("com_email");
String business_type =request.getParameter("business");
String address =request.getParameter("address");
String con_num =request.getParameter("con_num");
String rec_name =request.getParameter("name");
String update = request.getParameter("update");
String delete = request.getParameter("delete");

if(company_email != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);

if (update != null) {
	//for update
	String sql="Update rec_profile set company_name=?,company_email=?,business_type=?,address=?,con_num=?,rec_name=? where id='" + session.getAttribute("id") + "'";
	ps = con.prepareStatement(sql);

	ps.setString(1, company_name);
	ps.setString(2, company_email);
	ps.setString(3, business_type);
	ps.setString(4, address);
	ps.setString(5, con_num);
	ps.setString(6, rec_name);

	int i = ps.executeUpdate();
	if(i > 0)
	{

	response.sendRedirect("recruiter_edit_profile.jsp");
	}
	else
	{
	out.print("There is a problem in updating Record.");
	} 
}
else if (delete != null)
{
    // code to delete data from the database
	Statement st=con.createStatement();
	String sqli="Update rec_reg set login_time= 0 where id='" + session.getAttribute("id") + "'";
	int j=st.executeUpdate(sqli);
	String sql="DELETE FROM rec_profile WHERE id='" + session.getAttribute("id") + "'";
	int i=st.executeUpdate(sql);
	
	if(i>0){
	response.sendRedirect("recruiter_login_register.jsp");
	}
	else{
		response.sendRedirect("recruiter_edit_profile.jsp");
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