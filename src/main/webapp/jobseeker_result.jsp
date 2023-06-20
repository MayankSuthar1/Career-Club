<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%


String title = request.getParameter("title");
String score = request.getParameter("score");
String outof = request.getParameter("outof");

%>
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
<link rel="stylesheet" href="jobseeker_look/css/style.css">
<link rel="stylesheet" href="jobseeker_look/css/colors/green.css" id="colors">
<link rel="stylesheet" href="jobseeker_look/css/result.css">
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
			<h1><a href="jobseeker_index.jsp"><img src="jobseeker_look/images/logo.png" alt="Career club" /></a></h1>
		</div>

		<!-- Menu -->
<nav id="navigation" class="menu">
	<ul id="responsive">

	
		<li><a href="#">Skill Test</a>
			<ul>
				<li><a href="jobseeker_test_find_page.jsp">Choose Test</a></li>
				
			</ul>
		</li>
			
		
		<li><a href="#">Course</a>
			<ul>
				<li><a href="jobseeker_course.jsp">Buy a Course</a></li>
				<li><a href="jobseeker_buyed_course.jsp">Your Courses</a></li>
				
			</ul>
			
		</li>
		<li><a href="#">Profile</a>
			<ul>
				<li><a href="jobseeker_edit_profile.jsp">Edit Profile</a></li>
			</ul>
			
		</li>	
	
	</ul>
		<!-- Logout -->
		<form method="post" action="Logout"><ul class="responsive float-right"><li><a><input type="submit" value="Logout"/></a></li></ul></form>
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
			<h2> Your result </h2>
		</div>

	</div>
</div>


<h1>Student Result</h1>
	<table>
		<tr>
			<th>Tests</th>
			<th>Out of</th>
			<th>Score</th>
		</tr>
		<tr>
			<td><%=title%></td>
			<td><%=outof%></td>
			<td><%=score%></td>
		</tr>
		
	</table>
	
	<div class="result">
		Result: 
		<%
		//String str1 = "0";
		String str = request.getParameter("score");
		int score1 = Integer.parseInt(str);;
		if(score1 < 5) {%>
		<span class="fail">You cant have any job. you may retest or apply for course</span>
		<%} 
		else{
		%>
		<span class="pass">Pass</span>
		<%} %>
	</div>
	<div class="divider margin-top-0 padding-reset"></div>
	<div class="text-center">
	<% if(score1 < 5) {%>
		<a href="jobseeker_course.jsp"><input type="button"  name="course" value="Courses"   /></a>
		<a href="jobseeker_test_find_page.jsp"><input type="button"  name="retest" value="Retest"   /></a>
		<a href="jobseeker_index.jsp"><input type="button"  name="home" value="Home"/></a>
		<%} else{%>
			<form method = "post" action="jobseeker_result_process.jsp">
		
		<input type="hidden" class="button" name="title" value="<%=title%>"  />
		<input type="hidden" class="button" name="score" value="<%=score%>"  />
		<input type="hidden" class="button" name="outof" value="<%=outof%>"  />
		<input type="submit" class="button" name="apply_job" value="Apply for job"  />
		</form>
		<%} %>		
	
	
	
		</div>


<!-- Back To Top Button -->


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
