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
if(session.getAttribute("id") == null){
	 RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	    dispatcher.forward(request, response);
}
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
			<h1><a href="jobseeker_index.jsp"><img src="jobseeker_look/images/logo.png" alt="careerclub" /></a></h1>
		</div>

		<!-- Menu -->
		<nav id="navigation" class="menu">
			<ul id="responsive">

				

				
				<li><a>Skill Test</a>
					<ul>
						<li><a href="jobseeker_test_find_page.jsp">Choose Test</a></li>
						<%
						con = DriverManager.getConnection(connectionUrl+database, userid, password);
						statement=con.createStatement();
						String sqli ="select * from jobseeker_score where jobseeker_id='" + session.getAttribute("id") + "'";

						resultSet = statement.executeQuery(sqli);
						while(resultSet.next()){
						if(resultSet != null){
						%>
						<li><a href="jobseeker_manage_result.jsp">Show results</a></li>
						<%} 
						}%>
					</ul>
				</li>
					
		
				<li><a>Course</a>
					<ul>
						<li><a href="jobseeker_course.jsp">Buy a Course</a></li>
						<li><a href="jobseeker_buyed_course.jsp">Your Courses</a></li>
						
					</ul>
					
				</li>
				<li><a>Profile</a>
					<ul>
						<li><a href="jobseeker_edit_profile.jsp">Edit Profile</a></li>
						
					</ul>
					
				</li>
				
				
			</ul>
			
		<!-- Logout -->
		<form method="post" action="Logout">
			<ul class="responsive float-right">
			
				<li><button type="submit">Logout</button></li>
				
			</ul>
			</form>

			

		</nav>

		<!-- Navigation -->
		<div id="mobile-navigation">
			<a href="#menu" class="menu-trigger"><i class="fa fa-reorder"></i> Menu</a>
		</div>

	</div>
</div>
</header>
<div class="clearfix"></div>



<!-- Slider
================================================== -->
<div class="fullwidthbanner-container">
	<div class="fullwidthbanner">
		<ul>
<%
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select name from jobseeker_profile where id='" + session.getAttribute("id") + "'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
			<!-- Slide 1 -->
			<li data-fstransition="fade" data-transition="fade" data-slotamount="10" data-masterspeed="300">
				<img src="jobseeker_look/images/banner-02.jpg" alt="">

				<div class="caption title sfb" data-x="center" data-y="165" data-speed="400" data-start="800"  data-easing="easeOutExpo">
				
					<h2>Welcome</h2>
					<center><h2><%=resultSet.getString("name") %></h2></center>
				</div>

				<div class="caption text align-center sfb" data-x="center" data-y="260" data-speed="400" data-start="1200" data-easing="easeOutExpo">
					<p>Here you can find your dream job with your skills.</p>
				</div>

				<div class="caption sfb" data-x="center" data-y="370" data-speed="400" data-start="1600" data-easing="easeOutExpo">
					<a href="jobseeker_test_find_page.jsp" class="slider-button">Book a test</a>
				</div>
			</li>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
		</ul>
	</div>
</div>



<!-- Content
================================================== -->

<div class="container">
	
	<!-- Recent Jobs -->
	<div class="eleven columns">
	<div class="padding-right">
		<h3 class="margin-bottom-25">Available Tests</h3>
		<ul class="job-list">
			<%
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select * from admin_test_detail";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	Blob imageBlob = resultSet.getBlob("logo");
    if (imageBlob != null) {
    	//displaying the logo from the database
      imageData = imageBlob.getBytes(1, (int)imageBlob.length());

      }
%>
			<li><a href="jobseeker_test_details.jsp?title=<%=resultSet.getString("title")%>">
				<%out.println("<img src=\"data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData) + "\" style=\"max-width: 250px; max-height: 250px;\" />"); %>
				<div class="job-list-content">
					<h4><%=resultSet.getString("title") %></h4>
					<div class="job-icons">
						
					</div>
				</div>
				</a>
				<div class="clearfix"></div>
			</li>

			<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
		</ul>

		<a href="jobseeker_test_find_page.jsp" class="button centered"><i class="fa fa-plus-circle"></i> Show More Tests</a>
		
	</div>
	</div>

	<!-- Job Spotlight -->
	
		<!-- Navigation -->
		
		
		<!-- Showbiz Container -->
		<div id="job-spotlight" class="showbiz-container">
			<div class="showbiz" data-left="#showbiz_left_1" data-right="#showbiz_right_1" data-play="#showbiz_play_1" >
				
				<div class="clearfix"></div>
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