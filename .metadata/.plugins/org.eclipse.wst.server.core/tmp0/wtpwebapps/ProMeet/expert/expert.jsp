<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expert Registration</title>
<%@include file="/common_html/all_css.html"%>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>

.navbar, .footer {
    background: #222;
    color: white;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}


body {
            background: linear-gradient(135deg, #1c1c1c, #3a3a3a);
            color: white;
            font-family: 'Poppins', sans-serif;
        }


.main-cont {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(12px);
    box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2);
    padding: 30px;
    border-radius: 15px;
    max-width: 500px;
    width: 100%;
    margin: auto;
    animation: fadeInUp 1s ease-in-out;
}


.input-group-text {
    background: #333;
    color: white;
    border: none;
    border-radius: 10px 0 0 10px;
}

.form-control, .form-select {
    background: rgba(255, 255, 255, 0.9);
    color: black;
    border: 1px solid #ccc;
    border-radius: 10px;
}

.form-control:focus, .form-select:focus {
    border-color: #007bff;
    box-shadow: 0px 0px 10px #007bff;
}


.btn-submit {
    background: linear-gradient(45deg, #007bff, #0056b3);
    color: white;
    font-weight: bold;
    padding: 12px;
    width: 100%;
    border-radius: 10px;
    transition: 0.3s ease-in-out;
}

.btn-submit:hover {
    background: linear-gradient(45deg, #0056b3, #007bff);
}


@media (max-width: 768px) {
    .main-cont {
        width: 90%;
    }
}


@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
<script>
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

<%
    String mess = (String) request.getAttribute("message");
    if (mess != null) {
%>
<div class="alert alert-success alert-dismissible fade show text-center" role="alert">
    <h4><%= mess %></h4>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<%
    }
%>


<%@include file="/WEB-INF/common/navbar.html"%>
<br>
<div class="container">
    <div class="main-cont">
        <h2 class="text-center text-white mb-4">📝 Expert Registration</h2>

        <form action="/ProMeet/Expert_Registration" method="post" class="needs-validation" enctype="multipart/form-data" novalidate>
            
            <!-- Email -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="far fa-envelope"></i></span>
                <input type="email" name="email" class="form-control" placeholder="Email" required>
            </div>

            <!-- Password -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fa fa-lock"></i></span>
                <input type="password" name="password" class="form-control" placeholder="Password" required>
            </div>

            <!-- Name -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="far fa-user"></i></span>
                <input type="text" name="name" class="form-control" placeholder="Full Name" required oninput="checkAlpha(event)">
            </div>

            <!-- Phone -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                <input type="text" name="phone" class="form-control" placeholder="Phone Number" required  onkeydown=checkDigit(event)    maxlength="10" >
            </div>

            <!-- City -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-city"></i></span>
                <select name="city" class="form-select" required>
                    <option value="" disabled selected>Select City</option>
                    <option value="Azamgarh">Azamgarh</option>
                    <option value="Lucknow">Lucknow</option>
                    <option value="Patna">Patna</option>
                    <option value="Mumbai">Mumbai</option>
                    <option value="Noida">Noida</option>
                </select>
            </div>

            <!-- Expert Type -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-briefcase"></i></span>
                <select name="expert_type" class="form-select" required>
                    <option value="" disabled selected>Select Expert Type</option>
                    <option value="Yoga Expert">Yoga Expert</option>
                    <option value="Dietician">Dietician</option>
                    <option value="Doctor">Doctor</option>
                    <option value="Lawyer">Lawyer</option>
                    <option value="Gym Trainer">Gym Trainer</option>
                </select>
            </div>

            <!-- Gender -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-venus-mars"></i></span>
                <select name="gender" class="form-select" required>
                    <option value="" disabled selected>Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Transgender">Transgender</option>
                </select>
            </div>

            <!-- Address -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fa fa-home"></i></span>
                <textarea class="form-control" name="address" placeholder="Your Address" rows="3" required></textarea>
            </div>


            <div class="mb-3">
                <label class="form-label">Upload Profile Picture</label>
                <input type="file" class="form-control" name="profile_pic" required>
            </div>


            <div class="mb-3">
                <label class="form-label">Upload Verification Document</label>
                <input type="file" class="form-control" name="verification_document" required>
            </div>

            <div class="text-center">
                <button class="btn btn-submit"><i class="fas fa-paper-plane"></i> Register</button>
            </div>

        </form>
    </div>
</div>
<br>


<%@include file="/WEB-INF/common/footer.html"%>

<script src="/ProMeet/js/validation.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
