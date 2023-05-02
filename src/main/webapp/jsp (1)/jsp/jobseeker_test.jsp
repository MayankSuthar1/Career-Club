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
<link rel="stylesheet" href="jobseeker_look/css/test_style.css">
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

</head>

<body>
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
			
			
		<!-- Logout -->
			<ul class="responsive float-right">
				<li><a href="jobseeker_index.html">Quit quiz</a></li>
			</ul>


			

		</nav>
	
			
	
		</div>
	</div>
	</header>
	<div class="clearfix"></div>
<!-- start Quiz button -->
<div class="start_btn"><button>Start Quiz</button></div>

<!-- Info Box -->
<div class="info_box">
	<div class="info-title"><span>Some Rules of this Quiz</span></div>
	<div class="info-list">
		<div class="info">1. You will have only <span>15 seconds</span> per each question.</div>
		<div class="info">2. Once you select your answer, it can't be undone.</div>
		<div class="info">3. You can't select any option once time goes off.</div>
		<div class="info">4. You can't exit from the Quiz while you're playing.</div>
		<div class="info">5. You'll get points on the basis of your correct answers.</div>
	</div>
	<div class="buttons">
		<button class="quit">Exit</button>
		<button class="restart">Start</button>
	</div>
</div>

<!-- Quiz Box -->
<div class="quiz_box">
	<header>
		<div class="title">Skill Test</div>
		<div class="timer">
			<div class="time_left_txt">Time Left</div>
			<div class="timer_sec">30</div>
		</div>
		
	</header>
	<section>
		<div class="que_text">
			<!-- Here I've inserted question from JavaScript -->
		</div>
		<div class="option_list">
			<!-- Here I've inserted options from JavaScript -->
		</div>
	</section>

	<!-- footer of Quiz Box -->
	<footer>
		<div class="total_que">
			<!-- Here I've inserted Question Count Number from JavaScript -->
		</div>
		<button class="next_btn">Next Que</button>
	</footer>
</div>

<!-- Result Box -->
<div class="result_box">
	<div class="icon">
		<i class="fas fa-crown"></i>
	</div>
	<div class="complete_text">You've completed the Quiz!</div>
	<div class="score_text">
		<!-- Here I've inserted Score Result from JavaScript -->
	</div>
	<div class="buttons">
		<button class="restart">Result</button>
		<button class="quit">Quit</button>
	</div>
</div>

<!-- Inside this JavaScript file I've inserted Questions and Options only -->
<script src="jobseeker_look/js/questions.js"></script>

<!-- Inside this JavaScript file I've coded all Quiz Codes -->
<script src="jobseeker_look/js/script.js"></script>


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