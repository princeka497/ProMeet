<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,ProMeet.utilities.*"%>
<%


response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at theproxyserver
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <%@include file="/common_html/all_css.html"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            font-family: 'Poppins', sans-serif;
            color: white;
        }

        .profile-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .profile-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 30px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: transform 0.3s;
        }

        .profile-card:hover {
            transform: scale(1.05);
        }

        .profile-image {
            height: 120px;
            width: 120px;
            border-radius: 50%;
            border: 3px solid white;
            object-fit: cover;
            margin-bottom: 15px;
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

        .card-text {
            font-size: 14px;
            margin-bottom: 10px;
            text-align: left;
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
        String email = (String) session.getAttribute("sessionEmail");
        if (email == null || session.isNew()) {
            request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
            RequestDispatcher rd = request.getRequestDispatcher("/user/user_login.jsp");
            rd.forward(request, response);
        } else {
            UserDao dao = new UserDao();
            User u = dao.userProfile(email);
            String uploadPath = request.getContextPath();
            String imagePath = uploadPath + "/" + u.getProfile_pic();
    %>

    <%@include file="/user/user_header.html"%>
<br><br><br><br>	
    <div class="profile-container mt-4">
        <div class="profile-card">
            <img class="profile-image" src="<%=imagePath%>" alt="Profile Image">
            <form action="/ProMeet/User_EditProfile" method="post" enctype="multipart/form-data">
                <input type="file" name="profilePic"> 
                <br>
                <div class="mb-3">
                    <p class="card-text"><i class="far fa-envelope"></i> Email:</p>
                    <input type="email" name="email" class="form-control" value="<%=u.getEmail()%>" disabled>
                </div>

                <div class="mb-3">
                    <p class="card-text"><i class="fas fa-user"></i> Name:</p>
                    <input type="text" name="name" class="form-control" required value="<%=u.getName()%>" oninput="checkAlpha(event)" >
                </div>

                <div class="mb-3">
                    <p class="card-text"><i class="fas fa-phone"></i> Phone Number:</p>
                    <input type="text" name="phone" class="form-control" required value="<%=u.getPhone()%>" onkeydown=checkDigit(event)    maxlength="10">
                </div>

                <div class="mb-3">
                    <p class="card-text"><i class="fas fa-city"></i> City:</p>
                    <input type="text" name="city" class="form-control" required value="<%=u.getCity()%>">
                </div>

                <div class="mb-3">
                    <p class="card-text"><i class="fas fa-map-marker-alt"></i> Address:</p>
                    <textarea class="form-control" name="address" rows="3"><%=u.getAddress()%></textarea>
                </div>

                <button class="btn btn-update w-100">
                    <i class="fa fa-save"></i> Update Profile
                </button>
            </form>
        </div>
    </div>

    <% } %>
<br><br><br><br><br>
    <%@include file="/WEB-INF/common/footer.html"%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
