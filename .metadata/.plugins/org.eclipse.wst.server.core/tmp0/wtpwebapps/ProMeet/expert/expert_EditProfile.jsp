<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="promeet_web.dao.*,promeet_web.beans.*,ProMeet.utilities.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Edit Profile - Expert Portal</title>
	<%@ include file="/common_html/all_css.html" %>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

	<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<style>
	:root {
	--bg-gradient-light: linear-gradient(to right, #e3f2fd, #ffffff);
	--bg-gradient-dark: linear-gradient(to right, #1f1c2c, #928dab);
	--text-color-light: #212529;
	--text-color-dark: #ffffff;
	--card-bg-light: #ffffff;
	--card-bg-dark: #2c2c3a;
	--input-bg-light: #f8f9fa;
	--input-bg-dark: #3a3a4a;
	--btn-color: #6c63ff;
	--btn-hover: #574b90;
}

body {
	font-family: 'Poppins', sans-serif;
	background:linear-gradient(to right, #141e30, #243b55);
	color: var(--text-color-light);
	transition: all 0.4s ease;
}

body.dark-mode {
	background: var(--bg-gradient-dark);
	color: var(--text-color-dark);
}
.profile-image:hover {
            transform: scale(1.05);
        }
.card {
	background-color: rgba(255, 255, 255, 0.1);
	border-radius: 16px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
	margin-top: 80px;
	padding: 30px;
	 box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: transform 0.3s;
	 backdrop-filter: blur(10px);
}
 .card:hover {
            transform: scale(1.05);
        }

body.dark-mode .card {
	background-color: var(--card-bg-dark);
	color: var(--text-color-dark);
}

.profile-image {
	height: 150px;
	width: 150px;
	object-fit: cover;
	border-radius: 50%;
	border: 4px solid #6c63ff;
	margin: 0 auto 20px;
	display: block;
	box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.card-title {
	text-align: center;
	font-size: 1.75rem;
	font-weight: 600;
}

.card-text {
	text-align: center;
	margin-bottom: 20px;
}

.form-label {
	font-weight: 500;
}

 .form-control {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            padding: 10px;
            font-size: 14px;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }
body.dark-mode .form-control {
	background-color: var(--input-bg-dark);
	color: var(--text-color-dark);
	border: 1px solid #4a4a5e;
}

.btn-custom {
	background-color: var(--btn-color);
	color: #fff;
	border: none;
	padding: 10px 25px;
	border-radius: 12px;
	font-weight: 600;
	transition: background-color 0.3s;
}

.btn-custom:hover {
	background-color: var(--btn-hover);
}

.theme-toggle {
	position: fixed;
	top: 20px;
	right: 30px;
	cursor: pointer;
	font-size: 1.5rem;
	color: inherit;
	transition: color 0.3s;
	z-index: 999;
}
 .btn-update {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            font-weight: bold;
            color: white;
            border-radius: 20px;
            transition: all 0.3s ease-in-out;
        }

        .btn-update:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            box-shadow: 0px 5px 15px rgba(255, 75, 43, 0.4);
        }

@media (max-width: 768px) {
	.card {
		margin-top: 40px;
		padding: 20px;
	}
}

</style>
<body>

<%
	String email = (String) session.getAttribute("sessionEmail");
	if (email == null || session.isNew()) {
		request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
		RequestDispatcher rd = request.getRequestDispatcher("/expert/expert_login.jsp");
		rd.forward(request, response);
	} else {
		ExpertDao dao = new ExpertDao();
		Expert e = dao.expertProfile(email);
		String uploadPath = request.getContextPath();
		String imagePath = uploadPath + "/" + e.getProfile_pic();
%>

<%@ include file="/expert/expert_header.html" %>

<div class="theme-toggle" onclick="toggleTheme()">
	<i class="fas fa-moon" id="themeIcon"></i>
</div>


<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card">
				<img src="<%=imagePath%>" alt="Profile Image" class="profile-image">
				<form action="/ProMeet/Expert_EditProfile" method="post">
					<h5 class="card-title">Edit Your Profile</h5>
					<p class="card-text"><i class="fa fa-envelope"></i> <%=e.getEmail()%></p>

					<div class="mb-3">
						<label class="form-label">Name</label>
						<input type="text" name="name" class="form-control" required value="<%=e.getName()%>">
					</div>

					<div class="mb-3">
						<label class="form-label">Phone Number</label>
						<input type="text" name="phone" class="form-control" required value="<%=e.getPhone()%>">
					</div>

					<div class="mb-3">
						<label class="form-label">City</label>
						<input type="text" name="city" class="form-control" required value="<%=e.getCity()%>">
					</div>

					<div class="mb-3">
						<label class="form-label">Address</label>
						<textarea class="form-control" name="address" rows="2"><%=e.getAddress()%></textarea>
					</div>

					<div class="mb-3">
						<label class="form-label">Expert Type</label>
						<input type="text" name="expert_type" class="form-control" required value="<%=e.getExpert_type()%>">
					</div>

					<div class="mb-3">
						<label class="form-label">Gender</label>
						<input type="text" name="gender" class="form-control" required value="<%=e.getGender()%>">
					</div>

					<div class="text-center mt-4">
						 <button class="btn btn-update w-100">
                    <i class="fa fa-save"></i> Update Profile
                </button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<br>
<%@ include file="/WEB-INF/common/footer.html" %>
<script>
	function toggleTheme() {
		const body = document.body;
		const icon = document.getElementById("themeIcon");

		body.classList.toggle("dark-mode");
		icon.classList.toggle("fa-sun");
		icon.classList.toggle("fa-moon");

		// Optional: persist theme with localStorage
		if (body.classList.contains("dark-mode")) {
			localStorage.setItem("theme", "dark");
		} else {
			localStorage.setItem("theme", "light");
		}
	}

	// Apply theme on load
	window.onload = function () {
		if (localStorage.getItem("theme") === "dark") {
			document.body.classList.add("dark-mode");
			document.getElementById("themeIcon").classList.remove("fa-moon");
			document.getElementById("themeIcon").classList.add("fa-sun");
		}
	};
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<% } %>
</body>
</html>
