<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Util.DBconnection" %>
<%@page import="javax.servlet.http.HttpSession"%>
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
			<h1><a href="#"><img src="jobseeker_look/images/logo.png" alt="Career Club" /></a></h1>
		</div>

		<!-- Menu -->
		<nav id="navigation" class="menu">
			<!-- Logout -->
			<form method="post" action="Logout"><ul class="responsive float-right"><li><a><input type="submit" value="Logout"/></a></li></ul></form>
		</nav>

		<!-- Navigation -->
		

	</div>
</div>
</header>
<div class="clearfix"></div>


<!-- Titlebar
================================================== -->
<div id="titlebar" class="single submit-page">
	<div class="container">

		<div class="sixteen columns">
			<h2>Create Profile</h2>
		</div>

	</div>
</div>


<!-- Content
================================================== -->
<div class="container">
	
	<!-- Submit Page -->
	<div class="sixteen columns">
		<div class="submit-page">

			<form method="post"  action="Jobseeker_create_profile" enctype="multipart/form-data">

				<%
				try{
				con = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=con.createStatement();
				String sql ="select * from jobseeker_reg where id='" + session.getAttribute("id") + "'";
				
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
				%>

			<!-- name -->
			<div class="form">
				<h5>Your Name <span style="color:red ;">*</span></h5>
				<input class="search-field" type="text" placeholder="Your full name" value="" name="name"/>
			</div>

			<!-- Email -->
			<div class="form">
				<h5>Your Email <span style="color:red ;">*</span></h5>
				<input class="search-field" type="email" placeholder="e.g. mail@example.com" value="<%= resultSet.getString("email")%>" name="email"/>
			</div>
			<!-- Phone -->
			<div class="form">
				<h5>Your Phone No. <span style="color:red ;">*</span></h5>
				<input class="search-field" type="text" placeholder="e.g. +915623467816" pattern="^\+91[0-9]{10}$" value="" name="num"/>
			</div>

			<!-- Skill -->
			<div class="form">
				<h5>Skills <span style="color:red ;">*</span></h5>
				<input class="search-field" type="text" placeholder="e.g. Web Developer" value="" name="skills"/>
			</div>

			<!-- Location -->
			<div class="form">
				<h5>Location <span style="color:red ;">*</span></h5>
				<input class="search-field" type="text" placeholder="e.g. kalol, saij" value="" name="location"/>
			</div>

			<!-- Photo -->
			<div class="form">
				<h5>Photo <span style="color:red ;">*</span></h5>
				<label class="upload-btn">
				    <input type="file" name="photo" id="logo" />
				    <i class="fa fa-upload"></i> 
				</label>
				
			</div>
			<br/>
			<br/>
			<!-- Description -->
			<div class="form">
				<h5>Your Self <span style="color:red ;">*</span></h5>
				<textarea class="WYSIWYG" name="your_self" cols="40" rows="3" id="summary" spellcheck="true" ></textarea>
			</div>


			<div class="divider margin-top-0 padding-reset"></div>
			
				<input type="submit" class="button" name="submit" value="Submit" />			
				<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
				</form>
		</div>
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