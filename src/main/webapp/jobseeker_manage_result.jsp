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
<link rel="stylesheet" href="jobseeker_look/css/style.css">
<link rel="stylesheet" href="jobseeker_look/css/colors/green.css" id="colors">

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

						<li><a href="jobseeker_edit_manage.jsp">Edit Profile</a></li>
					
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
<div id="titlebar">
	<div class="container">
		<div class="ten columns">
			<h1>Your Courses</h1>
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
						<th><i class=""></i> Test title</th>
						<th><i class=""></i> Score</th>
						<th><i class=""></i> Out of</th>
						<th><i class=""></i> Options</th>
					</tr>

					<!-- Profile -->
					<%
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select * from jobseeker_score where jobseeker_id = "+session.getAttribute("id")+" ";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){   
%>
					<tr>
										
						<td ><%=  resultSet.getString("test_title")%></td>
						<td ><%=  resultSet.getString("score")%></td>
						<td >  10</td>
						
						
						<td class="action"><a href="jobseeker_apply_job.jsp?title=<%= resultSet.getString("test_title")%>"><i class="fa fa-pencil"></i>Apply for job</a>
						<a	href="jobseeker_test_details.jsp?title=<%= resultSet.getString("test_title")%>" class="delete"><i class="fa fa-remove"></i>Retest</a></td>
				
					</tr>
				<% 
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

				</table>
		
		<br />
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
				<form method="post" name="contactform" id="contactform" action="Contactform">
	
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
							<textarea name="message" cols="40" rows="3" id="comment" spellcheck="true"></textarea>
						</div>
	
					</fieldset>
					<div id="result"></div>
					<input type="submit" class="button" id="submit" value="Send Message" />
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
	  </div>	

	

	

<!-- Back To Top Button -->
<div id="backtotop"><a href="#"></a></div>

</div>
<!-- Wrapper / End -->


<!-- Scripts
================================================== -->
<script src="jobseeker_look/scripts/jquery-2.1.3.min.js"></script>
<script src="jobseeker_look/scripts/custom.js"></script>
<script src="jobseeker_look/scripts/jquery.superfish.js"></script>
<script src="jobseeker_look/scripts/jquery.themepunch.tools.min.js"></script>
<script src="jobseeker_look/scripts/jquery.themepunch.revolution.min.js"></script>
<script src="jobseeker_look/scripts/jquery.themepunch.showbizpro.min.js"></script>
<script src="jobseeker_look/scripts/jquery.flexslider-min.js"></script>
<script src="jobseeker_look/scripts/chosen.jquery.min.js"></script>
<script src="jobseeker_look/scripts/jquery.magnific-popup.min.js"></script>
<script src="jobseeker_look/scripts/waypoints.min.js"></script>
<script src="jobseeker_look/scripts/jquery.counterup.min.js"></script>
<script src="jobseeker_look/scripts/jquery.jpanelmenu.js"></script>
<script src="jobseeker_look/scripts/stacktable.js"></script>


</body>
</html>