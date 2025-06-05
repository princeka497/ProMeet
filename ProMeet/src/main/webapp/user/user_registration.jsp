<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <%@include file="/common_html/all_css.html"%>
    
    <!-- Bootstrap Icons (Optional) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <style>
        body {
            background: linear-gradient(135deg, #1c1c1c, #3a3a3a);
            color: white;
            font-family: 'Poppins', sans-serif;
        }
        
        .main-container {
            max-width: 500px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
            margin-top: 50px;
        }
        
        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
        }
        
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }
        
        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.3);
            border: 1px solid #6c63ff;
            box-shadow: 0 0 10px rgba(108, 99, 255, 0.6);
        }
        
        .btn-submit {
            background: #6c63ff;
            color: white;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 50px;
            transition: 0.3s;
        }
        
        .btn-submit:hover {
            background: #5248d0;
            transform: scale(1.05);
        }
        
        .alert-custom {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 10px;
        }
        .main-container:hover {
    box-shadow: 0px 0px 30px rgba(108, 99, 255, 0.5);
    transition: box-shadow 0.4s ease-in-out;
}
        
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    
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

    
    
    
    
    $(document).ready(function(){
    	
    	$("#email").change(function(){

    		 let userEmail=$(this).val()
    		    //alert(userEmail)
    	
    

   
 $.ajax({

	url:"/ProMeet/User_Registration",
	type:"GET",
	data:{"uEmail":userEmail},
	success:function(responseData){
    //alert(responseData)
	if(responseData=="true")
		{
	$("#ajaxMsg").text("User Email already exists ")
	//alert(userEmail + "already exists")
		setTimeout(function(){

		$("#email").val("")
	    $("#ajaxMsg").text("")
		},3000)
		}//if close
	}//success  object function close

 })//ajax fucntion close
    		    
  
 })//on change close
  
    
    })//documentReady close

    
    
    
    
    </script>
</head>
<body>
<%@include file="/WEB-INF/common/navbar.html" %>

    <% String mess = (String) request.getAttribute("message"); %>
    <% if (mess != null) { %>
    <div class="alert alert-info alert-dismissible fade show text-center alert-custom mt-3 mx-auto w-50" role="alert">
        <strong><%= mess %></strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>

    <div class="container d-flex justify-content-center">
        <div class="main-container">
            <h2 class="text-center text-white mb-4">📝 User Registration</h2>
            <form action="/ProMeet/User_Registration" method="post" class="needs-validation" enctype="multipart/form-data" novalidate>
                
                <div class="mb-3">
                    <label class="form-label"><i class="far fa-envelope"></i> Email-ID</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Enter Email" required>
                    <span id="ajaxMsg" style="color:red; "></span>
                    <div class="invalid-feedback">Please provide your email.</div>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-lock"></i> Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Enter Password" required>
                    <div class="invalid-feedback">Please provide your password.</div>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="far fa-user"></i> Name</label>
                    <input type="text" name="name" class="form-control" placeholder="Enter Name" required  oninput="checkAlpha(event)">
                    <div class="invalid-feedback">Please provide your name.</div>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-phone-alt"></i> Phone</label>
                    <input type="tel" name="phone" class="form-control" placeholder="Enter Phone Number" required  onkeydown=checkDigit(event)    maxlength="10"  >
                    <div class="invalid-feedback">Please provide your phone number.</div>
                </div>

                <div class="mb-3" >
                    <label class="form-label"><i class="fas fa-city"></i> City</label>
                    <select name="city" class="form-select" style="background: rgba(255, 255, 255, 0.1);" required>
                        <option  value="" selected disabled>Select City</option>
                        <option value="Azamgarh">Azamgarh</option>
                        <option value="Lucknow">Lucknow</option>
                        <option value="Patna">Patna</option>
                        <option value="Mumbai">Mumbai</option>
                        <option value="Noida">Noida</option>
                    </select>
                    <div class="invalid-feedback">Please select your city.</div>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-map-marker-alt"></i> Address</label>
                    <textarea class="form-control" name="address" rows="3" placeholder="Enter your address" required></textarea>
                    <div class="invalid-feedback">Please provide your address.</div>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="far fa-image"></i> Profile Picture</label>
                    <input type="file" class="form-control" name="profilePic" required>
                    <div class="invalid-feedback">Please upload a profile picture.</div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-submit"><i class="fas fa-user-check"></i> Register</button>
                </div>
                
            </form>
        </div>
    </div>
    <script>
$(document).ready(function () {
    // Fade in the registration form
    $(".main-container").hide().fadeIn(1000);

    
    $(".form-control, .form-select, textarea").on("focus", function () {
        $(this).css({
            "transform": "scale(1.02)",
            "transition": "transform 0.2s ease-in-out"
        });
    }).on("blur", function () {
        $(this).css("transform", "scale(1)");
    });


    $(".alert").hide().fadeIn(800).delay(3000).fadeOut(1000);

    // Submit button hover glow effect
    $(".btn-submit").hover(
        function () {
            $(this).css({
                "box-shadow": "0 0 15px rgba(108, 99, 255, 0.8)",
                "letter-spacing": "1px"
            });
        },
        function () {
            $(this).css({
                "box-shadow": "none",
                "letter-spacing": "normal"
            });
        }
    );
});
</script>
    

    <script src="/ProMeet/js/validation.js"></script>
    <br><br>
    <%@include file="/WEB-INF/common/footer.html" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
