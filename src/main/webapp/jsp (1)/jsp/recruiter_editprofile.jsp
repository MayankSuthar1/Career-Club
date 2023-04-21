<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<!-- Basic Page Needs
================================================== -->
<meta charset="utf-8">
<title>Work Scout</title>

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
			<h1><a href="index.html"><img src="images/logo.png" alt="Work Scout" /></a></h1>
		</div>

	
		<!-- Menu -->
<nav id="navigation" class="menu">
	<ul id="responsive">

	
	<li><a>Jobs</a>
		<ul>
	<li><a herf="add-job.html">create job</a></li>
	<li><a herf="manage-jobs.html">manage jobs</a></li>
		</ul>
	</li>

		
		
		<li><a href="jobseeker_details.html">Get Job Seekers Details</a></li>
			
			<li><a href="#">Profile</a>
				<ul>
					<li><a href="createprofile.html">Create</a></li>
					<li><a href="job-page-alt.html">Edit</a></li>
					<li><a href="resume-page.html">Delete</a></li>
					
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
                        
                 	

			<!-- Company name -->
			<div class="form">
				<h5>Company name</h5>
				<input class="search-field" type="text" placeholder="Your Comapany Name" value=""/>
			</div>

			<!-- Company Email -->
			<div class="form">
				<h5>Company Email</h5>
				<input class="search-field" type="text" placeholder="mail@example.com" value=""/>
			</div>

			<!-- Business Type -->
			<div class="form">
				<h5>Business Type</h5>
				
                                      <select name="business" id="business">
    <option value="volvo">web devlopment</option>
    <option value="saab">software devlpoment</option>
    <option value="opel">application devlopment</option>
    <option value="audi">web desinig</option>
  </select>
			</div>

			<!-- adddress -->
			<div class="form">
				<h5>address</h5>
				<input class="search-field" type="text" placeholder="e.g. india, india" value=""/>
			</div>

			<!-- Logo -->
			<div class="form">
				<h5>Photo <span>(optional)</span></h5>
				<label class="upload-btn">
				    <input type="file" multiple />
				    <i class="fa fa-upload"></i> Browse
				</label>
				<span class="fake-input">No file selected</span>
			</div>

			
			
			
				<!-- contact number -->
			<div class="form">
				<h5>contact number</h5>
				<input class="search-field" type="text"" value=""/>
			
				<!-- contact email -->
			<div class="form">
				<h5>contact email <span>*</h5>
				<input class="search-field" type="text"" value=""/>
			
			
				<!-- contact form -->
			<div class="form">
				

					<div>
						<label>first Name:</label>
						<input name="name" type="text" id="name" />
					</div>
					<div>
						<label>last Name:</label>
						<input name="last name" type="text" id="last name" />
					</div>


					




	
					

			<div class="divider margin-top-0 padding-reset"></div>
			<a href="#" class="button big margin-top-5">submit <i class="fa fa-arrow-circle-right"></i></a>

		</div>
	</div>

</div>


<!-- Back To Top Button -->
<div id="backtotop"><a href="#"></a></div>

</div>
<!-- Wrapper / End -->


<!-- Scripts
================================================== -->
<script src="jobseeker/scripts/jquery-2.1.3.min.js"></script>
<script src="jobseeker/scripts/custom.js"></script>
<script src="jobseeker/scripts/jquery.superfish.js"></script>
<script src="jobseeker/scripts/jquery.themepunch.tools.min.js"></script>
<script src="jobseeker/scripts/jquery.themepunch.revolution.min.js"></script>
<script src="jobseeker/scripts/jquery.themepunch.showbizpro.min.js"></script>
<script src="jobseeker/scripts/jquery.flexslider-min.js"></script>
<script src="jobseeker/scripts/chosen.jquery.min.js"></script>
<script src="jobseeker/scripts/jquery.magnific-popup.min.js"></script>
<script src="jobseeker/scripts/waypoints.min.js"></script>
<script src="jobseeker/scripts/jquery.counterup.min.js"></script>
<script src="jobseeker/scripts/jquery.jpanelmenu.js"></script>
<script src="jobseeker/scripts/stacktable.js"></script>


<!-- WYSIWYG Editor -->
<script type="text/javascript" src="jobseeker/scripts/jquery.sceditor.bbcode.min.js"></script>
<script type="text/javascript" src="jobseeker/scripts/jquery.sceditor.js"></script>


</body>
</html>