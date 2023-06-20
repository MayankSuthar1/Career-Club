<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Util.DBconnection" %>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Base64"%>
<%@page import="javax.imageio.*"%>
<%@page import="java.awt.image.*"%>


<%

String name = request.getParameter("id");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "pro";
String userid = "root";
String password = "root";
String job_id = request.getParameter("job_id");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;
byte[] imageData = null;

%>
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
			<form method = "post" action="Admin_edit_course" enctype="multipart/form-data">
			<% 
			String id = request.getParameter("id");
			String edit = request.getParameter("edit");
			String delete = request.getParameter("delete");
			if(delete != null){
				con = DriverManager.getConnection(connectionUrl+database, userid, password);
				Statement st=con.createStatement();
			
				
				String sql="DELETE FROM admin_course WHERE id='" + id + "'";
				int i=st.executeUpdate(sql);
				
				if(i>0){
					response.sendRedirect("admin_manage_course.jsp");
				}
				else{
					response.sendRedirect("admin_manage_course.jsp");
				}	
				st.close();
				con.close();
			}
			if(edit != null){
			try{
				con = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=con.createStatement();
				String sql ="select * from admin_course where id='" + id + "'";

				resultSet = statement.executeQuery(sql);

				while(resultSet.next()){
					 Blob imageBlob = resultSet.getBlob("logo");
					    if (imageBlob != null) {
					    	//displaying the logo from the database
					      imageData = imageBlob.getBytes(1, (int)imageBlob.length());

					      // display the image using HTML
					      out.println("<img src=\"data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData) + "\" style=\"max-width: 250px; max-height: 250px;\" />");
					    } 
			%>
			
			
			<input  type="hidden" name = "id"  value="<%= resultSet.getString("id")%>"/>
			
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
				<input class="search-field" type="text" name = "course_name"  value="<%= resultSet.getString("course_name")%>"/>
			</div>


			<!-- Choose Category -->
			<div class="form">
				<div class="select">
					<h5>Course Category</h5>
				<select data-placeholder="Choose Categories" class="chosen-select" name="category"> 
						<option value="<%=resultSet.getString("category") %>" selected ><%=resultSet.getString("category") %></option>
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
				<textarea class="WYSIWYG" name="des" cols="40" rows="3" id="summary" spellcheck="true"><%=resultSet.getString("description") %></textarea>
			</div>



			<!-- Course video link -->
			<div class="form">
				<h5>Course video link</h5>
				<input class="search-field" type="text"  name = "vlink" value="<%=resultSet.getString("video_link") %>"/>
			</div>
			


			<div class="divider margin-top-0"></div>
			
			<button class="button big margin-top-5" type="submit" name="submit" value="Submit">Submit<i class="fa fa-arrow-circle-right"></i></button>
			<%
}
resultSet.close();
statement.close();
con.close();
}
catch (Exception e) {
e.printStackTrace();
}}
%>
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