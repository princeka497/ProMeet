<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<%@include file="/common_html/all_css.html" %>
<style>
html, body {
	height: 100vh;
}

.login-form {
	border: 2px solid black;
	box-shadow: 10px 5px 40px red;
	/* xoffset y offset blur radius color */
	border-radius: 10px;
	background-color: cyan;
}

.form-label, .form-control {
	color: red !important;
	font-size: 20px;
	font-family: sans-serif;
	text-align: center;
}

body {
	background-image: url("/mywebsite/images/t1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	/* background-attachment: fixed; */
	/* background-size: 500px 600px; */
	background-position: center;
}
</style>

</head>
<body>
<%
String m=(String)request.getAttribute("msg");
if (m!=null){
%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong><%=m %></strong> 
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%} %>

	<div class="container-fluid">
		<h1 class="text-center" style="color: red">Admin Login Form</h1>
		<form action="/ProMeet/AdminLogin" method="post">
	</div>
	
	<div class="row justify-content-center align-items-center h-75">
	
		<div class="col-md-3 login-form text-center">

			<div class="mb-3 input-group">

				<span class="input-group-text"><i class="fa fa-envelope"></i><span>
						<input type="email" name="adminEmail" placeholder="Enter Email Here "
						class="form-control">
			</div>
			<div class="mb-3 input-group">

				<span class="input-group-text"><i class="fas fa-key"></i></span> <input
					type="password" name="adminPass" placeholder="Enter Password Here "
					class="form-control">


			</div>


			<div class="text-center">
				<button class="btn btn-danger mb-2">
					<i class="fa fa-lock"></i> Submit
				</button>

			</div>

		</div>

	</div>
</form>










	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>