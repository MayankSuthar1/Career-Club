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
<title>Career club</title>

<!-- Mobile Specific Metas
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
			<h1><a href="recruiter_index.jsp"><img src="recruiter_look/images/logo.png" alt="Career Club" /></a></h1>
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
<div id="titlebar" class="single submit-page">
	<div class="container">

		<div class="sixteen columns">
			<h2>Edit Profile</h2>
		</div>

	</div>
</div>

<!-- Content
================================================== -->
<div class="container">
	
	<!-- Submit Page -->
	<div class="sixteen columns">
		<div class="submit-page">
                        
          <form method="post" name="rec_profile" id="rec_proflie" action="Rec_updateprofile_process.jsp">      	
			<%
			
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select * from rec_profile where id='" + session.getAttribute("id") + "'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
			<!-- Company name -->
			<div class="form">
				<h5>Company name</h5>
				<input class="search-field" type="text" value="<%=resultSet.getString("company_name") %>" name="com_name"/>
			</div>

			<!-- Company Email -->
			<div class="form">
				<h5>Company email</h5>
				<input class="search-field" type="email"  value="<%=resultSet.getString("company_email") %>" name="com_email"/>
			</div>

			<!-- Business Type -->
			<div class="form">
				<h5>Business type</h5>
				
 				 <select class="chosen-select-no-single" name="business" id="business" >
 				 <option value="<%=resultSet.getString("business_type") %>" selected ><%=resultSet.getString("business_type") %></option>
  					  <option value="Web development" >Web development</option>
 					  <option value="Software development">Software development</option>
  					  <option value="Application development">Application development</option>
   					  <option value="Web designing">Web designing</option>
 				</select>
			</div>

			<!-- adddress -->
			<div class="form">
				<h5>Address</h5>
				<input class="search-field" type="text" value="<%=resultSet.getString("address") %>" name="address"/>
			</div>

			
			<!-- contact number -->
			<div class="form">
				<h5>Contact number</h5>
				<input class="search-field" type="text" value="<%=resultSet.getString("con_num") %>" placeholder="e.g. +915623467816" pattern="^\+91[0-9]{10}$" name="con_num"/>
			</div>
		
				<!-- contact name -->
			<div class="form">
				<label>Recruiter name:</label>
				<input name="name" type="text" id="name" value="<%=resultSet.getString("rec_name") %>"/>
			</div>
					
		

			<div class="divider margin-top-0 padding-reset"></div>
			<input type="submit" class="button big margin-top-5" id="submit" value="Update" name="update"/>
			<br />
			<br />
			
			
			
			<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
			</form>
			
		

			<a href="#small-dialog" class="popup-with-zoom-anim button">Delete</a>
			
				<div id="small-dialog" class="zoom-anim-dialog mfp-hide apply-popup">
				<form method="post" action="Rec_updateprofile_process.jsp">
			<%
			try{
				con = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=con.createStatement();
				String sql ="select * from rec_profile where id='" + session.getAttribute("id") + "'";

				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
				%>
					<div class="small-dialog-headline">
						<h2>Are you sure ?</h2>
					</div>

					<div class="small-dialog-content">
			<input class="search-field" type="hidden"  value="<%=resultSet.getString("company_email") %>" name="com_email"/>
							<input type="submit" class="button big margin-top-5" id="submit" value="Delete" name="delete"/>
						
					</div>
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
<script type="text/javascript" src="recruiter_look/scripts/jquery.sceditor.bbcode.min.js"></script>
<script type="text/javascript" src="recruiter_look/scripts/jquery.sceditor.js"></script>


</body>
</html>