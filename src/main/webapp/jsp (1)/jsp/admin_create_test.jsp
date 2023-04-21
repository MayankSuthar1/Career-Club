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

<!-- offline bootstrap links -->
    <link href="admin_look/Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="admin_look/Bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <script src="admin_look/Bootstrap/js/bootstrap.min.js"></script>
    <link href="admin_look/Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="admin_look/Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- Online Links -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    

    <!-- Css Files -->
    <link rel="stylesheet" href="../Header/css/headerstyl.css">
    <link rel="stylesheet" href="../css/createquiz.css">
    <link rel="stylesheet" href="../css/home_footer_style.css">
    <!-- JavaScript Files -->
   


    <script src="https://www.gstatic.com/firebasejs/7.5.2/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.5.2/firebase-firestore.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.5.2/firebase-auth.js"></script>


</head>

<body>

	



<!-- Header
================================================== -->
<header>
<div class="container">
	<div class="sixteen columns">
	
		<!-- Logo -->
		<div id="logo">
			<h1><a href="admin_login.html"><img src="admin_look/images/logo.png" alt="Careerclub" /></a></h1>
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



 <!-- Start Image :) -->

 <div class="center set-title " style="justify-content: center; text-align: center;">
	<h1>Create Your Quiz</h1>
	<!-- in the perivous line you need to change the title with your page title -->
</div>


<div class="container mt-3" id="b3">
<div class='p-2 flex-fill Qusistion'>
	<label for="name_quiz">Name Of Quiz:- </label>
	<input type="text" style="margin: 15px;" id="name_quiz">

	<br>
	<label for="time_id">
		Time OF Quiz:-
		<!-- <input type="number" class="form-control" style="margin: 15px" min="1" max="120">minutes -->
	</label><br>
	<div style="display: inline;" class="def-number-input number-input safari_only" id=time_id>
		<button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus">-</button>
		<input class="quantity" min="1" name="quantity" value="1" type="number" id="time_quiz">
		<button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus">+</button>
	</div>
</br>
	</br>
	<label>
		Number of point for each question:-
	</label>
	<!-- <input type="number" class="quantity" style="margin: 15px" min="0.5" step="0.5">point -->
	<br>
	<div style="display: inline; " class="def-number-input number-input safari_only">
		<button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus">-</button>
		<input class="quantity" min="0.5" name="quantity" value="0.5" step="0.5" type="number" id="point">
		<button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus">+</button>
	</div>
</div>
</div>

<!--  quistions  -->
<div class="container mt-3" id="questions">

<!--    Questions in js file    -->

</div>

<div class="p-2 flex-fill text-center" id="b1">
<button type="button" class="btn btn-primary" onclick="add_one_question()" style="width: 40%">Add Quistion one
	answer</button>
<button type="button" class="btn btn-primary" onclick="add_multi_question()" style="width: 40%;">Add Quistion
	many answer</button>
</div>
<div class="p-2 flex-fill text-center" id="b2">
<div id="error" style="color: red; margin: 10px;font-size: large"></div>
<button id="finish" class="btn btn-primary" onclick="validation()" style="width: 40%;">Finish</button>
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
<script src="admin_look/scripts/createquiz.js"></script>

</body>
</html>