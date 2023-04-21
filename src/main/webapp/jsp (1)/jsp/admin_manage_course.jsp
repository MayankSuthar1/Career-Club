<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<!-- Basic Page Needs
================================================== -->
<meta charset="utf-8">
<title>Career club</title>

<!-- Mobile Specific Metas
================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href="admin_look/css/style.css">
<link rel="stylesheet" href="admin_look/css/colors/green.css" id="colors">

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
			<h1><a href="admin_home.html"><img src="admin_look/images/logo.png" alt="Careerclub" /></a></h1>
		</div>

		
		<!-- Menu -->
<nav id="navigation" class="menu">
	<ul id="responsive">

	
		<li><a>Courses</a>
			<ul>
			<li><a href="admin_create_course.html">Create course</a></li>
		<li><a href="admin_manage_course.html">Edit course</a></li>
		
			</ul>
		</li>
		<li><a href="#">Tests</a>
			<ul>
				<li><a href="admin_create_test.html">Create test</a></li>
				<li><a href="admin_edit_test.html">Edit test</a></li>
				
				
			</ul>
		</li>
		<li><a href="#">Getdetails</a>
			<ul>
				<li><a href="admin_recruiter_details.html">Recruiter</a></li>
				<li><a href="admin_jobseeker_details.html">Job Seeker</a></li>
				
			</ul>
		</li>
		
	
	</ul>
		<!-- Logout -->
		<ul class="responsive float-right">
			<li><a href="admin_login.html">Logout</a></li>
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
			<h2>Manage Courses</h2>
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
				<th><i class="fa fa-file-text"></i> Title</th>
				
				<th><i class="fa fa-calendar"></i> Date Posted</th>
			
				<th><i class="fa fa-user"></i>Options</th>
				<th></th>
			</tr>
					
			<!-- Item #1 -->
			<tr>
				<td class="title"><a href="#">Marketing Coordinator - SEO / SEM Experience <span class="pending">(Pending Approval)</span></a></td>				
				<td>September 30, 2015</td>	
				<td class="action">
					<a href="#" class="delete"><i class="fa fa-remove"></i> Delete</a>
					<a href="#"><i class="fa fa-pencil"></i> Edit</a>
				</td>
			</tr>
					
			<!-- Item #2 -->
			<tr>
				<td class="title"><a href="#">Web Developer - Front End Web Development, Relational Databases</a></td>
				<td>September 30, 2015</td>	
				<td class="action">
					<a href="#" class="delete"><i class="fa fa-remove"></i> Delete</a>
					<a href="#"><i class="fa fa-pencil"></i> Edit</a>
				</td>
			</tr>	

			<!-- Item #2 -->
			<tr>
				<td class="title"><a href="#">Power Systems User Experience Designer</a></td>
				<td>September 30, 2015</td>	
				<td class="action">
					<a href="#" class="delete"><i class="fa fa-remove"></i> Delete</a>
					<a href="#"><i class="fa fa-pencil"></i> Edit</a>
				</td>
			</tr>

		</table>

		<br>
		<a href="admin_create_course.html" class="button">Add Course</a>

	</div>

</div>


<div class="margin-top-100"></div>

	


<!-- Back To Top Button -->
<div id="backtotop"><a href="#"></a></div>

</div>
<!-- Wrapper / End -->


<!-- Scripts
================================================== -->
<script src="admin_look/scripts/jquery-2.1.3.min.js"></script>
<script src="admin_look/scripts/custom.js"></script>
<script src="admin_look/scripts/jquery.superfish.js"></script>
<script src="admin_look/scripts/jquery.themepunch.tools.min.js"></script>
<script src="admin_look/scripts/jquery.themepunch.revolution.min.js"></script>
<script src="admin_look/scripts/jquery.themepunch.showbizpro.min.js"></script>
<script src="admin_look/scripts/jquery.flexslider-min.js"></script>
<script src="admin_look/scripts/chosen.jquery.min.js"></script>
<script src="admin_look/scripts/jquery.magnific-popup.min.js"></script>
<script src="admin_look/scripts/waypoints.min.js"></script>
<script src="admin_look/scripts/jquery.counterup.min.js"></script>
<script src="admin_look/scripts/jquery.jpanelmenu.js"></script>
<script src="admin_look/scripts/stacktable.js"></script>
<script src="admin_look/scripts/stacktable.js"></script>



</body>
</html>