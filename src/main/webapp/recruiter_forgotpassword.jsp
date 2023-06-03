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
			<h1><a href="index.jsp"><img src="jobseeker_look/images/logo.png" alt="Career Club" /></a></h1>
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
			
		</div>

	</div>
</div>


<!-- Content
================================================== -->

<!-- Container -->
<div class="container">

	<div class="my-account">


		<div class="tabs-container">
			<!-- rest password -->
			<div class="tab-content" id="tab1" style="display: none;">

				<h3 class="margin-bottom-10 margin-top-10">Forgot Password</h3>

				

					
					<p class="form-row form-row-wide">
						<label for="username">Email Address:</label>
						<input type="text" class="input-text" name="email" id="email" oninput="mail.value = email.value"/>
					</p>
					
				<a href="#small-dialog" class="popup-with-zoom-anim button">Reset Password</a>
			
				<div id="small-dialog" class="zoom-anim-dialog mfp-hide apply-popup">
			
			<form method="post" class="login" action="Rec_forgotpassword">
					
					<div class="small-dialog-headline">
						<h2>The reset password link send to your email</h2>
					</div>

					<div class="small-dialog-content">
			
					<input type="hidden" id="mail"  name= "mail" readonly />
							<input type="submit" class="button big margin-top-5" id="submit" value="Reset" name="reset"/>
						
					</div>
					</form>
		
		</div>
				
		</div>
				
					
				
		
	
				
		</div>
	</div>
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