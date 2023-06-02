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
				<h1><a href="recruiter_index.jsp"><img src="recruiter_look/images/logo.png" alt="Career club" /></a></h1>
			</div>
	
			<!-- Menu -->
	<nav id="navigation" class="menu">
		<ul id="responsive">
	
		
		<li><a>Jobs</a>
			<ul>
		<li><a href="recruiter_create_job.jsp">Create job</a></li>
		<li><a href="recruiter_manage_jobs.jsp">Manage jobs</a></li>
			</ul>
		</li>
	
			
			
			<li><a href="recruiter_jobseeker_details.jsp">Get Job Seekers Details</a></li>
				
				<li><a href="#">Profile</a>
					<ul>
						<li><a href="recruiter_edit_profile.jsp">Edit</a></li>
						<li><a href="recruiter_edit_profile.jsp">Delete</a></li>
						
					</ul>
				</li>
			
		
		</ul>
					<!-- Logout -->
				<ul class="responsive float-right">
					<li><a href="index.jsp">Logout</a></li>
				</ul>
			</nav>		<!-- Navigation -->
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
			<h2><i class="fa fa-plus-circle"></i> Edit Job</h2>
		</div>

	</div>
</div>


<!-- Content
================================================== -->
<div class="container">

 
	
	<!-- Submit Page -->
	<div class="sixteen columns">
		<div class="submit-page">

			
			
		<form method="post" name="add_job" id="add_job" action="Rec_edit_job" enctype="multipart/form-data" >
		<%
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select * from rec_job where id='" + session.getAttribute("id") + "' and job_id='" + job_id + "'";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){
	 Blob imageBlob = resultSet.getBlob("logo");
	    if (imageBlob != null) {
	    	//displaying the logo from the database
	      imageData = imageBlob.getBytes(1, (int)imageBlob.length());

	      // display the image using HTML
	      out.println("<img src=\"data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData) + "\" style=\"max-width: 250px; max-height: 250px;\" />");
	    }    
	%>
    		<input  type="hidden"  value="<%=resultSet.getString("id") %>" name="id"/>
    		<input  type="hidden"  value="<%=resultSet.getString("job_id") %>" name="job_id"/>
			
			<!-- Logo -->
			<div class="form">
				<h5>Logo </h5>
				<label class="upload-btn">				
				    <input type="file" name="logo" id="logo" />
				    <i class="fa fa-upload"></i> 
				</label>				
			</div>
			
			<br/>
			<br/>
			<!-- Email -->
			<div class="form">
				<h5>Your Email</h5>
				<input class="search-field" type="email"  value="<%=resultSet.getString("email") %>" name="email"/>
			</div>

			<!-- Title -->
			<div class="form">
				<h5>Job Title</h5>
				<input class="search-field" type="text" placeholder="" value="<%=resultSet.getString("job_title") %>" name="job_title"/>
			</div>

			<!-- Location -->
			<div class="form">
				<h5>Address</h5>
				<input class="search-field" type="text"  value="<%=resultSet.getString("address") %>" name="address"/>
				
			</div>

			<!-- Job Type -->
			<div class="form">
				<h5>Job Type</h5>
				<select data-placeholder="Full-Time" class="chosen-select-no-single" name="job_type">
				 <option value="<%=resultSet.getString("job_type") %>" selected ><%=resultSet.getString("job_type") %></option>
					<option value="Full-Time">Full-Time</option>
					<option value="Part-Time">Part-Time</option>
					<option value="Internship">Internship</option>
					<option value="Freelance">Freelance</option>
				</select>
			</div>


			<!-- Choose Category -->
			<div class="form">
				<div class="select">
					<h5>Category</h5>
					<select data-placeholder="Choose Categories" class="chosen-select" name="category" >
					 <option value="<%=resultSet.getString("category") %>" selected ><%=resultSet.getString("category") %></option>
						<option value="Web Developers">Web Developers</option>
						<option value="Mobile Developers">Mobile Developers</option>
						<option value="Designers & Creatives">Designers & Creatives</option>
						<option value="Writers">Writers</option>
						<option value="Virtual Assistants">Virtual Assistants</option>
						<option value="Customer Service Agents">Customer Service Agents</option>
						<option value="Sales & Marketing Experts">Sales & Marketing Experts</option>
						<option value="Accountants & Consultants">Accountants & Consultants</option>
					</select>
				</div>
			</div>

			<div class="form">
				<div class="select">
					<h5>Available Tests</h5>
					<select data-placeholder="Choose test to show your job" class="chosen-select" name="test" >
					<%
					
					Connection connn = null;
					   Statement stmtt = null;
					   ResultSet rs = null;
					
					   connn = DriverManager.getConnection(connectionUrl+database, userid, password);
					   stmtt = connn.createStatement();   
				      // Execute the query to retrieve data
				      String query = "SELECT title FROM admin_test_detail";
				      rs = stmtt.executeQuery(query); %>
				      <option value=" <%=resultSet.getString("test")%>"><%=resultSet.getString("test")%></option>
					 <%while (rs.next()) {%>
         <option value="<%=rs.getString("title")%>"><%=rs.getString("title")%></option>
    			 <%
    			 } 
					 rs.close();
					 stmtt.close();
    			 	connn.close();
					
    			 %> 
      		</select>
				</div>
			</div> 


			<!-- Description -->
			<div class="form">
				<h5>Description</h5>
				<textarea class="WYSIWYG" name="des" cols="40" rows="3" id="summary" spellcheck="true" ><%=resultSet.getString("description") %></textarea>
			</div>

	
			<!-- Company Details -->
			<div class="divider"><h3>Company Details</h3></div>

			<!-- Company Name -->
			<div class="form">
				<h5>Company Name</h5>
				<input type="text" placeholder="Enter the name of the company" name="company_name" value="<%=resultSet.getString("company_name") %>">
			</div>

			<!-- Website -->
			<div class="form">
				<h5>Website <span>(optional)</span></h5>
				<input type="text" placeholder="http://" name="website" value="<%=resultSet.getString("website") %>">
			</div>

	
			<div class="divider margin-top-0"></div>
		<input type="submit" class="button big margin-top-5" id="submit" name="submit"/>
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
				<form method="post" action="Rec_edit_job">
			<%
			try{
				con = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=con.createStatement();
				String sql ="select * from rec_job where id='" + session.getAttribute("id") + "' and job_id='" + job_id + "'";

				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
				%>
					<div class="small-dialog-headline">
						<h2>Are you sure ?</h2>
					</div>

					<div class="small-dialog-content">
			<input class="search-field" type="hidden"  value="<%=resultSet.getString("id") %>" name="id"/>
			<input  type="hidden"  value="<%= resultSet.getString("job_id")%>" name="job_id"/>
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