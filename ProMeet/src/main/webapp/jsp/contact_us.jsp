<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<%@include file="/common_html/all_css.html"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>



<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>

.navbar {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 1000;
	background: rgba(0, 0, 50, 0.9);
	box-shadow: 0px 4px 10px rgba(0, 128, 255, 0.5);
}


body {
	background: linear-gradient(45deg, #002147, #003366, #004080);
	background-size: 300% 300%;
	animation: gradientMove 8s infinite alternate;
	font-family: "Poppins", sans-serif;
	padding-top: 70px; 
	color: white;
	text-align: center;
}

@
keyframes gradientMove { 0% {
	background-position: 0% 50%;
}

100
%
{
background-position
:
100%
50%;
}
}


.contact-container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	gap: 40px;
	padding: 60px 20px;
}


.image-box {
	width: 400px;
	height: 400px;
	/* background: url("/ProMeet/images/contactpro.jpg") no-repeat center/cover; */
	border-radius: 20px;
	box-shadow: 0px 8px 20px rgba(0, 128, 255, 0.6);
	transition: transform 0.4s ease-in-out, box-shadow 0.3s ease-in-out;
	
}

.image-box:hover {
	transform: scale(1.1);
	box-shadow: 0px 15px 30px rgba(0, 128, 255, 0.8);
}


.contact-form {
	background: rgba(0, 0, 50, 0.6);
	backdrop-filter: blur(15px);
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0px 6px 18px rgba(0, 128, 255, 0.5);
	width: 100%;
	max-width: 500px;
	transition: all 0.3s ease-in-out;
}

.contact-form:hover {
	box-shadow: 0px 10px 30px rgba(0, 128, 255, 0.8);
	transform: scale(1.05);
}

.contact-form h2 {
	font-size: 28px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #00ccff;
}


.input-group {
	background: rgba(255, 255, 255, 0.1);
	border-radius: 5px;
	overflow: hidden;
	margin-bottom: 15px;
}

.input-group-text {
	background: rgba(255, 255, 255, 0.2);
	color: #00ccff;
	border: none;
	padding: 12px;
}

.form-control {
	background: rgba(255, 255, 255, 0.1);
	color: white;
	border: none;
	padding: 12px;
	font-size: 16px;
	width: 100%;
	transition: all 0.3s ease-in-out;
}

.form-control:focus {
	background: rgba(255, 255, 255, 0.2);
	outline: none;
	box-shadow: 0px 0px 15px #00ccff;
}

::placeholder {
	color: rgba(255, 255, 255, 0.7);
}


.submit-btn {
	background: linear-gradient(45deg, #0066ff, #00ccff);
	border: none;
	padding: 12px;
	color: black;
	font-size: 18px;
	font-weight: bold;
	border-radius: 25px;
	width: 100%;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	box-shadow: 0px 4px 10px rgba(0, 128, 255, 0.5);
}

.submit-btn:hover {
	background: linear-gradient(45deg, #00ccff, #0066ff);
	transform: scale(1.1);
	box-shadow: 0px 8px 20px rgba(0, 128, 255, 0.8);
}

@media ( max-width : 768px) {
	.contact-container {
		flex-direction: column;
	}
	.image-box {
		width: 320px;
		height: 320px;
	}
}
#img1{
width: 400px;
	height: 400px;
}
</style>
<script>
function changeImage() {
    let img = document.getElementById("img1");
    console.log(img);
    img.src = "/ProMeet/images/download.jpg";
}

function replaceImage() {
    let im = document.getElementById("img1");
    console.log(im);
    im.src = "/ProMeet/images/promeet1.jpg";
}


function checkAlpha(event)
{
console.log(event)// it is an object -> property -> value and functions
let data=event.target.value
//alert(data)
//const regex = /^[a-z ]*$/i; /
const regEx=/^[a-zA-Z ]*$/			//^means start of string and$means End * means 0 or more times
if(!regEx.test(data))
{
event.target.value=data.replace(/[^a-zA-Z ]/g, '');//^means apart from these charachers
/* alert("only alphabets are allowed ") */
Swal.fire({
	  title: "Format Error",
	  text: "Only Alphabets Are Allowed",
	  icon: "error"
	});
}

}//check Alpha Close

function checkDigit(event) {
    let data = event.target.value;
    
  
    if (event.key === "Backspace" || event.key === "Delete" || event.key === "ArrowLeft" || event.key === "ArrowRight") {
        return;
    }

    
    if (data.length >= 10 && event.key !== "Backspace" && event.key !== "Delete") {
        /* alert("Only 10 digits are allowed"); */
        Swal.fire({
	  title: "Format Error",
	  text: "Only 10 Digit Are Allowed",
	  icon: "error"
	});
        event.preventDefault();  
        return;
    }

   
    const regEx = /^[0-9]*$/;
    if (!regEx.test(data + event.key)) {
        /* alert("Only digits are allowed"); */
        Swal.fire({
	  title: "Format Error",
	  text: "Only Digit Are Allowed",
	  icon: "error"
	});
        event.preventDefault();  
    }
}


</script>
</head>
<body>

	<!-- Fixed Navbar -->
	<%@include file="/WEB-INF/common/navbar.html"%>
	<%
	String mess = (String) request.getAttribute("message");
	if (mess != null) {
	%>
	<div class="alert alert-info alert-dismissible fade show" role="alert">
		<h4><%=mess%></h4>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
	}
	%>


	<!-- Contact Section -->
	<div class="contact-container">
		<!-- Contact Form -->
		<div class="contact-form">
			<h2>📩 Contact_Us</h2>
			<form action="/ProMeet/Contact_Us" method="post">
				<div class="input-group">
					<span class="input-group-text"><i class="fa fa-user"></i></span> <input
						type="text" class="form-control" name="name"
						placeholder="Enter Your Name" required  oninput="checkAlpha(event)">
				</div>
				<div class="input-group">
					<span class="input-group-text"><i class="fa fa-envelope"></i></span>
					<input type="email" class="form-control" name="email"
						placeholder="Enter Your Email" required>
				</div>
				<div class="input-group">
					<span class="input-group-text"><i class="fa fa-phone"></i></span> <input
						type="text" class="form-control" name="phone"
						placeholder="Enter Your Phone No" required  onkeydown=checkDigit(event)    maxlength="10" >
				</div>
				<div class="input-group">
					<span class="input-group-text"><i class="far fa-comment"></i></span>
					<textarea class="form-control" name="query"
						placeholder="Type Your Query Here" required></textarea>
				</div>
				<button type="submit" class="submit-btn">
					<i class="fa fa-paper-plane"></i> Send Message
				</button>
			</form>
		</div>

		<!-- Image Box -->
		<div class="image-box" >
		<img  id="img1" alt="" src="/ProMeet/images/contactpro.jpg"  onmouseover="changeImage()" onmouseout="replaceImage()">
		</div>
	</div>

	<!-- Footer -->
	<%@include file="/WEB-INF/common/footer.html"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
