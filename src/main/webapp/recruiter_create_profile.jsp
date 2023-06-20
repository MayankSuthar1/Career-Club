<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Util.DBconnection" %>
<%@page import="javax.servlet.http.HttpSession"%>
<%

String name = request.getParameter("id");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "pro";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;
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
			<h1><a href="#"><img src="recruiter_look/images/logo.png" alt="Career Club" /></a></h1>
		</div>

		<!-- Menu -->
		<nav id="navigation" class="menu">
			
				<!-- Logout -->
				
									<form method="post" action="Logout"><ul class="responsive float-right"><li><a><input type="submit" value="Logout"/></a></li></ul></form>

				
			</nav>
		
		

	</div>
</div>
</header>
<div class="clearfix"></div>

<!-- Titlebar
================================================== -->
<div id="titlebar" class="single submit-page">
	<div class="container">

		<div class="sixteen columns">
			<h2>Create Profile</h2>
		</div>

	</div>
</div>

<!-- Content
================================================== -->
<div class="container">
	
	<!-- Submit Page -->
	<div class="sixteen columns">
		<div class="submit-page">
                        
          <form method="post" name="rec_profile" id="rec_proflie" action="Rec_create_profile">      	
			<%
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select *from rec_reg where id='" + session.getAttribute("id") + "'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
			<!-- Company name -->
			<div class="form">
				<h5>Company name</h5>
				<input class="search-field" type="text" value="" name="com_name"/>
			</div>

			<!-- Company Email -->
			<div class="form">
				<h5>Company email</h5>
				<input class="search-field" type="email"  value="<%=resultSet.getString("email") %>" name="com_email"/>
			</div>

			<!-- Business Type -->
			<div class="form">
				<h5>Business type</h5>
				
 				 <select class="chosen-select-no-single" name="business" id="business">
  					  <option value="Web development">Web development</option>
 					  <option value="Software development">Software development</option>
  					  <option value="Application development">Application development</option>
   					  <option value="Web designing">Web designing</option>
 				</select>
			</div>

			<!-- adddress -->
			<div class="form">
				<h5>Address</h5>
				<input class="search-field" type="text" value="" name="address"/>
			</div>

			
			<!-- contact number -->
			<div class="form">
				<h5>Contact number</h5>
				<input class="search-field" type="text" placeholder="e.g. +915623467816" pattern="^\+91[0-9]{10}$" value="" name="con_num" />
			</div>
		
				<!-- contact name -->
			<div class="form">
				<label>Recruiter name:</label>
				<input name="name" type="text" id="name" />
			</div>
					
		

			<div class="divider margin-top-0 padding-reset"></div>
			<input type="submit" class="button big margin-top-5" id="submit" value="Submit" />
			<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
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