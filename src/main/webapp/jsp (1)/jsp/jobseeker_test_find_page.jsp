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
			<h1><a href="jobseeker_index.html"><img src="jobseeker_look/images/logo.png" alt="Career Club" /></a></h1>
		</div>

		<!-- Menu -->
		<nav id="navigation" class="menu">
			<ul id="responsive">

				

				
				<li><a>Skill Test</a>
					<ul>
						<li><a href="jobseeker_test_find_page.html">Choose Test</a></li>
						
					</ul>
				</li>
					
				</li>
				<li><a>Course</a>
					<ul>
						<li><a href="jobseeker_course.html">Buy a Course</a></li>
						<li><a href="jobseeker_buyed_course.html">Your Courses</a></li>
						
					</ul>
					
				</li>
				<li><a>Profile</a>
					<ul>
						<li><a href="jobseeker_create_profile.html">Create Profile</a></li>
						<li><a href="jobseeker_profile_manage.html">Edit Profile</a></li>
						<li><a href="jobseeker_profile_manage.html">Delete Profile</a></li>
					</ul>
					
				</li>

				
			</ul>
			
		<!-- Logout -->
			<ul class="responsive float-right">
				<li><a href="index.html">Logout</a></li>
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
<div id="titlebar">
	<div class="container">
		<div class="ten columns">
			
			<h2>Aailable skill tests</h2>
		</div>

		

	</div>
</div>


<!-- Content
================================================== -->
<div class="container">
	<!-- Test -->
	<div class="eleven columns">
	<div class="padding-right">
		
		<form action="#" method="get" class="list-search">
			
			<div class="clearfix"></div>
		</form>

		<ul class="job-list full">

			<li><a href="jobseeker_test_details.html">
				<img src="jobseeker_look/images/job-list-logo-01.png" alt="">
				<div class="job-list-content">
					<h4>Front-end Development Test <span class="full-time">Skill Test</span></h4>
					<div class="job-icons">
						
					</div>
				</div>
				</a>
				<div class="clearfix"></div>
			</li>

			<li><a href="jobseeker_test_details.html">
				<img src="jobseeker_look/images/job-list-logo-02.png" alt="">
				<div class="job-list-content">
					<h4>Back-end Development Test <span class="part-time">Skill Test</span></h4>
					<div class="job-icons">
						
					</div>
				</div>
				</a>
				<div class="clearfix"></div>
			</li>

			<li><a href="jobseeker_test_details.html">
				<img src="jobseeker_look/images/job-list-logo-03.png" alt="">
				<div class="job-list-content">
					<h4>Full Stack Development Test <span class="full-time">Skill Test</span></h4>
					<div class="job-icons">
						
					</div>
				</div>
				</a>
				<div class="clearfix"></div>
			</li>

			

			
		</ul>
		<div class="clearfix"></div>

		<div class="pagination-container">
			<nav class="pagination">
				<ul>
					<li><a href="#" class="current-page">1</a></li>
					
				</ul>
			</nav>

			<nav class="pagination-next-prev">
				<ul>
					<li><a href="#" class="prev">Previous</a></li>
					<li><a href="#" class="next">Next</a></li>
				</ul>
			</nav>
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