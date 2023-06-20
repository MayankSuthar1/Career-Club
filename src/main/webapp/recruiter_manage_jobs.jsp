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
			<h1><a href="recruiter_index.jsp"><img src="recruiter_look/images/logo.png" alt="career club" /></a></h1>
		</div>

		
		<!-- Menu -->
<nav id="navigation" class="menu">
	<ul id="responsive">

	
	<li><a href="#">Jobs</a>
		<ul>
	<li><a href="recruiter_create_job.jsp">create job</a></li>
	<li><a href="recruiter_manage_jobs.jsp">manage jobs</a></li>
		</ul>
	</li>

	<li><a href="recruiter_jobseeker_details.jsp">Get Job Seekers Details</a></li>
			
		<li><a href="#">Profile</a>
				<ul>			
					<li><a href="recruiter_edit_profile.jsp">Edit</a></li>		
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
			<h2>Manage Jobs</h2>
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
				<th><i class="fa fa-file-text"></i>Job Title</th>
				<th><i class="fa fa-file-text"></i>Options</th>
				
				
			</tr>
			</table>
					
			<!-- Item #1 -->
			<%
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select * from rec_job where id='" + session.getAttribute("id") + "'";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){

	
    
%>
			<form method="post" action="recruiter_edit_job.jsp">
			<table class="manage-table responsive-table">

			<tr>
				<th></th>
				<th></th>
				
				
			</tr>
			
			<tr>
				<td class="title"><%=resultSet.getString("job_title") %><input name="job_id" type="hidden" value="<%=resultSet.getInt("job_id") %>"/></td>
				
				
				<td class="action">
				
				<button type="submit" name="edit" ><i class="fa fa-pencil"></i> Edit</button>
					
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
			

		
		<br>
		<a href="recruiter_create_job.jsp" class="button">Add Job</a>

	</div>

</div>


<!-- Footer
================================================== -->
<div class="margin-top-100"></div>

<div id="footer">
	<!-- Container -->
<div class="container">

	<div class="eleven columns">
	
		<h1 class="margin-bottom-15" style="color:white ;">Contact Us</h1>
		
			<!-- Contact Form -->
			<section id="contact" class="padding-right">
	
				<!-- Success Message -->
				<mark id="message"></mark>
	
				<!-- Form -->
				<form method="post" name="Rec_Contactform" id="Rec_Contactform" action="Rec_Contactform">
	
					<fieldset>
	
						<div>
							<label>Name:</label>
							<input name="name" type="text" id="name" />
						</div>
	
						<div>
							<label >Email: <span>*</span></label>
							<input name="email" type="email" id="email" pattern="^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$" />
						</div>
	
						<div>
							<label>Message: <span>*</span></label>
							<textarea name="comment" cols="40" rows="3" id="comment" spellcheck="true"></textarea>
						</div>
	
					</fieldset>
					<div id="result"></div>
					<input type="submit" class="submit" id="submit" value="Send Message" />
					<div class="clearfix"></div>
					<div class="margin-bottom-40"></div>
				</form>
	
			</section>
			<!-- Contact Form / End -->
	
	</div>
	<!-- Container / End -->
	
	
	<!-- Sidebar
	================================================== -->
	<div class="five columns">
	
		<!-- Information -->
		<h1 class="margin-bottom-10" style="color:white ;">Information</h1>
		<div class="widget-box">
		<h4>	<p style="color: rgb(120, 119, 119);">A skill base job hiring website</p>
	
			<ul class="contact-informations" style="color: rgb(120, 119, 119);">
				<li>45 Park Avenue, Apt. 303</li>
				<li>Kalol, 382721 </li>
			</ul>
	
			<ul class="contact-informations second" style="color: rgb(120, 119, 119);">
				<li><i class="fa fa-phone"></i> <p>+48 880 440 110</p></li>
				<li><i class="fa fa-envelope"></i> <p>careerclub@contact.com</p></li>
				<li><i class="fa fa-globe"></i> <p>www.careerclub.com</p></li>
			</ul>
		</h4>
		</div>
		
		
	
	</div>
	</div>
		<!-- Container / End -->	

<!-- Back To Top Button -->
<div id="backtotop"><a href="#"></a></div>

</div>
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