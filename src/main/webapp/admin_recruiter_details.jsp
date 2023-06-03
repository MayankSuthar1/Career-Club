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
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;


%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<!-- Basic Page Needs
================================================== -->
<meta charset="utf-8">
<title>Career club</title>
<link rel="icon" href="admin_look/images/tab.png">
<!-- Mobile Specific Metas
================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href="admin_look/css/style.css">
<link rel="stylesheet" href="admin_look/css/colors/green.css" id="colors">

<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

</head>

<body>

	
<div id="wrapper">


<!-- Header
================================================== -->
<header>
<div class="container">
	<div class="sixteen columns">
	
		<!-- Logo -->
		<div id="logo">
			<h1><a href="admin_home.jsp"><img src="admin_look/images/logo.png" alt="Career club" /></a></h1>
		</div>

		<!-- Menu -->
<nav id="navigation" class="menu">
	<ul id="responsive">

	
		<li><a>Courses</a>
			<ul>
			<li><a href="admin_create_course.jsp">Create course</a></li>
		<li><a href="admin_manage_course.jsp">Manage course</a></li>
		
			</ul>
		</li>
		<li><a href="#">Tests</a>
			<ul>
				<li><a href="admin_create_test.jsp">Create test</a></li>
				<li><a href="admin_edit_test.jsp">Manage test</a></li>
				
				
			</ul>
		</li>
		<li><a href="#">Get details</a>
			<ul>
				<li><a href="admin_jobseeker_details.jsp">Job Seeker</a></li>
				<li><a href="admin_recruiter_details.jsp">Recruiter</a></li>
				<li><a href="admin_recruiter_jobs_details.jsp">Recruiter Jobs</a></li>	
			</ul>
		</li>
		
		
		
	
	</ul>
		<!-- Logout -->
		<ul class="responsive float-right">
			<li><a href="admin_login.jsp">Logout</a></li>
		</ul>
	</nav>
		<!-- Navigation -->
		<div id="mobile-navigation">
			<a href="#menu" class="menu-trigger"><i class="fa fa-reorder"></i> Menu</a>
		</div>

	</div>
</div>
</header>
<div class="clearfix"></div>


<!-- Titlebar
================================================== -->
<div id="titlebar" class="single">
	<div class="container">

		<div class="sixteen columns">
			<h2>Recruiter details</h2>
			<nav id="breadcrumbs">
				
			</nav>
		</div>

	</div>
</div>


<!-- Content
================================================== -->
<div class="container">
	
	<!-- Table -->
	<div class="sixteen columns">

			

		<table class="manage-table responsive-table">

			<tr>
				<th ><i class=""></i> Company Name</th>
				<th><i class=""></i> Company Email</th>
				<th><i class=""></i> Business</th>
				<th><i class=""></i> Address</th>
				<th><i class=""></i> Contact No.</th>
				<th><i class=""></i> Recruiter Name</th>
			</tr>
			</table>		
			<!-- Profile -->
					<%
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select * from rec_profile where admin_checked =0 ";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){

	
    
%>
					<form method="post" action="Admin_rec_delete_email">
					<table class="manage-table responsive-table">
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
					<tr>
									
						<td class="centered"><%= resultSet.getString("company_name")%></td>
						<td class="centered"><%= resultSet.getString("company_email")%></td>
						<td class="centered"><%= resultSet.getString("business_type")%></td>
						<td class="centered"><%= resultSet.getString("address")%></td>
						<td class="centered"><%= resultSet.getString("con_num")%></td>
						<td class="centered"><p><%= resultSet.getString("rec_name")%></p></td>
						
						
						<td class="action">
							<input type="hidden" name="email" value="<%= resultSet.getString("company_email")%>"/>
							<input type="hidden" name="id" value="<%= resultSet.getString("id")%>"/>
							<input type="hidden" name="rec_name" value="<%= resultSet.getString("rec_name")%>"/>
							<a href="admin_rec_js_ok_delete_process.jsp?id=<%= resultSet.getString("id")%>&rec_ok=ok"><button><i class="fa fa-pencil"></i >Ok</button></a>
							<button type="submit" name="delete" ><i class="fa fa-remove"></i> Delete</button>
							<%-- <a	href="admin_rec_js_ok_delete_process.jsp?id=<%= resultSet.getString("id")%>&rec_delete=ok" class="delete"><i class="fa fa-remove"></i> Delete</a> --%>
						</td>
					</tr>
					</table>
					</form>
<% 
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
	

		

	</div>

</div>





<div class="container">
	
	<!-- Applications -->
	<div class="sixteen columns">
	
	<%
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select * from rec_profile where admin_checked =0 ";

resultSet = statement.executeQuery(sql);

if (!resultSet.isBeforeFirst()) {
	%>
	<div class="notification error closeable">
	<p><span>Error!</span> there is no records in database.</p>
	<a class="close" href="#"></a>
</div>
<%
}
while(resultSet.next()){

	
    
%>
		
		<!-- Application #1 -->
		<div class="application">
			<div class="app-content">
				
				<!-- Name / Avatar -->
				<div class="info">
					<span><%=resultSet.getString("company_name")%></span>
					
				</div>
				
				<!-- Buttons -->
				<div class="buttons">
					<a href="#one-1" class="button gray app-link"><i class="fa fa-pencil"></i> Edit</a>
					<a href="#three-1" class="button gray app-link"><i class="fa fa-plus-circle"></i> Show Details</a>
				</div>
				<div class="clearfix"></div>

			</div>

			<!--  Hidden Tabs -->
			<div class="app-tabs">

				<a href="#" class="close-tab button gray"><i class="fa fa-close"></i></a>
				
				<!-- First Tab -->
			    <div class="app-tab-content" id="one-1">
					<div class="clearfix"></div>
					<center><a href="admin_rec_js_ok_delete_process.jsp?id=<%= resultSet.getString("id")%>&rec_ok=ok"><button><i class="fa fa-pencil"></i >Ok</button></a></center>
					<div class="margin-top-10"></div>
					<form method="post" action="Admin_rec_delete_email">
					<input type="hidden" name="email" value="<%= resultSet.getString("company_email")%>"/>
							<input type="hidden" name="id" value="<%= resultSet.getString("id")%>"/>
							<input type="hidden" name="rec_name" value="<%= resultSet.getString("rec_name")%>"/>
							<center><button type="submit" name="delete" ><i class="fa fa-remove"></i> Delete</button></center>
			  		</form>
			  		
			  		
			    </div>
			    
			    <!-- Third Tab -->
			    <div class="app-tab-content"  id="three-1">
					<i>Company email:</i>
					<span><%= resultSet.getString("company_email")%></span>

					<i>Business type:</i>
					<span><%= resultSet.getString("business_type")%></span>

					<i>Address:</i>
					<span><%= resultSet.getString("address")%></span>
			    
			    	<i>Contact number:</i>
					<span><%= resultSet.getString("con_num")%></span>
			    	
			    	<i>Recruiter name:</i>
					<span><%= resultSet.getString("rec_name")%></span>
			    	
			    
			    </div>

			</div>

			<!-- Footer -->
			<div class="app-footer">

				
				<div class="clearfix"></div>

			</div>
		</div>
<% 
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
	</div>
</div>

<div class="margin-top-100"></div>


<!-- Back To Top Button -->
<div id="backtotop"><a href="#"></a></div>

</div>
<!-- Wrapper / End -->


<!-- Scripts
================================================== -->
<script src="admin_look/scripts/jquery-2.1.3.min.js"></script>
<script src="admin_look/scripts/custom.js"></script>
<script src="admin_look/scripts/jquery.superfish.js"></script>
<script src="admin_look/scripts/jquery.themepunch.tools.min.js"></script>
<script src="admin_look/scripts/jquery.themepunch.revolution.min.js"></script>
<script src="admin_look/scripts/jquery.themepunch.showbizpro.min.js"></script>
<script src="admin_look/scripts/jquery.flexslider-min.js"></script>
<script src="admin_look/scripts/chosen.jquery.min.js"></script>
<script src="admin_look/scripts/jquery.magnific-popup.min.js"></script>
<script src="admin_look/scripts/waypoints.min.js"></script>
<script src="admin_look/scripts/jquery.counterup.min.js"></script>
<script src="admin_look/scripts/jquery.jpanelmenu.js"></script>
<script src="admin_look/scripts/stacktable.js"></script>


</body>
</html>