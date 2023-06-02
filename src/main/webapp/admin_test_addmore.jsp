<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%@page language="java" import="java.sql.*" %>

<%
if(request.getParameter("submit")!=null){
	response.sendRedirect("admin_home.jsp");
}
if(request.getParameter("add")!=null)
{
 Connection con = null;
    String url = "jdbc:mysql://localhost:3306/";
    String db = "pro";
    String driver = "com.mysql.cj.jdbc.Driver";
    String userName ="root";
    String pass="root";

try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,userName,pass);



try{
Statement st = con.createStatement();
String title = request.getParameter("title").toString();
String quest = request.getParameter("quest").toString();
String QA = request.getParameter("QA").toString();
String QB = request.getParameter("QB").toString();
String QC = request.getParameter("QC").toString();
String QD = request.getParameter("QD").toString();
String correctAns = request.getParameter("correctAns").toString();

       String qry = "insert into admin_question_detail(title,quest,QA,QB,QC,QD,correctAns) values('"+title+"','"+quest+"','"+QA+"','"+QB+"','"+QC+"','"+QD+"','"+correctAns+"')";

int val = st.executeUpdate(qry);

con.close();
        if(val>0)
        {
          response.sendRedirect("admin_test_addmore.jsp?title="+title+"");
        }

}

catch(SQLException ex){
	ex.printStackTrace();
}
}
catch(Exception e){
e.printStackTrace();
}
}

%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<!-- validation
================================================== -->
<script>

function validateForm(theForm){

if(theForm.title.value=="" || theForm.quest.value=="" || theForm.QA.value=="" || theForm.QB.value=="" || theForm.QC.value=="" || theForm.QD.value=="" || theForm.correctAns.value==""){
//Please enter username
alert("Please enter value in all textbox");
theForm.quest.focus();
return false;
}
if(theForm.correctAns.value !== theForm.QA.value && theForm.correctAns.value !== theForm.QB.value && theForm.correctAns.value !== theForm.QC.value && theForm.correctAns.value !== theForm.QD.value ){
	//Please enter username
	alert("only write answer of the options");
	theForm.correctAns.focus();
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

	
		<li><a>Courses</a>
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
			<li><a href="logout.jsp">Logout</a></li>
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
			<h2><i class="fa fa-plus-circle"></i> Create test </h2>
		</div>

	</div>
</div>


<div class="container">
	
	<!-- Submit Page -->
	<div class="sixteen columns">
		<div class="submit-page">



      <form method="POST"  onsubmit="return validateForm(this);" >
    		
    	
			
				
    		 <div class="form">
				<h5>Enter Question:</h5>
				<input class="search-field" type="text" value="" name="quest"/>
			</div>

			
			<div class="form">
				<h5>Enter Answer(A.):</h5>
				<input class="search-field" type="text"  value="" name="QA"/>
			</div>

			

		
			<div class="form">
				<h5>Enter Answer(B.):</h5>
				<input class="search-field" type="text" value="" name="QB"/>
			</div>

			
		
			<div class="form">
				<h5>Enter Answer(C.):</h5>
				<input class="search-field" type="text" value="" name="QC"/>
			</div>
	
			<div class="form">
				<label>Enter Answer(D.):</label>
				<input class="search-field" type="text" value="" name="QD"/>
			</div>
			
			<div class="form">
				<label>Correct answer</label>
				<input class="search-field" type="text" value="" name="correctAns"/>			
			</div>
     

		<p>
       <button type="submit" value="Add" name="add">Add</button>
       
          <button type="reset" value="Reset" name="reset">Reset</button>
          </p>
           

      </form>
      <div class="divider margin-top-0 padding-reset"></div>
      <form method="POST"><input type="submit" value="Submit" name="submit"></form>
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
