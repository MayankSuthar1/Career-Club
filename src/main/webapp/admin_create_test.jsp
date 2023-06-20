<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%@page language="java" import="java.sql.*" %>


<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<!-- validation
================================================== -->
<script>

function validateForm(theForm){

if(theForm.title.value==""  || theForm.des.value=="" || theForm.time.value=="" ){
//Please enter username
alert("did you enter all value correct");
theForm.quest.focus();
return false;
}
      return true;
     }
 </script>
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
			<h1><a href="admin_home.jsp"><img src="admin_look/images/logo.png" alt="Career club" /></a></h1>
		</div>

		<!-- Menu -->
<nav id="navigation" class="menu">
	<ul id="responsive">

	
		<li><a href="#">Courses</a>
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
		
		<form method="post" action="Admin_logout"><ul class="responsive float-right"><li><a><input type="submit" value="Logout"/></a></li></ul></form>

		
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
			<h2><i class="fa fa-plus-circle"></i> Create test </h2>
		</div>

	</div>
</div>


<div class="container">
	
	<!-- Submit Page -->
	<div class="sixteen columns">
		<div class="submit-page">



      <form method="POST"  onsubmit="return validateForm(this);" action="Admin_create_test" enctype="multipart/form-data">
    		
    	
			
			<!-- Logo -->
			<div class="form">
				<h5>Logo </h5>
				<label class="upload-btn">
				    <input type="file" name="logo" id="logo" />
				    <i class="fa fa-upload"></i> 
				</label>
				
			</div>
			<div class="form">
			<br />
			<br />
				<h5>Test title</h5>
 				 <input class="search-field" type="text" value="" name="title"/>
			</div>
			
			<div class="form">
				<h5>Test description</h5>
				<textarea class="WYSIWYG" name="des" cols="40" rows="3" id="summary" spellcheck="true"></textarea>
			</div>
    		
    		 <div class="form">
				<h5>Test time</h5>
				<select class="chosen-select" name="time" id="title">
 				 <option value=""selected></option>
 				  <option value="30">30 min</option>
 					  <option value="60">60 min</option>
  					  <option value="120">120 min</option>
  					  
 				</select>
			</div>
			<div class="divider margin-top-0 padding-reset"></div>
		<p>
       <button type="submit" value="Add" name="add">Add questions</button>
          </p>
           

      </form>
      
</div>
	</div>

</div>

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


</body>
</html>
