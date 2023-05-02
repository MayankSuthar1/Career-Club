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
<link rel="icon" href="admin_look/images/tab.png">
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
				<h1><a href="admin_home.jsp"><img src="admin_look/images/logo.png" alt="Careerclub" /></a></h1>
			</div>
	
			<!-- Menu -->
<nav id="navigation" class="menu">
	<ul id="responsive">

	
		<li><a>Courses<i class="fa fa-arrow-circle-right"></i></a>
			<ul>
			<li><a href="admin_create_course.jsp">Create course</a></li>
		<li><a href="admin_manage_course.jsp">Manage course</a></li>
		
			</ul>
		</li>
		<li><a href="#">Tests</a>
			<ul>
				<li><a href="admin_create_test.jsp">Create test</a></li>
				<li><a href="admin_edit_test.jsp">Manage test</a></li>
				
				
			</ul>
		</li>
		<li><a href="#">Get details</a>
			<ul>
				<li><a href="admin_jobseeker_details.jsp">Job Seeker</a></li>
				<li><a href="admin_recruiter_details.jsp">Recruiter</a></li>
				<li><a href="admin_recruiter_jobs_details.jsp">Recruiter Jobs</a></li>	
			</ul>
		</li>
	
		</ul>
					<!-- Logout -->
				<ul class="responsive float-right">
					<li><a href="admin_login.jsp">Logout</a></li>
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
			<form method = "post" action="Admin_create_course" enctype="multipart/form-data">
			<div class="form">
				<h5>Logo <span></span></h5>
				<label class="upload-btn">
				    <input type="file" name = "logo" id="logo" />
				    <i class="fa fa-upload"></i> 
				</label>
			</div>
			<br />
			<br />
			<!-- coursename -->
			<div class="form">
				<h5>Course name</h5>
				<input class="search-field" type="text" name = "course_name"  value=""/>
			</div>


			<!-- Choose Category -->
			<div class="form">
				<div class="select">
					<h5>Course Category</h5>
					<select data-placeholder="Choose Categories" class="chosen-select" name="category">
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

			


			<!-- Course Description -->
			<div class="form">
				<h5>Course Description</h5>
				<textarea class="WYSIWYG" name="des" cols="40" rows="3" id="summary" spellcheck="true"></textarea>
			</div>



			<!-- Course video link -->
			<div class="form">
				<h5>Course video link</h5>
				<input class="search-field" type="text"  name = "vlink" value=""/>
			</div>
			


			<div class="divider margin-top-0"></div>
			
			<button class="button big margin-top-5" type="submit" name="submit" value="Create">Create<i class="fa fa-arrow-circle-right"></i></button>
			</form>

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