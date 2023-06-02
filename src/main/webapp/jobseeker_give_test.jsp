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
<title>Career Club</title>

<!-- Mobile Specific Metas
================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f7f7f7;
      margin: 0;
      padding: 0;
    }

    .containerr {
      max-width: 600px;
      margin: 50px auto;
      background-color: #fff;
      padding: 20px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      border-radius: 5px;
    }

    h1 {
      font-size: 24px;
      text-align: center;
      margin-top: 0;
    }

    .question {
      font-size: 18px;
      margin-bottom: 10px;
    }

    .options {
      list-style-type: none;
      padding: 0;
      margin-top: 20px;
    }

    .option {
      display: flex;
      align-items: center;
      padding: 10px;
      margin-bottom: 10px;
      background-color: #f2f2f2;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .option:hover {
      background-color: #e0e0e0;
    }

    .option input[type="radio"] {
      margin-right: 10px;
    }

    .option label {
      font-size: 16px;
    }

    .submit-btn {
      display: block;
      width: 100%;
      margin-top: 20px;
      padding: 10px;
      text-align: center;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .submit-btn:hover {
      background-color: #45a049;
    }
  </style>
  
<link rel="stylesheet" href="jobseeker_look/css/style.css">
<link rel="stylesheet" href="jobseeker_look/css/colors/green.css" id="colors">
<link rel="stylesheet" href="jobseeker_look/css/radio.css">
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
			<h1><a href="#"><img src="jobseeker_look/images/logo.png" alt="Career Club" /></a></h1>
		</div>

		<!-- Menu -->
		<nav id="navigation" class="menu">
			<!-- Logout -->
			<ul class="responsive float-right">
				<li><a href="index.jsp">Logout</a></li>
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
			<h2>Skill Test</h2>
		</div>

	</div>
</div>


<!-- Content
================================================== -->
<div class="container">
	
	<!-- Submit Page -->
	<div class="sixteen columns">
		<div class="submit-page">
		<%-- Import required Java classes --%>
    <%@ page import="java.sql.*" %>
    
    <%-- Connect to the MySQL database --%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
    <% Class.forName("com.mysql.cj.jdbc.Driver"); %>
    <% Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pro", "root", "root"); %>
    
    <%-- Retrieve quiz questions and options from the database --%>
    <%
    
    List<String> questions = new ArrayList<>();
       Map<String, List<String>> options = new HashMap<>();
       
       List<String> cAns = new ArrayList<>();
       Map<String, List<String>> cans = new HashMap<>();
       String title = request.getParameter("title");
      
       String sql = "SELECT * FROM admin_question_detail WHERE title = ?";
       PreparedStatement stmt = conn.prepareStatement(sql);
       stmt.setString(1, title);
       ResultSet rs = stmt.executeQuery();
       String correctAnswer = null;
       while (rs.next()) {
           String question = rs.getString("quest");
           String optionA = rs.getString("QA");
           String optionB = rs.getString("QB");
           String optionC = rs.getString("QC");
           String optionD = rs.getString("QD");
           String ccorrectAnswer = rs.getString("correctAns");
           //list for ques and options
           questions.add(question);
           options.put(question, Arrays.asList(optionA, optionB, optionC, optionD));
           //list for correct answer
         	cAns.add(ccorrectAnswer);
           cans.put(ccorrectAnswer, Arrays.asList(ccorrectAnswer));
           
            }
    %>
    
    <%-- Initialize the score --%>
    <% int score = 0; %>
    
    <%-- Process the quiz form submission --%>
    <% if (request.getMethod().equals("POST")) {
        for (int i = 0; i < questions.size(); i++) {
           
        	String userAnswer = request.getParameter("answer"+i); 
          
        
           correctAnswer = cans.get(cAns.get(i)).get(0); // Assuming the correct answer is always the first option
            if (userAnswer != null && userAnswer.equals(correctAnswer)) {
                score++;
            }
            
        }
    } %>
    
    
    
   <%-- Display the quiz questions and form --%>
 
    <form method="post">
        <% for (int i = 0; i < questions.size(); i++) { 
        int que = i ; 
        que++;
        %>
  <div class="containerr">
  <div class="question">
      <strong>Question <%=que%>:</strong><%= questions.get(i)%>
    </div>
           
    <ul class="options">
    <% for (String option : options.get(questions.get(i))) { 
        
            %>
      <li class="option">
       
        <input type="radio" name="answer<%=i%>" id="option1" value="<%= option %>">
        <label for="option1"><%= option %></label>
         
      </li>
      <%  } %>
        
    </ul>
  </div>     
        <% } %>
        <br>
        <button class="submit-btn" type="submit">Submit</button>
        <br />
    </form>
    </div>
    <%-- Display the score if the form was submitted --%>
    <% if (request.getMethod().equals("POST")) { 
    	response.sendRedirect("jobseeker_result.jsp?title="+title+"&score="+score+"&outof="+questions.size()+"");
    }
    	%>
    <%-- Close the database connection --%>
    <% conn.close(); %>
			
		</div>
	</div>




<!-- Footer
================================================== -->
<div class="margin-top-100"></div>

<div id="footer">
	<!-- Container -->
<div class="container">

	<div class="eleven columns">
	
		<h1 class="margin-bottom-15" style="color:white ;">Contact Us</h1>
		
			<!-- Contact Form -->
			<section id="contact" class="padding-right">
	
				<!-- Success Message -->
				<mark id="message"></mark>
	
				<!-- Form -->
				<form method="post" name="contactform" id="contactform" action="Contactform">
	
					<fieldset>
	
						<div>
							<label>Name:</label>
							<input name="name" type="text" id="name" />
						</div>
	
						<div>
							<label >Email: <span>*</span></label>
							<input name="email" type="email" id="email" pattern="^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$" />
						</div>
	
						<div>
							<label>Message: <span>*</span></label>
							<textarea name="message" cols="40" rows="3" id="comment" spellcheck="true"></textarea>
						</div>
	
					</fieldset>
					<div id="result"></div>
					<input type="submit" class="button" id="submit" value="Send Message" />
					<div class="clearfix"></div>
					<div class="margin-bottom-40"></div>
				</form>
	
			</section>
			<!-- Contact Form / End -->
	
	</div>
	<!-- Container / End -->
	
	
	<!-- Sidebar
	================================================== -->
	<div class="five columns">
	
		<!-- Information -->
		<h1 class="margin-bottom-10" style="color:white ;">Information</h1>
		<div class="widget-box">
		<h4>	<p style="color: rgb(120, 119, 119);">A skill base job hiring website</p>
	
			<ul class="contact-informations" style="color: rgb(120, 119, 119);">
				<li>45 Park Avenue, Apt. 303</li>
				<li>Kalol, 382721 </li>
			</ul>
	
			<ul class="contact-informations second" style="color: rgb(120, 119, 119);">
				<li><i class="fa fa-phone"></i> <p>+48 880 440 110</p></li>
				<li><i class="fa fa-envelope"></i> <p>careerclub@contact.com</p></li>
				<li><i class="fa fa-globe"></i> <p>www.careerclub.com</p></li>
			</ul>
		</h4>
		</div>
		
		
	
	</div>
	</div>
	</div>
	<!-- Container / End -->	
	  	

	

	

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