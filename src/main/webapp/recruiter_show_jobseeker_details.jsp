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
String job_id = request.getParameter("job_id");
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
		<form method="post" action="Logout"><ul class="responsive float-right"><li><button type="submit">Logout</button></li></ul></form>
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
			<h2>Manage Applications</h2>
			
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
String sql ="select * from jobseeker_apply_job where test_title='" + request.getParameter("test_title") + "' and job_id='" + request.getParameter("job_id") + "' and accepted = 0";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){
	 Blob imageBlob = resultSet.getBlob("photo");
	    if (imageBlob != null) {
	    	//displaying the logo from the database
	      imageData = imageBlob.getBytes(1, (int)imageBlob.length());

	      }    
	%>
		<!-- Application #1 -->
		<div class="application">
			<div class="app-content">
				
				<!-- Name / Avatar -->
				<div class="info">
					<%out.println("<img src=\"data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData) + "\" style=\"max-width: 250px; max-height: 250px;\" />"); %>
					<span><%=resultSet.getString("jobseeker_name")%></span>
					<ul>
						<li><a href="#">Score :- <b><%=resultSet.getString("score")%></b> outof 10</a></li>
						
					</ul>
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
					<form method="post" action="Rec_jobseeker_accepted_application_email">
					
					<input type="hidden" name="js_id" value="<%=resultSet.getString("jobseeker_id")%>" />
					<input type="hidden" name="test" value="<%=resultSet.getString("test_title")%>" />
					<input type="hidden" name="job_id" value="<%=resultSet.getString("job_id")%>" />
					<input type="hidden" name="email" value="<%=resultSet.getString("email")%>" />
					<input type="hidden" name="name" value="<%=resultSet.getString("jobseeker_name")%>" />
					
					<input class="button margin-top-15" type="submit" name ="accept" value="Accept this application"/>
					<input class="button gray margin-top-15 delete-application" type="submit" name ="delete" value="Delete this application"/>
					<%-- <a href="recruiter_show_jobseeker_details_process.jsp?accept=true&js_id=<%=resultSet.getString("jobseeker_id")%>&test=<%=resultSet.getString("test_title")%>&job_id=<%=resultSet.getString("job_id") %>" class="button margin-top-15">Accept this application</a>
					<a href="recruiter_show_jobseeker_details_process.jsp?delete=true&js_id=<%=resultSet.getString("jobseeker_id")%>&test=<%=resultSet.getString("test_title")%>&job_id=<%=resultSet.getString("job_id") %>" class="button gray margin-top-15 delete-application">Delete this application</a>--%>
					</form>
			    </div>
			    
			    <!-- Second Tab -->
			    
			    <!-- Third Tab -->
			    <div class="app-tab-content"  id="three-1">
					
					<i>Given test:</i>
					<span><%=resultSet.getString("test_title")%></span>
					
					<i>Email:</i>
					<span><%=resultSet.getString("email")%></span>
					
					<i>Phone No:</i>
					<span><%=resultSet.getString("phone_no")%></span>

					<i>Skills:</i>
					<span><%=resultSet.getString("skills")%></span>
					
					<i>Location:</i>
					<span><%=resultSet.getString("location")%></span>
					
					<i>Self:</i>
					<span><%=resultSet.getString("your_self")%></span>
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
				<form method="post" name="Rec_Contactform" id="Rec_Contactform">
	
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