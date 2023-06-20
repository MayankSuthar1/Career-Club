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
			<h1><a href="jobseeker_index.jsp"><img src="jobseeker_look/images/logo.png" alt="Career Club" /></a></h1>
		</div>

		<!-- Menu -->
		<nav id="navigation" class="menu">
			<ul id="responsive">

				

				
				<li><a href="#">Skill Test</a>
					<ul>
						<li><a href="jobseeker_test_find_page.jsp">Choose Test</a></li>
						
					</ul>
				</li>
					
		
				<li><a href="#">Course</a>
					<ul>
						<li><a href="jobseeker_course.jsp">Buy a Course</a></li>
						<li><a href="jobseeker_buyed_course.jsp">Your Courses</a></li>
						
					</ul>
					
				</li>
				<li><a href="#">Profile</a>
					<ul>
						<li><a href="jobseeker_edit_profile.jsp">Edit Profile</a></li>
						
					</ul>
					
				</li>

				
			</ul>
			
		<!-- Logout -->
			<form method="post" action="Logout"><ul class="responsive float-right"><li><a><input type="submit" value="Logout"/></a></li></ul></form>


			

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
			<h2>Apply for jobs</h2>
			
		</div>

	</div>
</div>


<!-- Content
================================================== -->
<div class="container">
	
	<!-- Table -->
	
	<!-- Applications -->
	<div class="sixteen columns">
		
		<%
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select * from rec_job where test='"+request.getParameter("title")+"'";

String sqli ="SELECT * FROM rec_job WHERE test='"+request.getParameter("title")+"' and job_id NOT IN (SELECT job_id FROM jobseeker_apply_job WHERE jobseeker_id = "+session.getAttribute("id")+")";

resultSet = statement.executeQuery(sqli);



while(resultSet.next()){
	 Blob imageBlob = resultSet.getBlob("logo");
	     
	  
	%>
		<!-- Application #1 -->
		<div class="application">
		
			<div class="app-content">
				
				<!-- Name / Avatar -->
				<div class="info">
				<%if (imageBlob != null) {
			    	//displaying the logo from the database
				      imageData = imageBlob.getBytes(1, (int)imageBlob.length());
				      out.println("<img src=\"data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData) + "\" style=\"max-width: 250px; max-height: 250px;\" />");
				      } %>
					
					<span><%=resultSet.getString("job_title")%></span>
				</div>
				
				<!-- Buttons -->
				<div class="buttons">
				<a href="#three-1" class="button gray app-link"><i class="fa fa-plus-circle"></i> Show Details</a>
					<a href="#one-1" class="button gray app-link"><i class="fa fa-pencil"></i> Options</a>
				</div>
				<div class="clearfix"></div>

			</div>

			<!--  Hidden Tabs -->
			<div class="app-tabs">

				<a href="#" class="close-tab button gray"><i class="fa fa-close"></i></a>
				
				<!-- First Tab -->
			    <div class="app-tab-content" id="one-1">

					<div class="clearfix"></div>
					<a href="jobseeker_applyforjob_process.jsp?name=<%=resultSet.getString("job_title")%>&job_id=<%=resultSet.getString("job_id")%>&title=<%=request.getParameter("title")%>" class="button margin-top-15">Apply</a>

			    </div>
			    
			    <!-- Second Tab -->
			    
			    <!-- Third Tab -->
			    <div class="app-tab-content"  id="three-1">
					<i>Company Name:</i>
					<span><%=resultSet.getString("company_name")%></span>

					<i>Email:</i>
					<span><%=resultSet.getString("email")%></span>

					<i>Address:</i>
					<span><%=resultSet.getString("address")%></span>
					
					<i>Job Type:</i>
					<span><%=resultSet.getString("job_type")%></span>
					
					<i>Job Category:</i>
					<span><%=resultSet.getString("category")%></span>
			    	
			    	<i>Company Website:</i>
					<span><%=resultSet.getString("website")%></span>
					
			    	<i>Description:</i>
					<span><%=resultSet.getString("description")%></span>
					
					
			    </div>

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

<!-- Back To Top Button -->
<div id="backtotop"><a href="#"></a></div>

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
<script type="text/javascript" src="recruiter_look/scripts/jquery.sceditor.bbcode.min.js"></script>
<script type="text/javascript" src="recruiter_look/scripts/jquery.sceditor.js"></script>


</body>
</html>