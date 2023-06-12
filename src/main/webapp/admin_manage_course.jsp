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
byte[] imageData = null;
%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<!-- Basic Page Needs
================================================== -->
<meta charset="utf-8">
<title>Career Club</title>

<!-- Mobile Specific Metas
================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href="recruiter_look/css/style.css">
<link rel="stylesheet" href="recruiter_look/css/colors/green.css" id="colors">

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
			<h1><a href="admin_home.jsp"><img src="recruiter_look/images/logo.png" alt="career club" /></a></h1>
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
		<form method="post" action="Admin_logout"><ul class="responsive float-right"><li><button type="submit">Logout</button></li></ul></form>

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
			<h2>Manage courses</h2>
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
						<th><i class=""></i> Logo</th>
						<th><i class=""></i> Course Name</th>
						<th><i class=""></i> Category</th>
						<th><i class=""></i> Video Link</th>
						
					</tr>

					<!-- Profile -->
					<%
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select * from admin_course ";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){

	Blob imageBlob = resultSet.getBlob("logo");
    
    
%>
					<tr>
						<% if (imageBlob != null) {
						    	//displaying the logo from the database
						      imageData = imageBlob.getBytes(1, (int)imageBlob.length());
						
						      // display the image using HTML
						      out.println("<td><img src=\"data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData) + "\" style=\"max-width: 200px; max-height: 200px;\"/></td>");
						    }
						%>					
						<td class="centered"><%= resultSet.getString("course_name")%></td>
						<td class="centered"><%= resultSet.getString("category")%></td>
						<td class="centered"><%= resultSet.getString("video_link")%></td>
						
						
						
						<td class="action"><a href="admin_edit_course.jsp?id=<%= resultSet.getString("id")%>&edit=1"><i class="fa fa-pencil"></i>Edit</a>
						<a	href="admin_edit_course.jsp?id=<%= resultSet.getString("id")%>&delete=1" class="delete"><i class="fa fa-remove"></i> Delete</a></td>
				
					</tr>
				<% 
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

				</table>

				

			</div>

		</div>


<!-- Footer
================================================== -->
<div class="margin-top-100"></div>


</div>
<!-- Wrapper / End -->


<!-- Scripts
================================================== -->
<script src="recruiter_look/scripts/jquery-2.1.3.min.js"></script>
<script src="recruiter_look/scripts/custom.js"></script>
<script src="recruiter_look/scripts/jquery.superfish.js"></script>
<script src="recruiter_look/scripts/jquery.themepunch.tools.min.js"></script>
<script src="recruiter_look/scripts/jquery.themepunch.revolution.min.js"></script>
<script src="recruiter_look/scripts/jquery.themepunch.showbizpro.min.js"></script>
<script src="recruiter_look/scripts/jquery.flexslider-min.js"></script>
<script src="recruiter_look/scripts/chosen.jquery.min.js"></script>
<script src="recruiter_look/scripts/jquery.magnific-popup.min.js"></script>
<script src="recruiter_look/scripts/waypoints.min.js"></script>
<script src="recruiter_look/scripts/jquery.counterup.min.js"></script>
<script src="recruiter_look/scripts/jquery.jpanelmenu.js"></script>
<script src="recruiter_look/scripts/stacktable.js"></script>



<!-- WYSIWYG Editor -->
<script type="text/javascript" src="jobseeker/scripts/jquery.sceditor.bbcode.min.js"></script>
<script type="text/javascript" src="jobseeker/scripts/jquery.sceditor.js"></script>


</body>
</html>