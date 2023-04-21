<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<!-- Basic Page Needs
================================================== -->
<meta charset="utf-8">
<title>Careerclub</title>

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
<div id="titlebar" class="single submit-page">
	<div class="container">

		<div class="sixteen columns">
			<h2><i class="fa fa-plus-circle"></i> Create course </h2>
		</div>

	</div>
</div>


<!-- Content
================================================== -->
<div class="container">
	
	<!-- Submit Page -->
	<div class="sixteen columns">
		<div class="submit-page">

			<!-- Notice -->
			
			<div class="form">
				<h5>Logo <span></span></h5>
				<label class="upload-btn">
				    <input type="file" multiple />
				    <i class="fa fa-upload"></i> Browse
				</label>
				<span class="fake-input">No file selected</span>
			</div>

			<!-- coursename -->
			<div class="form">
				<h5>Coursename</h5>
				<input class="search-field" type="text"   value=""/>
			</div>


			<!-- Choose Category -->
			<div class="form">
				<div class="select">
					<h5>course Category</h5>
					<select data-placeholder="Choose Categories" class="chosen-select" multiple>
						<option value="1">Web Developers</option>
						<option value="2">Mobile Developers</option>
						<option value="3">Designers & Creatives</option>
						<option value="4">Writers</option>
						<option value="5">Virtual Assistants</option>
						<option value="6">Customer Service Agents</option>
						<option value="7">Sales & Marketing Experts</option>
						<option value="8">Accountants & Consultants</option>
					</select>
				</div>
			</div>

			


			<!-- Course Description -->
			<div class="form">
				<h5>Course Description</h5>
				<textarea class="WYSIWYG" name="summary" cols="40" rows="3" id="summary" spellcheck="true"></textarea>
			</div>



			<!-- Course video link -->
			<div class="form">
				<h5>Course video link</h5>
				<input class="search-field" type="text"   value=""/>
			</div>
			


			<div class="divider margin-top-0"></div>
			<a href="#" class="button big margin-top-5"> Create<i class="fa fa-arrow-circle-right"></i></a>


		</div>
	</div>

</div>


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


<!-- WYSIWYG Editor -->
<script type="text/javascript" src="admin_look/scripts/jquery.sceditor.bbcode.min.js"></script>
<script type="text/javascript" src="admin_look/scripts/jquery.sceditor.js"></script>


</body>
</html>