<%@page import="java.util.List"%>
<%@page import="org.ranchi.com.Pojo.Admin"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.ranchi.com.Pojo.Registration"%>
<%@page import="javax.persistence.TypedQuery"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
body {
	/* // background: linear-gradient(180deg, rgba(66, 217, 236, 1) 0%, rgba(222, 255, 245, 1) 50%, rgba(238, 130, 238, 1) 100%); */
	width: 100%;
	height: 800px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-image: url('images/bg_image.jpg');
	background-size: cover;
}

.container {
	background: linear-gradient(180deg, rgba(66, 217, 236, 1) 0%,
		rgba(222, 255, 245, 1) 50%, rgba(238, 130, 238, 1) 100%);
	width: 450px;
	height: 450px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 10%;
	border: 1px solid black;
	opacity: 0.8;
}

.lebeltext {
	font-family: monospace;
	font-size: 18px;
	font-weight: bold;
	color: black;
	margin-top: 20px;
}

.txtbox {
	font-family: monospace;
	font-size: 18px;
	font-weight: bold;
	background: white;
	color: black;
	background: white;
	width: 250px;
	height: 40px;
	border-radius: 10px;
	margin-bottom: 15px;
}

.btn {
	width: 100px;
	height: 35px;
	font-family: monospace;
	font-size: 18px;
	border-radius: 10px;
}

.container1 {
	width: 100%;
	height: 80px;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>

<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

	<div class="container">

		<form action="Login.jsp" method="post">

			<h1 class="container1">Admin Login</h1>
			<br> <label class="lebeltext">Username</label><br> <input
				type="text" name="username" placeholder="Username"
				required="required" class="txtbox" /><br> <label
				class="lebeltext">Password</label><br> <input type="password"
				name="password" placeholder="Username" required="required"
				class="txtbox" /><br>

              <h3 id="txtError"></h1><br>
			<div class="container1">
				<input type="submit" value="Login" class="btn" />
			</div>

		</form>



	</div>

	<%
	String user = request.getParameter("username");
	String pass = request.getParameter("password");

	if (user != null || pass != null) 
	{

		String qry = "SELECT u FROM Admin u WHERE u.username = :username AND u.password = :password";

		EntityManagerFactory factory = Persistence.createEntityManagerFactory("dev");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		TypedQuery<Admin> query = manager.createQuery(qry, Admin.class);
		query.setParameter("username", user);
		query.setParameter("password", pass);
		// query.getSingleResult();
		List<Admin> rs = query.getResultList();

		if (rs.size() > 0) {
			response.sendRedirect("Dashboard.jsp?data=" + URLEncoder.encode(user, "UTF-8") + "&data2="
			+ URLEncoder.encode(pass, "UTF-8"));// Retrieve data from the query parameters

			/*  
			   We are get this value from destination jsp.
			String data1 = request.getParameter("data1");
			String data2 = request.getParameter("data2"); */

		} else {
				%>
				 
				 <script type="text/javascript">
				 
				 document.getElementById("txtError").textContent  = "Please enter valid username and password";
				 
				 </script>
				
				<%
				}

	} else {

	}
	%>


	<script type="text/javascript">
		function loginValidation() {
		}
		
		
	</script>



</body>
</html>