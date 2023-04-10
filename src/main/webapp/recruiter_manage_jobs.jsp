<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<ul class="responsive float-right">
			<li><a href="index.jsp">Logout</a></li>
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
				
				
				
			</tr>
					
			<!-- Item #1 -->
			<tr>
				<td class="title"><a href="#">Marketing Coordinator - SEO / SEM Experience </a></td>
				
				
				<td class="action">
				<a href="recruiter_edit_job.jsp"><i class="fa fa-pencil"></i> Edit</a>
					<a href="#" class="delete"><i class="fa fa-remove"></i> Delete</a>
				</td>
			</tr>
					
			<!-- Item #2 -->
			<tr>
				<td class="title"><a href="#">Web Developer - Front End Web Development, Relational Databases</a></td>
				
				
				<td class="action">
					<a href="recruiter_edit_job.jsp"><i class="fa fa-pencil"></i> Edit</a>
					
					<a href="#" class="delete"><i class="fa fa-remove"></i> Delete</a>
				</td>
			</tr>	

			<!-- Item #2 -->
			<tr>
				<td class="title"><a href="#">Power Systems User Experience Designer</a></td>
				
				
				<td class="action">
				<a href="#"><i class="fa fa-pencil"></i> Edit</a>
					<a href="#" class="delete"><i class="fa fa-remove"></i> Delete</a>
				</td>
			</tr>

		</table>

		<br>
		<a href="recruiter_create_job.jsp" class="button">Add Job</a>

	</div>

</div>


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
				<form method="post" name="contactform" id="contactform">
	
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
				<li><i class="fa fa-phone"></i> <p>+91 880 440 110</p></li>
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
<script src="scripts/jquery-2.1.3.min.js"></script>
<script src="scripts/custom.js"></script>
<script src="scripts/jquery.superfish.js"></script>
<script src="scripts/jquery.themepunch.tools.min.js"></script>
<script src="scripts/jquery.themepunch.revolution.min.js"></script>
<script src="scripts/jquery.themepunch.showbizpro.min.js"></script>
<script src="scripts/jquery.flexslider-min.js"></script>
<script src="scripts/chosen.jquery.min.js"></script>
<script src="scripts/jquery.magnific-popup.min.js"></script>
<script src="scripts/waypoints.min.js"></script>
<script src="scripts/jquery.counterup.min.js"></script>
<script src="scripts/jquery.jpanelmenu.js"></script>
<script src="scripts/stacktable.js"></script>
<script src="scripts/stacktable.js"></script>



</body>
</html>